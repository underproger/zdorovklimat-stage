{* Гарантії й підтримка після завершення робіт *}
{if $c.warranty}
<section class="us-warranty section" id="warranty">
    <div class="wrap">
        {set $hs = $c.sections.warranty}{set $hEyebrow = 'zku.warranty.eyebrow' | lexicon}{set $hTitle = 'zku.warranty.title' | lexicon}
        {include 'zk.cs.head'}
        <ul class="us-warranty-grid">
            {foreach $c.warranty as $w}<li><i aria-hidden="true"><svg class="icon"><use href="#i-check"/></svg></i><h3>{$w.title}</h3>{if $w.text}<p>{$w.text}</p>{/if}</li>{/foreach}
        </ul>
        {if $hs.note}<p class="us-note">{$hs.note}</p>{/if}
    </div>
</section>
{/if}
