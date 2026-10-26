{if $d.extra.text}
<section class="svc-extra section">
    <div class="wrap svc-step{$d.extra.img ? '' : ' no-photo'}">
        {if $d.extra.img}<div class="svc-step-photo"><img src="{$d.extra.img}" alt="{$d.title | escape}" loading="lazy" width="900" height="700"></div>{/if}
        <div class="svc-step-text">
            {if $d.extra.title}<h2 class="section-title">{$d.extra.title}</h2>{/if}
            <div class="article-content">{$d.extra.text}</div>
            <button class="btn btn-yellow" type="button" data-consult>{'zks.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
    </div>
</section>
{/if}
