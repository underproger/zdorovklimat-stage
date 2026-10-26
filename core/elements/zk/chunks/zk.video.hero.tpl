{set $crumb = 'zkv.crumb' | lexicon}
<section class="page-hero video-hero">
    {if $videos}
    <div class="video-wall" aria-hidden="true">
        {set $vc = $videos | length}
        {foreach 0..11 as $k}{set $v = $videos[$k % $vc]}<img src="{$v.small}" alt="" width="480" height="270">{/foreach}
    </div>
    {/if}
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{'zkv.hero.eyebrow' | lexicon}</div>
            <h1>{'zkv.hero.title' | lexicon}</h1>
            <p class="page-hero-text">{'zkv.hero.text' | lexicon}</p>
            <div class="hero-actions">
                {if $videos}
                <button class="btn btn-yellow btn-glow" type="button" data-video="{$videos[0].id}" data-title="{$videos[0].title | escape}">{'zkv.hero.play' | lexicon}<svg class="icon icon-play" aria-hidden="true"><use href="#i-play"/></svg></button>
                {/if}
                {if $zk.youtube && $zk.youtube != '#'}
                <a class="text-link text-link-light" href="{$zk.youtube}" target="_blank" rel="noopener">{'zkv.hero.channel' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
                {/if}
            </div>
        </div>
        <div class="about-points page-hero-points">
            <p class="points-title">{'zkv.hero.panel' | lexicon}</p>
            <ul>
                {foreach ['i-helmet', 'i-buildings', 'i-pin'] as $i => $icon}
                <li>
                    <div class="point-row">
                        <i class="point-icon"><svg aria-hidden="true"><use href="#{$icon}"/></svg></i>
                        <div><span>{('zkv.hero.f' ~ ($i + 1) ~ '.title') | lexicon}</span>{('zkv.hero.f' ~ ($i + 1) ~ '.text') | lexicon}</div>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
