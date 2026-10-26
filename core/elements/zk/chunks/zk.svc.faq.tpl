{if $d.faq}
<section class="svc-faq section svc-alt" id="faq">
    <div class="wrap svc-faq-layout">
        <div class="svc-faq-head">
            <div class="eyebrow">{'zks.faq.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zks.faq.title' | lexicon}</h2>
            <p>{'zks.faq.ask' | lexicon}</p>
            <button class="btn btn-dark" type="button" data-consult>{'zks.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
        <div class="svc-faq-list">
            {foreach $d.faq as $i => $f}
            <details class="faq-item" name="svc-faq"{if $i == 0} open{/if}>
                <summary><span>{$f.q}</span><i class="faq-sign" aria-hidden="true"></i></summary>
                <div class="article-content faq-answer">{$f.a}</div>
            </details>
            {/foreach}
        </div>
    </div>
</section>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "FAQPage",
    "mainEntity": [{foreach $d.faq as $i => $f}{if $i > 0},{/if}
        { "@type": "Question", "name": {$f.q | escape : 'js'}, "acceptedAnswer": { "@type": "Answer", "text": {$f.a | strip_tags | trim | escape : 'js'} } }{/foreach}
    ]
}
{ignore}</script>{/ignore}
{/if}
