<section class="intro-section section" id="who">
    <div class="wrap intro-layout">
        <div class="intro-copy">
            <div class="eyebrow"><span class="num">01</span><span class="sep">/</span>{'zka.intro.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zka.intro.title' | lexicon}</h2>
            <p class="intro-lead">{'zka.intro.p1' | lexicon}</p>
            <p class="intro-text">{'zka.intro.p2' | lexicon}</p>
            <a class="text-link" href="{$zk.objects | url}">{'zka.intro.objects' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="intro-visual">
            <figure class="intro-photo intro-photo-main">
                <img src="/assets/images/works/stryi_torba.jpg" alt="{'zka.intro.photo2' | lexicon}" loading="lazy" width="1800" height="1080">
                <figcaption><span>02</span>{'zka.intro.photo2' | lexicon}</figcaption>
            </figure>
            <figure class="intro-photo intro-photo-side">
                <img src="/assets/images/works/hryhorivka.jpg" alt="{'zka.intro.photo1' | lexicon}" loading="lazy" width="1600" height="1200">
                <figcaption><span>01</span>{'zka.intro.photo1' | lexicon}</figcaption>
            </figure>
            <i class="intro-plus" aria-hidden="true"></i>
        </div>
    </div>
    <div class="wrap">
        <div class="why-strip">
            <h3 class="why-title">{'zka.intro.card' | lexicon}</h3>
            <ul class="why-list">
                {foreach ('zka.intro.list' | lexicon | split : '||') as $item}
                <li><i class="why-check"><svg aria-hidden="true"><use href="#i-check"/></svg></i>{$item}</li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
