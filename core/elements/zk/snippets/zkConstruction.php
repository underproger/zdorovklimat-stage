<?php
/**
 * zkConstruction — дані блоків шаблону «Будівельна послуга 2026» (макет 10.2026, «Будівництво складів»).
 * &id — сторінка послуги або напряму.
 *
 * Вміст редагується в адмінці через TV (MIGX):
 *   cs-sections — заголовки/тексти блоків (ключ блоку, надзаголовок, заголовок, текст, примітка, фото для банера CTA)
 *   cs-approach — «Наш підхід»: етапи (назва, текст)
 *   cs-types    — типи об’єктів: фото, назва, текст
 *   cs-build    — «Як ми будуємо»: фото, назва, текст
 *   cs-tech     — технології: фото, назва, текст, пункти (по рядку), посилання (id сторінки або URL)
 *   cs-factors  — «Враховуємо все»: іконка, фото, назва, текст
 *   cs-objects  — id сторінок об’єктів через кому для слайдера «Реалізовані об’єкти»
 * Якщо поле послуги порожнє — береться з батьківського напряму (спільні етапи, технології, банер).
 * Фото — шлях від assets/images/ (джерело медіа «Images»).
 * Повертає JSON.
 */
/** @var modX $modx */
/** @var array $scriptProperties */
$id = (int) $modx->getOption('id', $scriptProperties, 0);
$res = $id ? $modx->getObject('modResource', $id) : null;
if (!$res) return '{}';
$modx->lexicon->load('zdorovklimat:home');

$csTpl = $res->get('template');
$parent = $res->get('parent') ? $modx->getObject('modResource', $res->get('parent')) : null;
// батьківський напрям — якщо він на тому ж шаблоні
$dir = ($parent && $parent->get('template') == $csTpl) ? $parent : null;

$raw = function (modResource $r, $name) use ($modx) {
    $tv = $modx->getObject('modTemplateVar', ['name' => $name]);
    return $tv ? trim((string) $tv->getValue($r->get('id'))) : '';
};
$rows = function (modResource $r, $name) use ($raw) {
    $v = json_decode($raw($r, $name), true);
    return is_array($v) ? array_values(array_filter($v, 'is_array')) : [];
};
$pick = function ($name) use ($res, $dir, $rows) {
    $v = $rows($res, $name);
    if (!$v && $dir) $v = $rows($dir, $name);
    return $v;
};
$url = function ($p) {
    $p = trim((string) $p);
    if ($p === '' || preg_match('#^https?://#', $p)) return $p;
    return '/' . implode('/', array_map('rawurlencode', explode('/', ltrim($p, '/'))));
};
$thumb = function ($p, $options) use ($modx, $url) {
    $p = trim((string) $p);
    if ($p === '') return '';
    $p = preg_replace('#^(\./|/)+#', '', $p);
    if (strpos($p, 'assets/') !== 0) $p = 'assets/images/' . $p;
    if (preg_match('/[^\x20-\x7E]/', $p) || strpos($p, ' ') !== false || !is_file(MODX_BASE_PATH . $p)) return $url($p);
    $t = (string) $modx->runSnippet('pthumb', ['input' => $p, 'options' => $options]);
    $t = preg_replace('#^(\[\[!?\+\+url_site\]\]|https?://[^/]+)?/*#', '', trim($t));
    return $t === '' ? $url($p) : '/' . $t;
};
$txt = function ($v) { return trim((string) $v); };

$out = [];

// тексти блоків: значення напряму, поверх — значення послуги
$sec = [];
foreach ([$dir ? $rows($dir, 'cs-sections') : [], $rows($res, 'cs-sections')] as $src) {
    foreach ($src as $row) {
        $k = $txt($row['key'] ?? '');
        if ($k === '') continue;
        foreach (['eyebrow', 'title', 'text', 'note', 'image'] as $f) {
            if ($txt($row[$f] ?? '') !== '') $sec[$k][$f] = $txt($row[$f]);
        }
    }
}
if (!empty($sec['cta']['image'])) $sec['cta']['img'] = $thumb($sec['cta']['image'], 'w=1920&h=640&zc=1&q=78&f=jpg');
$out['sections'] = $sec ?: new stdClass();

$out['approach'] = [];
foreach ($pick('cs-approach') as $r) {
    if ($txt($r['title'] ?? '') === '') continue;
    $out['approach'][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? '')];
}
$out['types'] = [];
foreach ($pick('cs-types') as $r) {
    if ($txt($r['title'] ?? '') === '') continue;
    $out['types'][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? ''), 'img' => $thumb($r['image'] ?? '', 'w=760&h=470&zc=1&q=78&f=jpg')];
}
$out['build'] = [];
foreach ($pick('cs-build') as $r) {
    if ($txt($r['title'] ?? '') === '') continue;
    $out['build'][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? ''), 'img' => $thumb($r['image'] ?? '', 'w=640&h=480&zc=1&q=78&f=jpg')];
}
$out['tech'] = [];
foreach ($pick('cs-tech') as $r) {
    if ($txt($r['title'] ?? '') === '') continue;
    $link = $txt($r['link'] ?? '');
    if (ctype_digit($link)) $link = $modx->makeUrl((int) $link) ?: '';
    $bul = array_values(array_filter(array_map('trim', preg_split('/\r?\n/', (string) ($r['bullets'] ?? '')))));
    $out['tech'][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? ''), 'bullets' => $bul, 'link' => $link,
        'img' => $thumb($r['image'] ?? '', 'w=1100&h=680&zc=1&q=78&f=jpg')];
}
$out['factors'] = [];
foreach ($pick('cs-factors') as $r) {
    if ($txt($r['title'] ?? '') === '') continue;
    $out['factors'][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? ''), 'icon' => preg_replace('/[^a-z0-9-]/', '', $txt($r['icon'] ?? '')),
        'img' => $thumb($r['image'] ?? '', 'w=420&h=420&zc=1&q=76&f=jpg')];
}

// блоки універсального шаблону послуги: прості списки (порожньо в послузі — беруться з напряму)
$link = function ($v) use ($modx, $txt, $id) {
    $v = $txt($v);
    if ($v !== '' && ctype_digit($v)) return (int) $v === $id ? '' : ($modx->makeUrl((int) $v) ?: '');
    return $v;
};
$simple = [
    'tasks' => ['cs-tasks', ['task', 'solution']],
    'result' => ['cs-result', ['title', 'text']],
    'specs' => ['cs-specs', ['param', 'value']],
    'compare' => ['cs-compare', ['criterion', 'a', 'b']],
    'options' => ['cs-options', ['title', 'text', 'link']],
    'stages' => ['cs-stages', ['title', 'text']],
    'timing' => ['cs-timing', ['title', 'text']],
    'docs' => ['cs-docs', ['title', 'text']],
    'why' => ['cs-why', ['title', 'text']],
    'quality' => ['cs-quality', ['title', 'text']],
    'warranty' => ['cs-warranty', ['title', 'text']],
];
foreach ($simple as $key => list($tvName, $fields)) {
    $out[$key] = [];
    foreach ($pick($tvName) as $r) {
        $row = [];
        foreach ($fields as $f) $row[$f] = $f === 'link' ? $link($r[$f] ?? '') : $txt($r[$f] ?? '');
        if ($row[$fields[0]] === '') continue;
        $out[$key][] = $row;
    }
}
// вартість: рядки з групою — що впливає (factor), що входить (included), окремо (extra), що потрібно для розрахунку (input)
$out['price'] = ['factor' => [], 'included' => [], 'extra' => [], 'input' => []];
foreach ($pick('cs-price') as $r) {
    $g = $txt($r['group'] ?? 'factor');
    if (!isset($out['price'][$g])) $g = 'factor';
    if ($txt($r['title'] ?? '') === '') continue;
    $out['price'][$g][] = ['title' => $txt($r['title']), 'text' => $txt($r['text'] ?? '')];
}
if (!array_filter($out['price'])) $out['price'] = [];
// «Що отримує замовник» — фото блоку з тексту розділу
if (!empty($sec['result']['image'])) $out['sections']['result']['img'] = $thumb($sec['result']['image'], 'w=1100&h=820&zc=1&q=78&f=jpg');

// реалізовані об’єкти: cs-objects послуги → напряму → &objects
$ids = $raw($res, 'cs-objects');
if ($ids === '' && $dir) $ids = $raw($dir, 'cs-objects');
if ($ids === '') $ids = (string) $modx->getOption('objects', $scriptProperties, '');
$out['objects'] = [];
$imgTv = $modx->getObject('modTemplateVar', ['name' => 'object-img']);
$dateTv = $modx->getObject('modTemplateVar', ['name' => 'object-date']);
foreach (array_filter(array_map('intval', explode(',', $ids))) as $oid) {
    $o = $modx->getObject('modResource', ['id' => $oid, 'published' => 1, 'deleted' => 0]);
    if (!$o) continue;
    $img = $imgTv ? trim((string) $imgTv->getValue($oid)) : '';
    $img = str_replace('ru/', '', preg_replace('#^(\./|/)+#', '', $img));
    if ($img !== '' && strpos($img, 'assets/') !== 0) $img = 'works/' . $img;
    $cat = $modx->lexicon('zk.cat.' . $o->get('parent'));
    $date = $dateTv ? trim((string) $dateTv->getValue($oid)) : '';
    $year = preg_match('/(20\d\d|19\d\d)/', $date, $m) ? $m[1] : '';
    $out['objects'][] = ['id' => $oid, 'title' => $o->get('pagetitle'), 'url' => $modx->makeUrl($oid),
        'cat' => $cat !== 'zk.cat.' . $o->get('parent') ? $cat : '', 'year' => $year,
        'img' => $thumb($img, 'w=760&h=470&zc=1&q=78&f=jpg')];
}
// відгуки: послуга, напрям і сусідні послуги напряму (без повторів), до 9
$readReviews = function (modResource $r) use ($rows) {
    $l = [];
    foreach ($rows($r, 'mig_reviews') as $x) {
        $t = trim(strip_tags((string) ($x['text-reviews'] ?? '')));
        if ($t !== '') $l[] = ['name' => trim(strip_tags((string) ($x['name-reviews'] ?? ''))), 'text' => $t];
    }
    return $l;
};
$pool = [$res];
if ($dir) {
    $pool[] = $dir;
    foreach ($modx->getCollection('modResource', ['parent' => $dir->get('id'), 'published' => 1, 'deleted' => 0, 'id:!=' => $res->get('id')]) as $sib) $pool[] = $sib;
} else {
    foreach ($modx->getCollection('modResource', ['parent' => $res->get('id'), 'published' => 1, 'deleted' => 0]) as $kid) $pool[] = $kid;
}
$out['reviews'] = []; $seen = [];
foreach ($pool as $r) {
    foreach ($readReviews($r) as $x) {
        $k = md5(mb_strtolower($x['text']));
        if (isset($seen[$k])) continue;
        $seen[$k] = 1;
        $x['initial'] = mb_strtoupper(mb_substr($x['name'] !== '' ? $x['name'] : '—', 0, 1));
        $out['reviews'][] = $x;
        if (count($out['reviews']) >= 9) break 2;
    }
}

$out['objectsAll'] = $modx->makeUrl($res->get('context_key') == 'Russian' ? 1295 : 26);

return json_encode($out, JSON_UNESCAPED_UNICODE);