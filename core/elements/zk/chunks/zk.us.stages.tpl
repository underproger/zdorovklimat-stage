{* Етапи співпраці: від звернення до результату (номер — порядок етапів) *}
{if $c.stages}
<section class="us-stages section" id="stages">
    <div class="wrap">
        {set $hs = $c.sections.stages}{set $hEyebrow = 'zku.stages.eyebrow' | lexicon}{set $hTitle = 'zku.stages.title' | lexicon}
        {include 'zk.cs.head'}
        <ol class="us-stages-list">
            {foreach $c.stages as $i => $s}
            <li><span class="us-stage-num">{$i < 9 ? '0' : ''}{$i + 1}</span><h3>{$s.title}</h3>{if $s.text}<p>{$s.text}</p>{/if}</li>
            {/foreach}
        </ol>
    </div>
</section>
{/if}
