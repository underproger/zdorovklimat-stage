{* Картка статті: tpl для pdoResources / pdoPage (поля ресурсу + tv.img-blog-prew, $idx) *}
{$_modx->lexicon->load('zdorovklimat:home')}
{set $img = $_pls['tv.img-blog-prew'] | replace : 'ru/' : '' | trim}
{if $img && !($img | ematch : '/[^\x20-\x7E]/')}
    {set $img = '/' ~ ($_modx->runSnippet('pthumb', ['input' => ($img | ereplace : '~^/+~' : ''), 'options' => 'w=820&h=410&zc=1&q=80&f=jpg']) | ereplace : '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~' : '')}
{elseif $img}
    {set $img = '/' ~ ($img | ereplace : '~^/+~' : '')}
{/if}
{set $url = $id | url}
{set $months = 'zk.months' | lexicon | split : '||'}
<article class="blog-card">
    <a class="blog-photo" href="{$url}" tabindex="-1" aria-hidden="true">
        {if $img}<img src="{$img}" alt="" loading="lazy" width="820" height="410">{/if}
    </a>
    <div class="blog-body">
        <div class="eyebrow">{'zk.blog.cat' | lexicon}</div>
        <h3><a href="{$url}">{$menutitle ?: $pagetitle}</a></h3>
        <p>{($introtext ?: $description) | strip_tags | truncate : 120 : '…'}</p>
        <div class="blog-foot">
            <a class="text-link" href="{$url}">{'zk.blog.read' | lexicon}</a>
            <time class="blog-date" datetime="{$publishedon | date : 'Y-m-d'}">{$publishedon | date : 'j'} {$months[($publishedon | date : 'n') - 1]} {$publishedon | date : 'Y'}</time>
            <a class="round" href="{$url}" tabindex="-1" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></a>
        </div>
    </div>
</article>
