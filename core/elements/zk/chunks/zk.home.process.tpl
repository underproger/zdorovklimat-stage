<section class="process-section section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{if $processNum}<span class="num">{$processNum}</span><span class="sep">/</span>{/if}{'zk.process.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.process.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zk.process.text' | lexicon}</p>
        </div>
        <ol class="process-grid">
            {foreach 1..4 as $n}
            <li class="step">
                <div class="step-top"><span class="step-number">0{$n}</span><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></div>
                <h3>{('zk.step' ~ $n ~ '.title') | lexicon}</h3>
                <p>{('zk.step' ~ $n ~ '.text') | lexicon}</p>
            </li>
            {/foreach}
        </ol>
    </div>
</section>
