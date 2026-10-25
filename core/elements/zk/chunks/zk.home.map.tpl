<section class="map-section" id="geography">
    <div class="map-decor" aria-hidden="true">
        <span class="map-cross"></span>
        <span class="map-side">{'zk.map.side' | lexicon}</span>
        <span class="map-corner">{'zk.map.corner' | lexicon}</span>
    </div>
    <div class="wrap map-layout">
        <div class="map-copy">
            <div class="eyebrow">{'zk.map.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zk.map.title' | lexicon}</h2>
            <p>{'zk.map.text' | lexicon}</p>
            <a class="btn btn-yellow map-btn" href="{$zk.objects | url}">{'zk.map.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
            <ul class="map-stats">
                <li><b>{'zk.map.s1.num' | lexicon}</b><span>{'zk.map.s1.text' | lexicon}</span></li>
                <li><b>{'zk.map.s2.num' | lexicon}</b><span>{'zk.map.s2.text' | lexicon}</span></li>
                <li><svg class="icon" aria-hidden="true"><use href="#i-buildings"/></svg><span>{'zk.map.s3.text' | lexicon}</span></li>
            </ul>
        </div>
        <div class="map-visual">
            <a class="map-art" href="{$zk.objects | url}" aria-label="{'zk.map.cta' | lexicon}">
                <img src="{$zk.assets}img/ua-map.svg?v={$zk.v}" alt="{'zk.map.alt' | lexicon}" loading="lazy" width="1012" height="696">
            </a>
            <ul class="map-card" aria-hidden="true">
                <li><i><svg aria-hidden="true"><use href="#i-pin"/></svg></i><div><b>{'zk.map.s1.num' | lexicon}</b><span>{'zk.map.s1.text' | lexicon | replace : '<br>' : ' '}</span></div></li>
                <li><i><svg aria-hidden="true"><use href="#i-layers"/></svg></i><div><b>{'zk.map.s2.num' | lexicon}</b><span>{'zk.map.s2.text' | lexicon | replace : '<br>' : ' '}</span></div></li>
                <li><i><svg aria-hidden="true"><use href="#i-buildings"/></svg></i><div><b class="small">{'zk.map.card3.title' | lexicon}</b><span>{'zk.map.card3.text' | lexicon}</span></div></li>
            </ul>
        </div>
    </div>
</section>
