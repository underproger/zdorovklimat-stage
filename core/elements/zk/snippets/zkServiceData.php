<?php
/**
 * zkServiceData — дані сторінки послуги / напряму для нового дизайну 2026.
 * Збирає в один JSON вміст сторінки, що зберігся зі старої версії (тексти, ціни, FAQ, відео, бренди),
 * для шаблонів «Послуга 2026 (повна)» і «Будівельна послуга 2026» (нові блоки — zkConstruction).
 *
 * &id     — ресурс (за замовчуванням поточний)
 * &root   — id розділу «Послуги» поточної мови (для крошок)
 * &tree   — 1: для кожної дочірньої сторінки додати список її дочірніх (каталог на сторінці «Послуги»)
 * Повертає JSON. Порожні блоки — порожні масиви / рядки, шаблон показує лише заповнене.
 */
$id = (int) $modx->getOption('id', $scriptProperties, $modx->resource ? $modx->resource->get('id') : 0);
$root = (int) $modx->getOption('root', $scriptProperties, 0);
$tree = (bool) $modx->getOption('tree', $scriptProperties, false);
// direction — сторінка напряму: без окремого вступного тексту content іде в SEO-блок унизу (як на старих «лендах»)
$mode = $modx->getOption('mode', $scriptProperties, 'service');
/** @var modResource $res */
$res = $modx->getObject('modResource', $id);
if (!$res) {
    return '{}';
}
$modx->lexicon->load('zdorovklimat:home');

// ---------- helpers ----------
$tv = function (modResource $r, $name) {
    $v = $r->getTVValue($name);
    return is_string($v) ? trim($v) : '';
};
$json = function ($v) {
    if (is_array($v)) return $v;
    $a = json_decode((string) $v, true);
    return is_array($a) ? $a : [];
};
// шлях до файлу з урахуванням джерела медіа (значення буває «./x.jpg», «/x.jpg», «x.jpg» або вже «assets/...»)
$path = function ($v, $base) {
    $v = trim(str_replace('\\', '/', (string) $v));
    if ($v === '') return '';
    if (preg_match('#^https?://#', $v)) return $v;
    $v = preg_replace('#^(\./|/)+#', '', $v);
    $v = str_replace('/./', '/', $v);
    if (strpos($v, 'assets/') !== 0) $v = rtrim($base, '/') . '/' . $v;
    // повний шлях у полі з джерелом медіа дає «assets/images/design/assets/images/design/x.jpg»
    $v = preg_replace('#^assets/images/[^/]+/(assets/)#', '$1', $v);
    // «../works/x.jpg» відносно джерела медіа — фото з іншої папки (об’єкти, «Наші роботи» інших послуг)
    while (strpos($v, '/../') !== false) {
        $n = preg_replace('#[^/]+/\.\./#', '', $v, 1);
        if ($n === $v) break;
        $v = $n;
    }
    return $v;
};
$url = function ($p) {
    if ($p === '' || preg_match('#^https?://#', $p)) return $p;
    return '/' . implode('/', array_map('rawurlencode', explode('/', ltrim($p, '/'))));
};
$thumb = function ($p, $options) use ($modx, $url) {
    if ($p === '') return '';
    if (preg_match('#^https?://#', $p) || preg_match('/[^\x20-\x7E]/', $p) || strpos($p, ' ') !== false || !is_file(MODX_BASE_PATH . $p)) {
        return $url($p);
    }
    $t = (string) $modx->runSnippet('pthumb', ['input' => $p, 'options' => $options]);
    $t = preg_replace('#^(\[\[!?\+\+url_site\]\]|https?://[^/]+)?/*#', '', trim($t));
    return $t === '' ? $url($p) : '/' . $t;
};
$label = function (modResource $r) use ($modx) {
    $key = 'zk.svc.' . $r->get('id');
    $short = $modx->lexicon($key);
    if ($short !== $key) return $short;
    return $r->get('menutitle') ?: $r->get('pagetitle');
};
$plural = function ($n, $forms) {
    $f = explode('|', $forms);
    if (count($f) < 3) return $n . ' ' . $forms;
    $n10 = $n % 10; $n100 = $n % 100;
    $i = ($n10 == 1 && $n100 != 11) ? 0 : (($n10 >= 2 && $n10 <= 4 && ($n100 < 10 || $n100 >= 20)) ? 1 : 2);
    return $n . ' ' . $f[$i];
};
$kids = function ($parentId) use ($modx) {
    $q = $modx->newQuery('modResource');
    $q->where(['parent' => $parentId, 'published' => 1, 'deleted' => 0]);
    $q->sortby('menuindex', 'ASC');
    $q->sortby('id', 'ASC');
    return $modx->getCollection('modResource', $q);
};
$clean = function ($html) {
    $html = trim((string) $html);
    if ($html === '') return '';
    // Google Docs-сміття та порожні абзаци
    $html = preg_replace('#\s(?:dir="ltr"|id="docs-internal-guid-[^"]*")#u', '', $html);
    $html = preg_replace_callback('#<(p|div|h[2-6])[^>]*>(?:(?!<(?:p|div)[\s>]).)*?</\1>#su', function ($m) {
        $t = preg_replace('#[\s\x{00A0}]+#u', '', html_entity_decode(strip_tags($m[0], '<img><iframe>'), ENT_QUOTES, 'UTF-8'));
        return $t === '' ? '' : $m[0];
    }, $html);
    $html = preg_replace('#<h1(\s|>)#', '<h2$1', $html);
    $html = str_replace('</h1>', '</h2>', $html);
    $html = preg_replace('#<img(?![^>]*\bloading=)#i', '<img loading="lazy" decoding="async"', $html);
    return trim($html) === '' || trim(strip_tags($html, '<img><iframe>')) === '' ? '' : $html;
};
$ytId = function ($s) {
    return preg_match('#(?:youtube(?:-nocookie)?\.com/(?:embed/|watch\?v=|shorts/)|youtu\.be/)([\w-]{11})#', (string) $s, $m) ? $m[1] : '';
};

$out = [
    'id' => $id,
    'title' => $res->get('pagetitle'),
    'label' => $label($res),
    'intro' => trim(strip_tags((string) $res->get('introtext'))),
];

// ---------- зображення першого екрана ----------
$img = $path($tv($res, 'services-img'), 'assets/images/design/');
// окреме фото банера (поле «Фото першого екрана», від assets/images/) — без обрізання, композицію тримає CSS
$banner = $path($tv($res, 'banner-image'), 'assets/images/');
$out['heroImg'] = $banner !== '' ? $thumb($banner, 'w=2000&q=80&f=jpg') : $thumb($img, 'w=1600&h=1000&zc=1&q=78&f=jpg');
$out['cardImg'] = $thumb($img, 'w=760&h=520&zc=1&q=78&f=jpg');

// ---------- ієрархія ----------
$parent = $res->get('parent') ? $modx->getObject('modResource', $res->get('parent')) : null;
$out['parent'] = ($parent && $parent->get('id') != $root) ? ['id' => (int) $parent->get('id'), 'title' => $label($parent)] : null;
$trail = [];
$p = $parent;
while ($p && $p->get('id') != $root && count($trail) < 6) {
    array_unshift($trail, ['id' => (int) $p->get('id'), 'title' => $label($p)]);
    $p = $p->get('parent') ? $modx->getObject('modResource', $p->get('parent')) : null;
}
$out['trail'] = $trail;

$children = [];
foreach ($kids($id) as $k) {
    $kimg = $path($tv($k, 'services-img'), 'assets/images/design/');
    $sub = $modx->getCount('modResource', ['parent' => $k->get('id'), 'published' => 1, 'deleted' => 0]);
    $children[] = [
        'id' => (int) $k->get('id'),
        'title' => $label($k),
        'intro' => mb_strimwidth(trim(preg_replace('#\s+#u', ' ', strip_tags((string) $k->get('introtext')))), 0, 150, '…', 'UTF-8'),
        'img' => $thumb($kimg, 'w=760&h=520&zc=1&q=76&f=jpg'),
        'sub' => $sub,
        'subLabel' => $sub ? $plural($sub, $modx->lexicon('zk.svc.forms')) : '',
        'kids' => $tree ? array_values(array_map(function ($g) use ($label) {
            return ['id' => (int) $g->get('id'), 'title' => $label($g)];
        }, $kids($k->get('id')))) : [],
    ];
}
$out['children'] = $children;
$out['childrenLabel'] = $children ? $plural(count($children), $modx->lexicon('zk.svc.forms')) : '';

$siblings = [];
if ($parent) {
    foreach ($kids($parent->get('id')) as $s) {
        $siblings[] = ['id' => (int) $s->get('id'), 'title' => $label($s), 'current' => $s->get('id') == $id];
    }
}
$out['siblings'] = count($siblings) > 1 ? $siblings : [];

// ---------- тексти ----------
$content = $clean($res->get('content'));
$intro1 = $clean($tv($res, 'tv-bl1-seo-text-1'));
// «миниленд NEW» тримає головний текст у TV, а content — SEO-текст; «миниленд» — головний текст у content
$out['textMain'] = $intro1 ?: ($mode == 'direction' ? '' : $content);
$out['textSeo'] = $intro1 ? $content : ($mode == 'direction' ? $content : '');
// SEO-текст часто повторює перші абзаци головного тексту — прибираємо повтори
if ($intro1 && $out['textSeo'] !== '') {
    $plain = function ($h) {
        return mb_strtolower(trim(preg_replace('#\s+#u', ' ', html_entity_decode(strip_tags($h), ENT_QUOTES, 'UTF-8'))), 'UTF-8');
    };
    $ref = $plain($intro1);
    $seo = preg_replace_callback('#<(p|li|h[2-4])[^>]*>.*?</\1>#su', function ($m) use ($ref, $plain) {
        $t = $plain($m[0]);
        return (mb_strlen($t) >= 40 && mb_strpos($ref, mb_substr($t, 0, 80)) !== false) ? '' : $m[0];
    }, $out['textSeo']);
    // заголовок, після якого нічого не лишилося
    $seo = preg_replace('#<(h[2-4])[^>]*>.*?</\1>\s*(?=<h[2-4][\s>]|$)#su', '', trim($clean($seo)));
    $out['textSeo'] = $clean($seo);
}

$priceRows = [];
foreach ($json($tv($res, 'migx_table_price')) as $r) {
    if (trim(($r['price-serv'] ?? '') . ($r['price-price'] ?? '')) === '') continue;
    $priceRows[] = ['name' => trim($r['price-serv'] ?? ''), 'price' => trim($r['price-price'] ?? '')];
}
$out['price'] = [
    'intro' => $clean($tv($res, 'tv-bl2-seo-text-1')),
    'title' => $tv($res, 'tv-bl2-seo-title'),
    'col1' => $tv($res, 'tv-bl2-table-name-1'),
    'col2' => $tv($res, 'tv-bl2-table-name-2'),
    'rows' => $priceRows,
    'text' => $clean($tv($res, 'tv-bl2-seo-text-3')),
];

// тексти старої версії сторінки (етапи, «Чому варто», блок 3, переваги) — поле «Додатковий SEO-текст», у SEO-блоці
$out['seoExtra'] = $clean($tv($res, 'seo-extra'));

// логотипи брендів (старий блок «logo-new», TV migx_logo_new / title_logo / text_logo)
$brands = [];
foreach ($json($tv($res, 'migx_logo_new')) as $r) {
    $bimg = $path($r['lg-1'] ?? '', 'assets/images/design/');
    if ($bimg !== '') $brands[] = $url($bimg);
}
$out['brands'] = ['title' => $tv($res, 'title_logo'), 'text' => trim(strip_tags($tv($res, 'text_logo'))), 'items' => $brands];

$faq = [];
foreach ($json($tv($res, 'migx_questions')) as $r) {
    $q = trim($r['questions-title'] ?? '');
    $a = $clean($r['questions-text'] ?? '');
    if ($q !== '' && $a !== '') $faq[] = ['q' => $q, 'a' => (strpos($a, '<') === false ? '<p>' . $a . '</p>' : $a)];
}
$out['faq'] = $faq;

$videos = [];
foreach ($json($tv($res, 'mig_bl1_video_seo')) as $r) {
    $v = $ytId($r['link-video-bl2-seo'] ?? '');
    if ($v && !in_array($v, $videos)) $videos[] = $v;
}
$out['videos'] = $videos;
$out['videoText'] = $clean($tv($res, 'tv-bl2-seo-text-2'));

return json_encode($out, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);