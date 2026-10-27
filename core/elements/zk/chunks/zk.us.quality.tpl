{* Контроль якості на кожному етапі *}
{if $c.quality}
<section class="us-quality section" id="quality">
    <div class="wrap us-quality-layout">
        {set $hs = $c.sections.quality}
        <div class="us-quality-head">
            <div class="eyebrow">{$hs.eyebrow ?: ('zku.quality.eyebrow' | lexicon)}</div>
            <h2 class="section-title">{$hs.title ?: ('zku.quality.title' | lexicon)}</h2>
            {if $hs.text}<p>{$hs.text}</p>{/if}
        </div>
        <ol class="us-quality-list">
            {foreach $c.quality as $q}<li><i aria-hidden="true"><svg class="icon"><use href="#i-shield"/></svg></i><div><b>{$q.title}</b>{if $q.text}<span>{$q.text}</span>{/if}</div></li>{/foreach}
        </ol>
    </div>
</section>
{/if}
