<section class="hero">
    <img class="hero-image" src="{$zk.assets}img/hero.webp" alt="{'zk.hero.img_alt' | lexicon}" fetchpriority="high" width="1672" height="941">
    <div class="wrap">
        <div class="eyebrow">{'zk.hero.eyebrow' | lexicon}</div>
        <h1>{'zk.hero.title' | lexicon}</h1>
        <p class="hero-description">{'zk.hero.text' | lexicon}</p>
        <div class="hero-actions">
            <button class="btn btn-yellow" type="button" data-consult>{'zk.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            <button class="video-trigger" type="button" data-video="lUnBVn_8tZc" data-title="{'zk.hero.video_title' | lexicon}">
                <span class="play"><svg aria-hidden="true"><use href="#i-play"/></svg></span>
                <span>{'zk.hero.video' | lexicon}</span>
            </button>
        </div>
        <div class="hero-side">{'zk.hero.side' | lexicon}</div>
        <div class="hero-bottom">
            <span class="location"><i class="live-dot"></i>{'zk.hero.location' | lexicon}</span>
            <span class="hero-note">{'zk.hero.note' | lexicon}</span>
            <a class="scroll" href="{$zk.self}#services"><span>{'zk.hero.scroll' | lexicon}</span><svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></a>
        </div>
    </div>
</section>
