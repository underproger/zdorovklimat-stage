{extends 'zk.layout'}
{block 'body_class'} zk-objects{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:objects')}
{* дані рахуємо в шаблоні: змінні з include назад не повертаються *}
{set $zkUrlRe = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~'}
{set $catList = $_modx->runSnippet('zkObjectCats', ['parent' => $_modx->resource.id]) | fromJSON}
{set $objParams = [
    'parents' => $_modx->resource.id,
    'depth' => 1,
    'limit' => 0,
    'where' => '{"isfolder":0}',
    'includeTVs' => 'object-img,object-date',
    'tvPrefix' => 'tv.',
    'sortby' => '{"object-date":"DESC","menuindex":"ASC"}',
]}
{set $p = $objParams}{set $p.tpl = 'zk.tpl.object.item'}
{set $objects = $_modx->runSnippet('pdoResources', $p) | trim}
{set $p = $objParams}{set $p.limit = 12}{set $p.return = 'json'}
{set $wallRows = $_modx->runSnippet('pdoResources', $p) | fromJSON}
{set $wall = []}
{foreach $wallRows as $r}
    {set $s = $r['tv.object-img'] | replace : 'ru/' : '' | replace : '/./' : '/' | trim | ereplace : '~^/+~' : ''}
    {if $s && !($s | ematch : '/[^\x20-\x7E]/')}{set $wall[] = '/' ~ ($_modx->runSnippet('pthumb', ['input' => $s, 'options' => 'w=480&h=330&zc=1&q=70&f=jpg']) | ereplace : $zkUrlRe : '')}{/if}
{/foreach}
{set $crumb = 'zko.crumb' | lexicon}
{set $activeCat = 0}
{set $heroEyebrow = 'zko.hero.eyebrow' | lexicon}
{set $heroTitle = 'zko.hero.title' | lexicon}
{set $heroTitleClass = ''}
{set $heroText = 'zko.hero.text' | lexicon}
{include 'zk.objects.hero'}
{set $gridEyebrow = '' ~ ('zko.list.eyebrow' | lexicon)}
{set $gridTitle = 'zko.list.title' | lexicon}
{set $gridFilter = true}
{include 'zk.objects.grid'}
{include 'zk.objects.map'}
{include 'zk.home.clients'}
{include 'zk.home.contact'}
{/block}
