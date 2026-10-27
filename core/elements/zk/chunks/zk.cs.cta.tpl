{* Банер-заклик на всю ширину з фото *}
{set $cta = $c.sections.cta}
{if $cta.title}
<section class="cs-cta">
    <div class="wrap">
        <div class="cs-cta-box">
            {if $cta.img}<img class="cs-cta-bg" src="{$cta.img}" alt="" loading="lazy" width="1920" height="640">{/if}
            <p class="cs-cta-title">{$cta.title}</p>
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zkc.cta.btn' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
    </div>
</section>
{/if}
