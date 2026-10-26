{set $crumb = 'zkr.crumb' | lexicon}
<section class="page-hero about-hero reviews-hero">
    <img class="page-hero-image" src="{$zk.assets}img/steel.webp" alt="" fetchpriority="high" width="1672" height="940">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{'zkr.hero.eyebrow' | lexicon}</div>
            <h1>{'zkr.hero.title' | lexicon}</h1>
            <p class="page-hero-text">{'zkr.hero.text' | lexicon}</p>
            <div class="hero-actions">
                <a class="btn btn-yellow btn-glow" href="{$zk.self}#review-form">{'zkr.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                <a class="text-link text-link-light" href="{$zk.maps}" target="_blank" rel="noopener">{'zkr.hero.google' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
            </div>
        </div>
        <div class="about-points page-hero-points">
            <p class="points-title">{'zkr.hero.panel' | lexicon}</p>
            <ul>
                {foreach ['i-buildings', 'i-calendar', 'i-pin'] as $i => $icon}
                <li>
                    <div class="point-row">
                        <i class="point-icon"><svg aria-hidden="true"><use href="#{$icon}"/></svg></i>
                        <div><span><b>0{$i + 1}</b> / {('zkr.hero.p' ~ ($i + 1) ~ '.title') | lexicon}</span>{('zkr.hero.p' ~ ($i + 1) ~ '.text') | lexicon}</div>
                    </div>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
