{set $crumb = 'zkr.crumb' | lexicon}
{* компактний перший екран без бічної панелі переваг *}
<section class="page-hero about-hero reviews-hero">
    <img class="page-hero-image" src="{$zk.assets}img/steel.webp" alt="" fetchpriority="high" width="1672" height="940">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout is-single">
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
    </div>
</section>
