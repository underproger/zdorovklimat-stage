<?php
/**
 * Сторінка «Відгуки» (новий дизайн 2026): відгуки easyComm + налаштування форми.
 *
 * Відгуки з форми потрапляють у гілку easyComm «resource-<id сторінки>» і з’являються на сайті
 * лише після того, як менеджер опублікує їх у компоненті easyComm (модерація).
 *
 * &threads — гілки через кому, з яких показувати відгуки (за замовчуванням — гілка поточної сторінки)
 * &limit   — скільки відгуків максимум (0 — усі)
 * &pages   — 1: додати відгуки зі сторінок послуг (TV mig_reviews) поточної мови, без повторів, з джерелом і напрямом
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
        'cat' => 'site',
        'source' => 'site',
    ];
}

// ---------- відгуки зі сторінок послуг (поле «Отзывы» / mig_reviews) ----------
$key = function ($s) { return mb_substr(preg_replace('/[^\p{L}\p{N}]+/u', '', mb_strtolower(html_entity_decode(strip_tags((string) $s), ENT_QUOTES, 'UTF-8'))), 0, 160); };
$seen = [];
foreach ($items as $it) $seen[$key($it['text'])] = 1;
$cats = [];
if ((int) $modx->getOption('pages', $scriptProperties, 0)) {
    $ctx = $modx->context->get('key');
    $root = $ctx == 'web' ? 25 : 1289;
    $tvR = $modx->getObject('modTemplateVar', ['name' => 'mig_reviews']);
    $dirs = $modx->getCollection('modResource', $modx->newQuery('modResource', ['parent' => $root, 'published' => 1, 'deleted' => 0])->sortby('menuindex', 'ASC'));
    foreach ($dirs as $dir) {
        $ids = array_merge([$dir->get('id')], $modx->getChildIds($dir->get('id'), 10, ['context' => $ctx]));
        $q = $modx->newQuery('modResource', ['id:IN' => $ids, 'published' => 1, 'deleted' => 0]);
        $q->sortby('parent', 'ASC');
        $q->sortby('menuindex', 'ASC');
        $pages = [];
        foreach ($modx->getIterator('modResource', $q) as $r) $pages[$r->get('id')] = $r;
        // напрям першим, далі — у порядку дерева
        uksort($pages, function ($a, $b) use ($ids) { return array_search($a, $ids) - array_search($b, $ids); });
        $dirCount = 0;
        foreach ($pages as $pid => $r) {
            $raw = $tvR ? json_decode((string) $tvR->getValue($pid), true) : null;
            if (!is_array($raw)) continue;
            foreach ($raw as $x) {
                if (!is_array($x)) continue;
                $body = $text($x['text-reviews'] ?? '');
                $k = $key($body);
                if ($body === '' || $k === '' || isset($seen[$k])) continue;
                $seen[$k] = 1;
                $items[] = [
                    'id' => 0,
                    'name' => htmlspecialchars(trim(html_entity_decode(strip_tags((string) ($x['name-reviews'] ?? '')), ENT_QUOTES, 'UTF-8')), ENT_QUOTES, 'UTF-8'),
                    'company' => '',
                    'date' => '',
                    'rating' => 5,
                    'text' => $body,
                    'long' => mb_strlen(strip_tags($body)) > 420,
                    'replyAuthor' => '',
                    'reply' => '',
                    'cat' => (string) $dir->get('id'),
                    'source' => 'page',
                    'sourceTitle' => htmlspecialchars(trim($r->get('menutitle') ?: $r->get('pagetitle')), ENT_QUOTES, 'UTF-8'),
                    'sourceUrl' => $modx->makeUrl($pid),
                ];
                $dirCount++;
            }
        }
        if ($dirCount) $cats[] = ['id' => (string) $dir->get('id'), 'name' => htmlspecialchars(trim($dir->get('menutitle') ?: $dir->get('pagetitle')), ENT_QUOTES, 'UTF-8'), 'n' => $dirCount];
    }
    $siteN = count(array_filter($items, function ($i) { return $i['source'] === 'site'; }));
    if ($siteN) array_unshift($cats, ['id' => 'site', 'name' => $modx->lexicon('zkr.list.site'), 'n' => $siteN]);
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
    // середню оцінку показуємо лише для відгуків з форми, без відгуків зі сторінок послуг (у них немає оцінки)
    'avg' => ($rated && !$cats) ? round($sum / $rated, 1) : 0,
    'cats' => $cats,
], JSON_UNESCAPED_UNICODE);