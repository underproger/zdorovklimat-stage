{* Типи об’єктів, які будуємо: картка з фото, кнопка відкриває заявку з назвою типу *}
{if $c.types}
<section class="cs-types section" id="types">
    <div class="wrap">
        {set $hs = $c.sections.types}{set $hEyebrow = 'zkc.types.eyebrow' | lexicon}{set $hTitle = 'zkc.types.title' | lexicon}
        {include 'zk.cs.head'}
        {* 3 або 4 картки в ряд — що дає менше порожніх місць в останньому ряду *}
        {set $tn = $c.types | length}{set $te3 = (3 - $tn % 3) % 3}{set $te4 = (4 - $tn % 4) % 4}
        <div class="cs-types-grid{($tn > 3 && $te4 < $te3) ? ' is-4' : ''}">
            {foreach $c.types as $t}
            <article class="cs-type">
                <div class="cs-type-photo">{if $t.img}<img src="{$t.img}" alt="{$t.title | escape}" loading="lazy" width="760" height="470">{/if}</div>
                <div class="cs-type-body">
                    <span class="cs-dash" aria-hidden="true"></span>
                    <h3>{$t.title}</h3>
                    {if $t.text}<p>{$t.text}</p>{/if}
                    <button class="cs-type-link" type="button" data-consult="{$t.title | escape}">{'zkc.types.discuss' | lexicon}<i class="round"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></i></button>
                </div>
            </article>
            {/foreach}
        </div>
        <div class="cs-types-foot">
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zkc.types.pick' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            <button class="cs-consult-link" type="button" data-consult>{'zkc.types.consult' | lexicon}</button>
            {if $hs.note}<p class="cs-note"><i aria-hidden="true"><svg class="icon"><use href="#i-article"/></svg></i>{$hs.note}</p>{/if}
        </div>
    </div>
</section>
{/if}
