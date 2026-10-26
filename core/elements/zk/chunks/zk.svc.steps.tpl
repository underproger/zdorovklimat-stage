{if $d.steps.items || $d.steps.after}
<section class="svc-steps section">
    <div class="wrap">
        <div class="section-head svc-steps-head">
            <div>
                <div class="eyebrow">{'zks.steps.eyebrow' | lexicon}</div>
                <h2 class="section-title svc-steps-title">{$d.steps.title ?: ('zks.steps.title' | lexicon)}</h2>
            </div>
        </div>
        {if $d.steps.items}
        <div class="svc-steps-grid{($d.steps.items | length) == 4 ? ' is-4' : ''}">
            {foreach $d.steps.items as $i => $s}
            <article class="svc-step">
                <div class="svc-step-photo">
                    {if $s.img}<img src="{$s.img}" alt="{$s.alt ?: ($d.title | escape)}" loading="lazy" width="900" height="640">{/if}
                    <span class="svc-step-num">0{$i + 1}</span>
                </div>
                <div class="svc-step-text article-content">{$s.html}</div>
            </article>
            {/foreach}
        </div>
        {/if}
        {if $d.steps.after}<div class="article-content svc-steps-after">{$d.steps.after}</div>{/if}
    </div>
</section>
{/if}
