{extends 'zk.layout'}
{block 'body_class'} zk-objects zk-objects-cat{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:objects')}
{* дані рахуємо в шаблоні: змінні з include назад не повертаються *}
{set $zkUrlRe = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~'}
{set $res = $_modx->resource}
{set $catList = $_modx->runSnippet('zkObjectCats', ['parent' => $res.parent]) | fromJSON}
{set $catName = ''}
{foreach $catList as $c}{if $c.id == $res.id}{set $catName = $c.name}{/if}{/foreach}
{set $objParams = [
    'parents' => $res.id,
    'depth' => 0,
    'limit' => 0,
    'includeTVs' => 'object-img,object-date',
    'tvPrefix' => 'tv.',
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
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
{set $crumb = $catName ?: ($res.menutitle ?: $res.pagetitle)}
{set $crumbTrail = [[('zko.crumb' | lexicon), ($res.parent | url), ($res.parent | url : ['scheme' => 'full'])]]}
{set $activeCat = $res.id}
{set $heroEyebrow = 'zko.cat.eyebrow' | lexicon}
{set $heroTitle = $res.pagetitle}
{set $heroTitleClass = 'is-long'}
{set $heroText = 'zko.hero.text' | lexicon}
{include 'zk.objects.hero'}
{set $gridEyebrow = 'zko.cat.list' | lexicon}
{set $gridTitle = $catName ?: $res.menutitle}
{set $gridFilter = false}
{include 'zk.objects.grid'}
{include 'zk.objects.cats'}
{include 'zk.home.seo'}
{include 'zk.home.contact'}
{/block}
