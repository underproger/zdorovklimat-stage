{if $d.advantages}
<section class="svc-adv section svc-alt">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.adv.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.adv.title' | lexicon}</h2>
            </div>
        </div>
        <ol class="svc-adv-grid">
            {foreach $d.advantages as $i => $a}
            <li class="svc-adv-item">
                {if $a.title}<h3>{$a.title}</h3>{/if}
                {if $a.text}<p>{$a.text}</p>{/if}
            </li>
            {/foreach}
        </ol>
    </div>
</section>
{/if}
