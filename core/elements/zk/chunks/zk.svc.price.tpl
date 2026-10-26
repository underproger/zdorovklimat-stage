{if $d.price.intro || $d.price.rows || $d.price.text}
<section class="svc-price section svc-alt" id="price">
    <div class="wrap svc-price-layout">
        <div class="svc-price-copy">
            <div class="eyebrow">{'zks.price.eyebrow' | lexicon}</div>
            {if $d.price.intro}<div class="article-content">{$d.price.intro}</div>{/if}
            {if $d.price.rows}
            {if $d.price.title}<h3 class="svc-price-title">{$d.price.title}</h3>{/if}
            <div class="svc-table-wrap">
                <table class="svc-table">
                    <thead><tr><th>{$d.price.col1 ?: ('zks.price.col1' | lexicon)}</th><th>{$d.price.col2 ?: ('zks.price.col2' | lexicon)}</th></tr></thead>
                    <tbody>
                        {foreach $d.price.rows as $r}<tr><td>{$r.name}</td><td>{$r.price}</td></tr>{/foreach}
                    </tbody>
                </table>
            </div>
            {/if}
            {if $d.price.text}<div class="article-content">{$d.price.text}</div>{/if}
        </div>
        <aside class="svc-price-cta">
            <p class="cta-title">{'zks.price.cta_title' | lexicon}</p>
            <p class="cta-text">{'zks.price.cta_text' | lexicon}</p>
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zks.price.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </aside>
    </div>
</section>
{/if}
