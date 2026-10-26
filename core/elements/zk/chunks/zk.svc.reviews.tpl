{if $d.reviews}
<section class="svc-reviews section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.reviews.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.reviews.title' | lexicon}</h2>
            </div>
        </div>
        <div class="svc-reviews-grid">
            {foreach $d.reviews as $r}
            <figure class="svc-review">
                <span class="svc-quote" aria-hidden="true">“</span>
                <blockquote>{$r.text}</blockquote>
                {if $r.name}<figcaption>{$r.name}</figcaption>{/if}
            </figure>
            {/foreach}
        </div>
    </div>
</section>
{/if}
