{* Напрями розділу «Об’єкти» з кількістю об’єктів — під блоком «Портфоліо» ($catList, $activeCat) *}
{if $catList}
<section class="objcats-section" aria-labelledby="objcats-title">
    <div class="wrap objcats-layout">
        <div class="objcats-head">
            <div class="eyebrow">{'zko.hero.panel' | lexicon}</div>
            <h2 class="objcats-title" id="objcats-title">{'zko.cats.title' | lexicon}</h2>
        </div>
        <ul class="objcats-list">
            {foreach $catList as $c}
            <li><a class="objcat{$c.id == $activeCat ? ' is-active' : ''}" href="{$c.id | url}"{if $c.id == $activeCat} aria-current="page"{/if}><span>{$c.name}</span><b>{$c.n}</b><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a></li>
            {/foreach}
        </ul>
    </div>
</section>
{/if}
