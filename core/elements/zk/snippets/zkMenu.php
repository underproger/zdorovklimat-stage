<?php
/**
 * Дворівневе меню «Послуги» (новий дизайн 2026): напрями та їхні послуги.
 * &root — сторінка «Послуги» (25 / 1289). Повертає JSON: [{id, title, icon, kids: [{id, title}]}].
 * Використовується двічі на сторінці (десктопне і мобільне меню), тому результат кешується.
 *
 * icon — SVG зі старого поля «Иконка в меню» (services-icon): без <?xml>, стилів, класів і розмірів,
 * колір задається з CSS (fill: currentColor). Фігурні дужки зі стилів SVG прибираються,
 * щоб не заважати Fenom під час обробки некешованих тегів.
 */
/** @var modX $modx */
/** @var array $scriptProperties */
$root = (int) $modx->getOption('root', $scriptProperties, 0);
if (!$root) return '[]';
// кеш у розділі resource — очищається разом із кешем сайту при збереженні ресурсів
$cacheKey = 'zk_menu/' . $root;
$cacheOpt = [xPDO::OPT_CACHE_KEY => 'resource'];
$cached = $modx->cacheManager->get($cacheKey, $cacheOpt);
if (is_string($cached) && $cached !== '') return $cached;
$modx->lexicon->load('zdorovklimat:home');

$label = function (modResource $r) use ($modx) {
    $key = 'zk.svc.' . $r->get('id');
    $short = $modx->lexicon($key);
    if ($short !== $key) return $short;
    return trim($r->get('menutitle') ?: $r->get('pagetitle'));
};
$kids = function ($parent) use ($modx) {
    $q = $modx->newQuery('modResource', ['parent' => $parent, 'published' => 1, 'deleted' => 0, 'hidemenu' => 0]);
    $q->sortby('menuindex', 'ASC');
    $q->sortby('id', 'ASC');
    return $modx->getCollection('modResource', $q);
};
$icon = function (modResource $r) {
    $svg = trim((string) $r->getTVValue('services-icon'));
    if ($svg === '' || stripos($svg, '<svg') === false) return '';
    $svg = preg_replace('#<\?xml[^>]*\?>#i', '', $svg);
    $svg = preg_replace('#<!--.*?-->#s', '', $svg);
    $svg = preg_replace('#<style[^>]*>.*?</style>#is', '', $svg);
    // кореневий <svg>: лише viewBox і простір імен
    $svg = preg_replace_callback('#<svg\b[^>]*>#i', function ($m) {
        $vb = preg_match('#viewBox="([^"]+)"#i', $m[0], $v) ? ' viewBox="' . $v[1] . '"' : '';
        return '<svg xmlns="http://www.w3.org/2000/svg"' . $vb . ' aria-hidden="true" focusable="false">';
    }, $svg, 1);
    // у фігур — без класів, стилів і власного кольору
    $svg = preg_replace('#\s(?:class|style)="[^"]*"#i', '', $svg);
    $svg = preg_replace('#\sfill="(?!none)[^"]*"#i', '', $svg);
    $svg = str_replace(['{', '}'], '', $svg);
    return trim(preg_replace('#\s+#', ' ', $svg));
};

$out = [];
foreach ($kids($root) as $d) {
    $items = [];
    foreach ($kids($d->get('id')) as $s) {
        $items[] = ['id' => (int) $s->get('id'), 'title' => $label($s)];
    }
    $out[] = ['id' => (int) $d->get('id'), 'title' => $label($d), 'icon' => $icon($d), 'kids' => $items];
}
$json = json_encode($out, JSON_UNESCAPED_UNICODE);
$modx->cacheManager->set($cacheKey, $json, 0, $cacheOpt);
return $json;