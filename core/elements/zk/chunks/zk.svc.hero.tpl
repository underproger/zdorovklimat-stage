{* Перший екран послуги / напряму. $d — дані zkServiceData, $svcMode — 'service' | 'direction' *}
{set $heroImg = $d.heroImg ?: ($zk.assets ~ 'img/steel.webp')}
{* Макет 10.2026: фото на всю ширину з затемненням зліва, крошки, H1, опис, кнопка і телефон. Без надзаголовка і бокової панелі *}
<section class="page-hero svc-hero">
    <img class="svc-hero-bg" src="{$heroImg}" alt="" fetchpriority="high" width="1600" height="1000">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <span class="svc-hero-arc" aria-hidden="true"><i></i></span>
    <div class="wrap svc-hero-inner">
        {include 'zk.crumbs'}
        <h1 class="{($d.title | length) > 48 ? 'is-long' : ''}">{$d.title}</h1>
        {if $d.intro}<p class="page-hero-text">{$d.intro | truncate : 260 : '…'}</p>{/if}
        {* універсальний шаблон: 2–3 переваги, «Розрахувати вартість» → форма розрахунку, «Наші об’єкти» → слайдер об’єктів *}
        {if $heroUniversal && $c.heroPoints}
        <ul class="svc-hero-points">{foreach $c.heroPoints as $hp}<li><svg class="icon" aria-hidden="true"><use href="#i-check"/></svg>{$hp}</li>{/foreach}</ul>
        {/if}
        <div class="hero-actions">
            {if $heroUniversal}
            <a class="btn btn-yellow btn-glow" href="{$zk.self}#calc">{'zku.hero.calc' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
            {if $c.objects}<a class="svc-hero-phone" href="{$zk.self}#objects"><svg class="icon" aria-hidden="true"><use href="#i-buildings"/></svg>{'zku.hero.objects' | lexicon}</a>{else}<button class="svc-hero-phone" type="button" data-consult><svg class="icon" aria-hidden="true"><use href="#i-chat"/></svg>{'zku.hero.consult' | lexicon}</button>{/if}
            {else}
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zks.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            <a class="svc-hero-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
            {/if}
        </div>
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
