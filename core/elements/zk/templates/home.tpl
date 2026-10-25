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
    'v'        => '20261025b',
]}
<!doctype html>
<html lang="{$ua ? 'uk' : 'ru'}">
<head>
{include 'zk.head'}
</head>
<body id="top" class="zk zk-home">
[[++google-tag-body]]
{include 'zk.sprite'}
<a class="skip" href="#main">{'zk.skip' | lexicon}</a>
{include 'zk.header'}
<main id="main">
{include 'zk.home.hero'}
{include 'zk.home.metrics'}
{include 'zk.home.services'}
{include 'zk.home.about'}
{include 'zk.home.projects'}
{include 'zk.home.process'}
{include 'zk.home.clients'}
{include 'zk.home.map'}
{include 'zk.home.blog'}
{include 'zk.home.seo'}
{include 'zk.home.contact'}
</main>
{include 'zk.footer'}
{include 'zk.dialogs'}
{include 'zk.scripts'}
</body>
</html>
