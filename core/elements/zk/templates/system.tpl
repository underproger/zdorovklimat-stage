{extends 'zk.layout'}
{block 'body_class'} zk-system{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:system')}
{* службові сторінки: «Дякуємо» (сюди ведуть форми заявок), 404, 403 — вид за id сторінки *}
{set $rid = $_modx->resource.id}
{set $kind = '404'}
{if $rid == 1479 || $rid == 1478}{set $kind = 'thanks'}{/if}
{if $rid == 22 || $rid == 1301}{set $kind = '403'}{/if}
{set $p = 'zkp.' ~ $kind ~ '.'}
<section class="page-hero sys-hero is-{$kind}">
    <img class="page-hero-image" src="{$zk.assets}img/steel.webp" alt="" fetchpriority="high" width="1672" height="940">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    {if $kind != 'thanks'}<div class="sys-code" aria-hidden="true">{$kind}</div>{/if}
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {if $kind == 'thanks'}<i class="sys-badge" aria-hidden="true"><svg><use href="#i-check"/></svg></i>{/if}
            <div class="eyebrow">{($p ~ 'eyebrow') | lexicon}</div>
            <h1>{($p ~ 'title') | lexicon}</h1>
            <p class="page-hero-text">{($p ~ 'text') | lexicon}</p>
            <div class="hero-actions">
                <a class="btn btn-yellow btn-glow" href="{$zk.home | url}">{'zkp.home' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                {if $kind == 'thanks'}
                <a class="text-link text-link-light" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}<svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg></a>
                {else}
                <a class="text-link text-link-light" href="{$zk.home | url}" data-back>{'zkp.back' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                {/if}
            </div>
            {if $kind == 'thanks'}
            <div class="sys-socials">
                <span>{'zkp.write' | lexicon}</span>
                <a class="sys-social" href="{$zk.viber}"><svg aria-hidden="true"><use href="#i-viber"/></svg>Viber</a>
                <a class="sys-social" href="{$zk.telegram}" target="_blank" rel="noopener"><svg aria-hidden="true"><use href="#i-telegram"/></svg>Telegram</a>
            </div>
            {/if}
        </div>
        {if $kind == 'thanks'}
        <div class="about-points page-hero-points">
            <p class="points-title">{'zkp.thanks.panel' | lexicon}</p>
            <ul>
                {foreach ['i-phone', 'i-docs', 'i-helmet'] as $i => $icon}
                <li>
                    <div class="point-row">
                        <i class="point-icon"><svg aria-hidden="true"><use href="#{$icon}"/></svg></i>
                        <div><span><b>0{$i + 1}</b> / {('zkp.thanks.s' ~ ($i + 1) ~ '.title') | lexicon}</span>{('zkp.thanks.s' ~ ($i + 1) ~ '.text') | lexicon}</div>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
        {else}
        <nav class="cat-panel svc-panel sys-panel" aria-label="{'zkp.panel' | lexicon}">
            <p class="points-title">{'zkp.panel' | lexicon}</p>
            <ul>
                {foreach [$zk.services, $zk.objects, $zk.video, $zk.about, $zk.blog, $zk.contacts] as $id}
                {set $t = $id | resource : 'menutitle'}
                <li><a href="{$id | url}"><span>{$t ?: ($id | resource : 'pagetitle')}</span><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a></li>
                {/foreach}
            </ul>
        </nav>
        {/if}
    </div>
</section>
{if $kind == 'thanks'}
<section class="sys-links section">
    <div class="wrap">
        <div class="eyebrow">{'zkp.thanks.while' | lexicon}</div>
        <div class="sys-links-grid">
            {foreach [$zk.objects, $zk.video, $zk.about] as $i => $id}
            {set $t = $id | resource : 'menutitle'}
            <a class="sys-link" href="{$id | url}">
                <span class="sys-link-num">0{$i + 1}</span>
                <span class="sys-link-title">{$t ?: ($id | resource : 'pagetitle')}</span>
                <span class="round" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></span>
            </a>
            {/foreach}
        </div>
    </div>
</section>
{/if}
{/block}
