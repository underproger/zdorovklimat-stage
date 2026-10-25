{* Перший екран розділу «Об’єкти»: стіна з фото об’єктів ($wall), напрями ($catList, $activeCat), $heroTitle, $heroText, $heroEyebrow *}
<section class="page-hero video-hero objects-hero">
    {if $wall}
    <div class="video-wall" aria-hidden="true">
        {set $wc = $wall | length}
        {foreach 0..11 as $k}{set $w = $wall[$k % $wc]}<img src="{$w}" alt="" width="480" height="330">{/foreach}
    </div>
    {/if}
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{$heroEyebrow}</div>
            <h1 class="{$heroTitleClass}">{$heroTitle}</h1>
            <p class="page-hero-text">{$heroText}</p>
            <div class="hero-actions">
                <a class="btn btn-yellow btn-glow" href="{$zk.self}#portfolio">{'zko.hero.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></a>
                <a class="text-link text-link-light" href="{$zk.objects | url}#map">{'zko.hero.map' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-pin"/></svg></a>
            </div>
        </div>
        {if $catList}
        <nav class="cat-panel" aria-label="{'zko.hero.panel' | lexicon}">
            <p class="points-title">{'zko.hero.panel' | lexicon}</p>
            <ul>
                {foreach $catList as $c}
                <li><a class="{$c.id == $activeCat ? 'is-active' : ''}" href="{$c.id | url}"{if $c.id == $activeCat} aria-current="page"{/if}><span>{$c.name}</span><b>{$c.n}</b></a></li>
                {/foreach}
            </ul>
        </nav>
        {/if}
    </div>
</section>
