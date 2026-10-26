<section class="page-hero video-hero objects-hero services-hero">
    {set $wall = []}
    {foreach $d.children as $c}{if $c.img}{set $wall[] = $c.img}{/if}{/foreach}
    {if $wall}
    <div class="video-wall" aria-hidden="true">
        {set $wc = $wall | length}
        {foreach 0..11 as $k}<img src="{$wall[$k % $wc]}" alt="" width="480" height="330">{/foreach}
    </div>
    {/if}
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{'zks.hero.eyebrow' | lexicon}</div>
            <h1>{'zks.hero.title' | lexicon}</h1>
            <p class="page-hero-text">{'zks.hero.text' | lexicon}</p>
            <div class="hero-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zks.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="text-link text-link-light" href="{$zk.self}#catalog">{'zks.all.eyebrow' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></a>
            </div>
        </div>
        <div class="about-points page-hero-points">
            <p class="points-title">{'zks.hero.panel' | lexicon}</p>
            <ul>
                {foreach ['i-design', 'i-helmet', 'i-docs'] as $i => $icon}
                <li>
                    <div class="point-row">
                        <i class="point-icon"><svg aria-hidden="true"><use href="#{$icon}"/></svg></i>
                        <div><span><b>0{$i + 1}</b> / {('zk.about.p' ~ ($i + 1) ~ '.label') | lexicon}</span>{('zk.about.p' ~ ($i + 1) ~ '.text') | lexicon}</div>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
