<section class="article-section">
    <div class="wrap article-layout">
        <article class="article-main">
            {if $cover}
            <figure class="article-cover"><img src="{$cover}" alt="{'zkb.cover' | lexicon}: {$title | escape}" fetchpriority="high"></figure>
            {/if}
            <div class="article-content" data-article>
                {$content}
            </div>
            <div class="article-foot">
                <a class="text-link back-link" href="{$res.parent | url}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg>{'zkb.back' | lexicon}</a>
            </div>
        </article>
        <aside class="article-aside">
            <div class="article-sticky">
                <nav class="toc-card" data-toc hidden aria-label="{'zkb.toc' | lexicon}">
                    <p class="toc-title">{'zkb.toc' | lexicon}</p>
                    <ol></ol>
                </nav>
                <div class="cta-card">
                    <i class="cta-plus" aria-hidden="true"></i>
                    <p class="cta-title">{'zkb.cta.title' | lexicon}</p>
                    <p class="cta-text">{'zkb.cta.text' | lexicon}</p>
                    <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zk.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                    <a class="cta-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
                </div>
            </div>
        </aside>
    </div>
</section>
