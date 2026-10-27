{* Чому обирають «Здоровий Клімат»: cs-why, інакше «Переваги» сторінки *}
{set $whyRows = $c.why}
{if !$whyRows && $d.advantages}{set $whyRows = []}{foreach $d.advantages as $a}{set $whyRows[] = ['title' => $a.title, 'text' => ($a.text | strip_tags)]}{/foreach}{/if}
{if $whyRows}
<section class="us-why section" id="why">
    <div class="wrap">
        {set $hs = $c.sections.why}{set $hEyebrow = 'zku.why.eyebrow' | lexicon}{set $hTitle = 'zku.why.title' | lexicon}
        {include 'zk.cs.head'}
        <ul class="us-why-grid">
            {foreach $whyRows as $i => $w}<li><span class="us-why-num">{$i < 9 ? '0' : ''}{$i + 1}</span><h3>{$w.title}</h3>{if $w.text}<p>{$w.text}</p>{/if}</li>{/foreach}
        </ul>
    </div>
</section>
{/if}
