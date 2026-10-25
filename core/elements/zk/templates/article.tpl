{extends 'zk.layout'}
{block 'body_class'} zk-article{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:blog')}
{* дані статті рахуємо тут: змінні з include назад не повертаються *}
{set $res = $_modx->resource}
{set $title = $res.pagetitle}
{set $crumb = $res.menutitle ?: $res.pagetitle}
{set $crumbMid = [('zkb.crumb' | lexicon), ($res.parent | url), ($res.parent | url : ['scheme' => 'full'])]}
{set $lead = ($res.introtext ?: '') | strip_tags | trim}
{set $content = $res.content | replace : '<h1' : '<h2' | replace : '</h1>' : '</h2>' | ereplace : '~<img(?![^>]*\bloading=)~i' : '<img loading="lazy" decoding="async"'}
{set $minutes = ((($res.content | strip_tags | length) + 1099) / 1100) | intval}
{set $months = 'zk.months' | lexicon | split : '||'}
{set $date = ($res.publishedon | date : 'j') ~ ' ' ~ $months[($res.publishedon | date : 'n') - 1] ~ ' ' ~ ($res.publishedon | date : 'Y')}
{set $cover = ($res['img-blog-banner'] ?: $res['img-blog-prew']) | trim}
{* обкладинка — лише якщо цього фото немає в тексті статті (інакше воно дублюється) *}
{if $cover && ($res.content | ematch : ('#' ~ ($cover | ereplace : '#^.*/#' : '') ~ '#'))}{set $cover = ''}{/if}
{if $cover}{set $cover = '/' ~ ($cover | ereplace : '~^/+~' : '')}{/if}
{set $ogImage = ($res['img-blog-prew'] ?: $res['img-blog-banner']) | trim | ereplace : '~^/+~' : ''}
{include 'zk.article.hero'}
{include 'zk.article.body'}
{include 'zk.article.related'}
{include 'zk.home.contact'}
{/block}
