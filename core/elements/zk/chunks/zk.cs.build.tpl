{* «Як ми будуємо»: етапи будівництва з фото (номер — порядок етапів) *}
{if $c.build}
<section class="cs-build section" id="build">
    <div class="wrap">
        {set $hs = $c.sections.build}{set $hEyebrow = 'zkc.build.eyebrow' | lexicon}{set $hTitle = 'zkc.build.title' | lexicon}
        {include 'zk.cs.head'}
        <ol class="cs-build-grid">
            {foreach $c.build as $i => $b}
            <li class="cs-step">
                <div class="cs-step-photo">{if $b.img}<img src="{$b.img}" alt="{$b.title | escape}" loading="lazy" width="640" height="480">{/if}</div>
                <div class="cs-step-body">
                    <span class="cs-num">0{$i + 1}</span>
                    <h3>{$b.title}</h3>
                    {if $b.text}<p>{$b.text}</p>{/if}
                </div>
            </li>
            {/foreach}
        </ol>
        <div class="cs-center"><button class="btn btn-yellow btn-glow" type="button" data-consult>{'zkc.build.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button></div>
    </div>
</section>
{/if}
