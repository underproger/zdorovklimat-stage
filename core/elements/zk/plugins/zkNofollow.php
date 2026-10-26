<?php
/**
 * zkNofollow — зовнішнім посиланням на сторінках сайту додає rel="nofollow".
 * Подія: OnWebPagePrerender (обробляє готовий HTML, тож охоплює і шаблони, і контент сторінок).
 *
 * Не чіпає: посилання на власний домен (site_url поточного контексту, zdorovklimat.com.ua і піддомени),
 * відносні, якірні, tel:, mailto:, viber: тощо, а також сайти зі списку винятків (розробник сайту).
 * Наявні значення rel (noopener тощо) зберігаються.
 *
 * @events OnWebPagePrerender
 */
/** @var modX $modx */
if ($modx->event->name !== 'OnWebPagePrerender' || $modx->context->get('key') === 'mgr') {
    return;
}
$output = &$modx->resource->_output;
if (!is_string($output) || stripos($output, '<a') === false) {
    return;
}
$norm = function ($host) {
    return preg_replace('#^www\.#', '', strtolower((string) $host));
};
$own = array_unique(array_filter([
    $norm(parse_url((string) $modx->getOption('site_url'), PHP_URL_HOST)),
    $norm($modx->getOption('http_host')),
    'zdorovklimat.com.ua',
]));
// винятки: посилання лишаються dofollow
$keep = ['impulse-design.com.ua'];

$isOwn = function ($host) use ($own) {
    foreach ($own as $h) {
        if ($host === $h || substr($host, -strlen('.' . $h)) === '.' . $h) return true;
    }
    return false;
};

$output = preg_replace_callback('#<a\b[^>]*>#i', function ($m) use ($norm, $isOwn, $keep) {
    $tag = $m[0];
    if (!preg_match('#\shref\s*=\s*(["\'])(.*?)\1#is', $tag, $h)) return $tag;
    $href = html_entity_decode(trim($h[2]), ENT_QUOTES, 'UTF-8');
    if (!preg_match('#^(?:https?:)?//#i', $href)) return $tag;
    $host = $norm(parse_url((strpos($href, '//') === 0 ? 'https:' : '') . $href, PHP_URL_HOST));
    if ($host === '' || $isOwn($host) || in_array($host, $keep, true)) return $tag;
    if (preg_match('#\srel\s*=\s*(["\'])(.*?)\1#is', $tag, $r)) {
        $tokens = preg_split('#\s+#', trim($r[2]), -1, PREG_SPLIT_NO_EMPTY);
        if (in_array('nofollow', array_map('strtolower', $tokens), true)) return $tag;
        $tokens[] = 'nofollow';
        return str_replace($r[0], ' rel=' . $r[1] . implode(' ', $tokens) . $r[1], $tag);
    }
    return preg_replace('#^<a\b#i', '<a rel="nofollow"', $tag);
}, $output);