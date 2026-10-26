{set $crumb = 'zka.crumb' | lexicon}
<section class="page-hero about-hero">
    <img class="page-hero-image" src="{$zk.assets}img/steel.webp" alt="{'zka.hero.img_alt' | lexicon}" fetchpriority="high" width="1672" height="940">
    <div class="page-hero-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap page-hero-layout">
        <div class="page-hero-copy">
            {include 'zk.crumbs'}
            {* H1 — оригінальна назва сторінки («Компанія Здоровий клімат»), назва компанії виділена *}
            <h1>{$_modx->resource.pagetitle | escape | ereplace : '/^(\S+)\s+(.+)$/u' : '$1 <br><em>$2</em>'}</h1>
            <p class="page-hero-text">{'zka.hero.text' | lexicon}</p>
            <div class="hero-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zka.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <button class="video-trigger" type="button" data-video="lUnBVn_8tZc" data-title="{'zk.hero.video_title' | lexicon}">
                    <span class="play"><svg aria-hidden="true"><use href="#i-play"/></svg></span>
                    <span>{'zk.hero.video' | lexicon}</span>
                </button>
            </div>
        </div>
        <div class="about-points page-hero-points">
            <p class="points-title">{'zka.hero.panel' | lexicon}</p>
            <ul>
                {foreach [['design', 'i-design'], ['contract', 'i-helmet'], ['supervision', 'i-eye'], ['site', 'i-plot']] as $i => $p}
                <li>
                    <a class="point-row" href="{$zk.self}#{$p[0]}">
                        <i class="point-icon"><svg aria-hidden="true"><use href="#{$p[1]}"/></svg></i>
                        <div><span>{('zka.hero.f' ~ ($i + 1) ~ '.title') | lexicon}</span>{('zka.hero.f' ~ ($i + 1) ~ '.text') | lexicon}</div>
                    </a>
                </li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
