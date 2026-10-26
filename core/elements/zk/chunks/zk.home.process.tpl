<section class="process-section section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zk.process.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.process.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zk.process.text' | lexicon}</p>
        </div>
        <ol class="process-grid">
            {set $stepIcons = ['i-talk', 'i-blueprint', 'i-crane', 'i-handover']}
            {foreach 1..4 as $n}
            <li class="step">
                <div class="step-top" aria-hidden="true">
                    <span class="step-ico"><svg class="icon"><use href="#{$stepIcons[$n - 1]}"/></svg></span>
                    <span class="step-num">0{$n}</span>
                    <span class="step-line"></span>
                    <svg class="icon step-arr"><use href="#i-arrow"/></svg>
                </div>
                <h3>{('zk.step' ~ $n ~ '.title') | lexicon}</h3>
                <p>{('zk.step' ~ $n ~ '.text') | lexicon}</p>
            </li>
            {/foreach}
        </ol>
    </div>
</section>
