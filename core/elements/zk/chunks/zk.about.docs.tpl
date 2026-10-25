{set $docs = 'zka.docs.list' | lexicon | split : '||'}
<section class="docs-section" id="docs">
    <div class="docs-lines" aria-hidden="true"><i></i><i></i></div>
    <div class="wrap docs-layout">
        <div class="docs-copy">
            <div class="eyebrow"><span class="num">03</span><span class="sep">/</span>{'zka.docs.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zka.docs.title' | lexicon}</h2>
            <p class="docs-text">{'zka.docs.text' | lexicon}</p>
            <p class="docs-label">{'zka.docs.stages' | lexicon}</p>
            <ul class="stage-list">
                {foreach ('zka.docs.stage_list' | lexicon | split : '||') as $stage}
                {set $st = $stage | split : '::'}
                <li><b>{$st[0]}</b><span>{$st[1]}</span></li>
                {/foreach}
            </ul>
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zka.docs.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
        <div class="docs-panel">
            <div class="docs-count"><b>{$docs | length}</b><span>{'zka.docs.sections' | lexicon}</span></div>
            <ol class="docs-list">
                {foreach $docs as $i => $doc}
                <li><span>{($i < 9 ? '0' : '') ~ ($i + 1)}</span>{$doc}</li>
                {/foreach}
            </ol>
        </div>
    </div>
</section>
