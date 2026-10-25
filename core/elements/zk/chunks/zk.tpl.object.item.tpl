{* Картка об’єкта: tpl для pdoResources (поля ресурсу + tv.object-img, tv.object-date, $idx). Посилання на сторінку об’єкта *}
{$_modx->lexicon->load('zdorovklimat:home')}
{set $src = $_pls['tv.object-img'] | replace : 'ru/' : '' | replace : '/./' : '/' | trim}
{if !$src}
    {set $thumb = ''}
{elseif $src | ematch : '/[^\x20-\x7E]/'}
    {set $thumb = '/' ~ ($src | ereplace : '~^/+~' : '')}
{else}
    {set $thumb = '/' ~ ($_modx->runSnippet('pthumb', ['input' => ($src | ereplace : '~^/+~' : ''), 'options' => 'w=760&h=520&zc=1&q=78&f=jpg']) | ereplace : '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~' : '')}
{/if}
{set $cat = ('zk.cat.' ~ $parent) | lexicon}
{if $cat == ('zk.cat.' ~ $parent)}{set $cat = ($parent | resource : 'menutitle') ?: ($parent | resource : 'pagetitle')}{/if}
{set $year = $_pls['tv.object-date'] | strip_tags | trim}
{set $title = ($menutitle ?: $pagetitle) | ereplace : '~"([^"]*)"~u' : '«$1»'}
<a class="project-card object-card" href="{$id | url}" data-category-id="{$parent}">
    <span class="project-photo">
        {if $thumb}<img src="{$thumb}" alt="{$title | escape}" loading="lazy" width="760" height="520">{/if}
        <span class="round"><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></span>
    </span>
    <span class="project-info">
        <span>
            <span class="project-title">{$title}</span>
            <span class="project-meta">{$cat}{if $year} · {$year}{/if}</span>
        </span>
    </span>
</a>
