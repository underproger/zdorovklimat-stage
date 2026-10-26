<?php
/**
 * Сторінка «Відгуки» (новий дизайн 2026): відгуки easyComm + налаштування форми.
 *
 * Відгуки з форми потрапляють у гілку easyComm «resource-<id сторінки>» і з’являються на сайті
 * лише після того, як менеджер опублікує їх у компоненті easyComm (модерація).
 *
 * &threads — гілки через кому, з яких показувати відгуки (за замовчуванням — гілка поточної сторінки)
 * &limit   — скільки відгуків максимум (0 — усі)
 *
 * Повертає JSON: thread (ім’я гілки для форми), antispam (поле-пастка), items[], count, countLabel, avg.
 * Лексикон zdorovklimat:reviews має бути завантажений до виклику (форми слова «відгук»).
 */
/** @var modX $modx */
/** @var array $scriptProperties */
$id = (int) $modx->resource->get('id');
$modx->addPackage('easycomm', $modx->getOption('ec_core_path', null, MODX_CORE_PATH . 'components/easycomm/') . 'model/');
$ua = $modx->context->get('key') == 'web';
$site = rtrim($modx->getOption('site_url'), '/') . '/';

// ---------- гілка для форми (те саме, що робив ecForm, але без jQuery-скриптів easyComm) ----------
$name = 'resource-' . $id;
$defaults = [
    'thread' => $name,
    'formId' => $name,
    'allowedFields' => 'user_name,user_email,user_contacts,rating,text',
    'requiredFields' => 'user_name,text',
    'antispamField' => 'zk_hp',
    'autoPublish' => '',
    'tplSuccess' => '',
    'newEmailSubjManager' => 'Новий відгук на сайті ' . $site,
    'tplNewEmailManager' => 'tpl.ecForm.New.Email.Manager.My.UA',
    'newEmailSubjUser' => 'Ви залишили відгук на сайті ' . $site,
    'tplNewEmailUser' => 'tpl.ecForm.New.Email.User.My.UA',
    'updateEmailSubjUser' => 'Повідомлення по вашому відгуку на сайті ' . $site,
    'tplUpdateEmailUser' => 'tpl.ecForm.Update.Email.User.My.UA',
];
$thread = $modx->getObject('ecThread', ['name' => $name]);
if (!$thread) {
    $thread = $modx->newObject('ecThread');
    $thread->fromArray(['resource' => $id, 'name' => $name, 'title' => '']);
}
$props = $thread->get('properties');
$props = is_array($props) ? $props : [];
// старий шаблон форми повертав HTML у старій верстці — повідомлення про успіх тепер у лексиконі;
// поле-пастка для ботів не «address», бо браузери автозаповнюють адресу
$merged = array_merge($defaults, $props, ['tplSuccess' => '', 'allowedFields' => $defaults['allowedFields'], 'antispamField' => 'zk_hp']);
if ($thread->isNew() || $merged != $props) {
    $thread->set('properties', $merged);
    $thread->save();
}

// ---------- опубліковані відгуки ----------
$threads = array_filter(array_map('trim', explode(',', $modx->getOption('threads', $scriptProperties, $name))));
$limit = (int) $modx->getOption('limit', $scriptProperties, 0);
$q = $modx->newQuery('ecMessage');
$q->innerJoin('ecThread', 'Thread', 'Thread.id = ecMessage.thread');
$q->where([
    'Thread.name:IN' => $threads ?: [$name],
    'ecMessage.published' => 1,
    'ecMessage.deleted' => 0,
]);
$q->sortby('ecMessage.date', 'DESC');
$q->sortby('ecMessage.id', 'DESC');
if ($limit > 0) $q->limit($limit);

$text = function ($s) {
    $s = html_entity_decode(strip_tags((string) $s), ENT_QUOTES, 'UTF-8');
    $s = trim(preg_replace("#\r\n?#", "\n", $s));
    $s = preg_replace("#\n{3,}#", "\n\n", $s);
    $s = preg_replace('#[ \t]{2,}#', ' ', $s);
    return nl2br(htmlspecialchars($s, ENT_QUOTES, 'UTF-8'), false);
};
$items = [];
$sum = 0;
$rated = 0;
foreach ($modx->getIterator('ecMessage', $q) as $m) {
    $body = $text($m->get('text'));
    if ($body === '') continue;
    $rating = max(0, min(5, (int) $m->get('rating')));
    if ($rating) {
        $sum += $rating;
        $rated++;
    }
    $ts = strtotime((string) $m->get('date'));
    $items[] = [
        'id' => (int) $m->get('id'),
        'name' => htmlspecialchars(trim(html_entity_decode((string) $m->get('user_name'), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8'),
        'company' => htmlspecialchars(trim(html_entity_decode((string) $m->get('user_contacts'), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8'),
        'date' => $ts ? date('Y-m-d', $ts) : '',
        'rating' => $rating,
        'text' => $body,
        'long' => mb_strlen(strip_tags($body)) > 420,
        'replyAuthor' => htmlspecialchars(trim(strip_tags((string) $m->get('reply_author'))), ENT_QUOTES, 'UTF-8'),
        'reply' => $text($m->get('reply_text')),
    ];
}

$n = count($items);
$forms = explode('|', (string) $modx->lexicon('zkr.list.forms'));
$n10 = $n % 10;
$n100 = $n % 100;
$form = ($n10 == 1 && $n100 != 11) ? 0 : (($n10 >= 2 && $n10 <= 4 && ($n100 < 10 || $n100 >= 20)) ? 1 : 2);

return json_encode([
    'thread' => $name,
    'antispam' => $merged['antispamField'],
    'items' => $items,
    'count' => $n,
    'countLabel' => $n . ' ' . ($forms[$form] ?? ($forms[0] ?? '')),
    'avg' => $rated ? round($sum / $rated, 1) : 0,
], JSON_UNESCAPED_UNICODE);