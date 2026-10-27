{* Що отримує замовник: велике фото результату й 3–4 пункти, темне тло *}
{if $c.result}
{set $hs = $c.sections.result}
<section class="us-result section" id="result">
    <div class="wrap us-result-layout">
        <div class="us-result-photo">{if $hs.img}<img src="{$hs.img}" alt="{($hs.title ?: ('zku.result.title' | lexicon)) | strip_tags | escape}" loading="lazy" width="1100" height="820">{/if}</div>
        <div class="us-result-copy">
            <div class="eyebrow">{$hs.eyebrow ?: ('zku.result.eyebrow' | lexicon)}</div>
            <h2 class="section-title">{$hs.title ?: ('zku.result.title' | lexicon)}</h2>
            {if $hs.text}<p class="us-result-lead">{$hs.text}</p>{/if}
            <ul class="us-result-list">
                {foreach $c.result as $r}
                <li><i aria-hidden="true"><svg class="icon"><use href="#i-check"/></svg></i><div><b>{$r.title}</b>{if $r.text}<span>{$r.text}</span>{/if}</div></li>
                {/foreach}
            </ul>
        </div>
    </div>
</section>
{/if}
