{* «Наш підхід»: чотири етапи роботи одного підрядника (номер — порядок етапів) *}
{if $c.approach}
<section class="cs-approach section" id="approach">
    <div class="wrap">
        {set $hs = $c.sections.approach}{set $hEyebrow = 'zkc.approach.eyebrow' | lexicon}{set $hTitle = 'zkc.approach.title' | lexicon}
        {include 'zk.cs.head'}
        <ol class="cs-approach-list">
            {foreach $c.approach as $i => $a}
            <li>
                <span class="cs-num">0{$i + 1}</span>
                <h3>{$a.title}</h3>
                {if $a.text}<p>{$a.text}</p>{/if}
            </li>
            {/foreach}
        </ol>
    </div>
</section>
{/if}
