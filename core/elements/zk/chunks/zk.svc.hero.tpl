{* Перший екран послуги / напряму. $d — дані zkServiceData, $svcMode — 'service' | 'direction' *}
{set $heroImg = $d.heroImg ?: ($zk.assets ~ 'img/steel.webp')}
{set $panel = []}{set $panelTitle = ''}{set $panelLinks = true}{set $panelMore = $zk.self ~ '#children'}
{if $svcMode == 'direction' && $d.children}
    {set $panelTitle = 'zks.panel.children' | lexicon}
    {foreach $d.children as $c}{set $panel[] = ['id' => $c.id, 'title' => $c.title, 'n' => $c.sub, 'current' => false]}{/foreach}
{elseif $d.siblings}
    {set $panelTitle = 'zks.panel.siblings' | lexicon}{set $panelMore = $d.parent ? ($d.parent.id | url) : ($zk.services | url)}
    {foreach $d.siblings as $c}{set $panel[] = ['id' => $c.id, 'title' => $c.title, 'n' => 0, 'current' => $c.current]}{/foreach}
{elseif $d.children}
    {set $panelTitle = 'zks.panel.children' | lexicon}
    {foreach $d.children as $c}{set $panel[] = ['id' => $c.id, 'title' => $c.title, 'n' => $c.sub, 'current' => false]}{/foreach}
{elseif $d.advantages}
    {set $panelTitle = 'zks.panel.adv' | lexicon}{set $panelLinks = false}
    {foreach $d.advantages as $i => $a}{if $i < 5}{set $panel[] = ['id' => 0, 'title' => $a.title, 'n' => 0, 'current' => false]}{/if}{/foreach}
{/if}
<section class="page-hero svc-hero">
    <img class="page-hero-image" src="{$heroImg}" alt="" fetchpriority="high">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout{$panel ? '' : ' is-single'}">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{$d.parent ? $d.parent.title : ('zks.hero.eyebrow' | lexicon)}</div>
            <h1 class="{($d.title | length) > 48 ? 'is-long' : ''}">{$d.title}</h1>
            {if $d.intro}<p class="page-hero-text">{$d.intro | truncate : 260 : '…'}</p>{/if}
            <div class="hero-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zks.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="text-link text-link-light" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}<svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg></a>
            </div>
        </div>
        {if $panel}
        <nav class="cat-panel svc-panel" aria-label="{$panelTitle}">
            <p class="points-title">{$panelTitle}</p>
            <ul>
                {foreach $panel as $i => $c}
                {if $i < 9}
                <li>
                    {if $panelLinks}
                    <a class="{$c.current ? 'is-active' : ''}" href="{$c.id | url}"{if $c.current} aria-current="page"{/if}><span>{$c.title}</span>{if $c.n}<b>{$c.n}</b>{else}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg>{/if}</a>
                    {else}
                    <span class="svc-panel-item"><i class="why-check"><svg aria-hidden="true"><use href="#i-check"/></svg></i><span>{$c.title}</span></span>
                    {/if}
                </li>
                {/if}
                {/foreach}
            </ul>
            {if ($panel | length) > 9 && $panelLinks}<a class="svc-panel-more" href="{$panelMore}">{'zks.panel.more' | lexicon} <b>+{($panel | length) - 9}</b><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>{/if}
        </nav>
        {/if}
    </div>
</section>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "Service",
    "name": {$d.title | escape : 'js'},
    "description": {($d.intro ?: $d.title) | escape : 'js'},
    "url": "{$_modx->resource.id | url : ['scheme' => 'full']}",
    {if $heroImg && $d.heroImg}"image": "{$_modx->config.site_url | replace : 'ru/' : ''}{$d.heroImg | ereplace : '/^\//' : ''}",{/if}
    "serviceType": {($d.parent ? $d.parent.title : $d.title) | escape : 'js'},
    "provider": { "@id": "{$_modx->config.site_url}" },
    "areaServed": { "@type": "Country", "name": "Ukraine" }
}
{ignore}</script>{/ignore}
