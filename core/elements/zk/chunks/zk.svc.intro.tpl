{if $d.textMain}
<section class="svc-intro section">
    <div class="wrap svc-intro-layout">
        <div class="article-content svc-text">{$d.textMain}</div>
        <aside class="cta-card svc-cta">
            <i class="cta-plus" aria-hidden="true"></i>
            <div class="cta-copy">
                <p class="cta-title">{'zks.cta.title' | lexicon}</p>
                <p class="cta-text">{'zks.cta.text' | lexicon}</p>
            </div>
            <div class="cta-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zk.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="cta-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
            </div>
        </aside>
    </div>
</section>
{/if}
