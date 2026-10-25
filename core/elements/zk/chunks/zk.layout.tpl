{* Общий каркас нового дизайна 2026: шаблоны страниц делают {extends 'zk.layout'} и заполняют блок main *}
{$_modx->lexicon->load('zdorovklimat:home')}
{set $ua = $_modx->resource.context_key == 'web'}
{set $zk = [
    'home'     => ($ua ? 1 : 1288),
    'services' => ($ua ? 25 : 1289),
    'about'    => ($ua ? 3 : 1294),
    'objects'  => ($ua ? 26 : 1295),
    'video'    => ($ua ? 1565 : 1566),
    'blog'     => ($ua ? 66 : 1549),
    'contacts' => ($ua ? 2 : 1296),
    'reviews'  => ($ua ? 1492 : 1493),
    'thanks'   => ($ua ? 1479 : 1478),
    'cards'    => ($ua ? [1558, 40, 121, 1604] : [1556, 1290, 1526, 1603]),
    'phone1'   => (($_modx->getPlaceholder('+phone-1') ?: $_modx->config['phone-1']) | strip_tags | trim),
    'phone2'   => (($_modx->getPlaceholder('+phone-2') ?: $_modx->config['phone-2']) | strip_tags | trim),
    'email'    => (($_modx->getPlaceholder('+e-mail') ?: $_modx->config['e-mail']) | lower | trim),
    'assets'   => '/assets/templates/zk/',
    'self'     => ($_modx->resource.id | url),
    'v'        => '20261025e',
]}
{set $isHome = $_modx->resource.id in [1, 1288]}
{* сторінки з темним першим екраном: шапка прозора поверх нього, на решті — суцільна *}
{set $darkHero = $isHome || $_modx->resource.id == $zk.about}
<!doctype html>
<html lang="{$ua ? 'uk' : 'ru'}">
<head>
{include 'zk.head'}
{block 'head'}{/block}
</head>
<body id="top" class="zk {$isHome ? 'zk-home' : 'zk-inner'}{block 'body_class'}{/block}">
[[++google-tag-body]]
{include 'zk.sprite'}
{* через <base href> якорі пишемо з повною адресою сторінки *}
<a class="skip" href="{$zk.self}#main">{'zk.skip' | lexicon}</a>
{include 'zk.header'}
<main id="main">
{block 'main'}{/block}
</main>
{include 'zk.footer'}
{include 'zk.dialogs'}
{include 'zk.scripts'}
</body>
</html>
