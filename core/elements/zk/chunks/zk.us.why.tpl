{* Чому обирають «Здоровий Клімат»: cs-why послуги, порожньо — напряму *}
{set $whyRows = $c.why}
{if $whyRows}
<section class="us-why section" id="why">
    <div class="wrap">
        {set $hs = $c.sections.why}{set $hEyebrow = 'zku.why.eyebrow' | lexicon}{set $hTitle = 'zku.why.title' | lexicon}
        {include 'zk.cs.head'}
        <ul class="us-why-grid">
            {foreach $whyRows as $i => $w}<li><span class="cs-num">{$i < 9 ? '0' : ''}{$i + 1}</span><h3>{$w.title}</h3>{if $w.text}<p>{$w.text}</p>{/if}</li>{/foreach}
        </ul>
    </div>
</section>
{/if}
