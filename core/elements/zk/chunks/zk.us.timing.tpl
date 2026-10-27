{* Від чого залежать терміни: горизонтальна схема *}
{if $c.timing}
<section class="us-timing section" id="timing">
    <div class="wrap">
        {set $hs = $c.sections.timing}{set $hEyebrow = 'zku.timing.eyebrow' | lexicon}{set $hTitle = 'zku.timing.title' | lexicon}
        {include 'zk.cs.head'}
        <ul class="us-timing-line">
            {foreach $c.timing as $t}<li><i aria-hidden="true"></i><b>{$t.title}</b>{if $t.text}<span>{$t.text}</span>{/if}</li>{/foreach}
        </ul>
        {if $hs.note}<p class="us-timing-note"><svg class="icon" aria-hidden="true"><use href="#i-clock"/></svg>{$hs.note}</p>{/if}
    </div>
</section>
{/if}
