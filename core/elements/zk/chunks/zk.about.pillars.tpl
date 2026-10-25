<section class="pillars-section section" id="pillars">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow"><span class="num">02</span><span class="sep">/</span>{'zka.pillars.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zka.pillars.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zka.pillars.text' | lexicon}</p>
        </div>
        <div class="pillar-grid">
            {foreach [['design', 'i-design'], ['contract', 'i-helmet'], ['supervision', 'i-eye'], ['site', 'i-plot']] as $i => $p}
            {set $n = $i + 1}
            <article class="pillar" id="{$p[0]}">
                <div class="pillar-top">
                    <span class="pillar-num">0{$n}</span>
                    <i class="pillar-icon"><svg aria-hidden="true"><use href="#{$p[1]}"/></svg></i>
                </div>
                <h3>{('zka.p' ~ $n ~ '.title') | lexicon}</h3>
                <p>{('zka.p' ~ $n ~ '.text') | lexicon}</p>
                <ul class="tick-list">
                    {foreach (('zka.p' ~ $n ~ '.list') | lexicon | split : '||') as $item}
                    <li>{$item}</li>
                    {/foreach}
                </ul>
            </article>
            {/foreach}
        </div>
    </div>
</section>
