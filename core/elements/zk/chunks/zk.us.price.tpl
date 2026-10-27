{* Вартість (варіант А — індивідуальний розрахунок): що впливає на ціну, що входить у кошторис, що окремо, що потрібно для розрахунку; таблиця цін старої сторінки, якщо є *}
{if $c.price || $d.price.rows}
{set $hs = $c.sections.price}
<section class="us-price section" id="price">
    <div class="wrap">
        <div class="section-head cs-head">
            <div>
                <div class="eyebrow">{$hs.eyebrow ?: ('zku.price.eyebrow' | lexicon)}</div>
                <h2 class="section-title">{$hs.title ?: ('zku.price.title' | lexicon)}</h2>
            </div>
            {if $hs.text}<p class="section-description">{$hs.text}</p>{/if}
        </div>
        {if $c.price.factor}
        {set $fn = $c.price.factor | length}
        <p class="us-sub us-pf-sub">{'zku.price.factors' | lexicon}</p>
        <ol class="us-pf-grid{($fn == 4 || $fn == 8) ? ' is-4' : ''}{$fn == 2 ? ' is-2' : ''}">
            {foreach $c.price.factor as $i => $f}
            <li class="us-pf">
                <span class="us-pf-num" aria-hidden="true">{$i < 9 ? '0' : ''}{$i + 1}</span>
                <h3>{$f.title}</h3>
                {if $f.text}<p>{$f.text}</p>{/if}
            </li>
            {/foreach}
        </ol>
        {/if}
        {if $c.price.included || $c.price.extra || $c.price.input}
        {* що входить / окремо / що потрібно — темна панель на всю ширину *}
        <div class="us-pp">
            {if $c.price.included}
            <div class="us-pp-col">
                <p class="us-pp-head"><i><svg class="icon" aria-hidden="true"><use href="#i-check"/></svg></i>{'zku.price.included' | lexicon}</p>
                <ul class="us-pp-list is-check">{foreach $c.price.included as $f}<li>{$f.title}{if $f.text}<span>{$f.text}</span>{/if}</li>{/foreach}</ul>
            </div>
            {/if}
            {if $c.price.extra}
            <div class="us-pp-col">
                <p class="us-pp-head"><i><svg class="icon" aria-hidden="true"><use href="#i-talk"/></svg></i>{'zku.price.extra' | lexicon}</p>
                <ul class="us-pp-list is-plus">{foreach $c.price.extra as $f}<li>{$f.title}{if $f.text}<span>{$f.text}</span>{/if}</li>{/foreach}</ul>
            </div>
            {/if}
            {if $c.price.input}
            <div class="us-pp-col">
                <p class="us-pp-head"><i><svg class="icon" aria-hidden="true"><use href="#i-docs"/></svg></i>{'zku.price.input' | lexicon}</p>
                <ul class="us-pp-list is-dot">{foreach $c.price.input as $f}<li>{$f.title}{if $f.text}<span>{$f.text}</span>{/if}</li>{/foreach}</ul>
            </div>
            {/if}
        </div>
        {/if}
        {if $d.price.rows}
        <div class="svc-table-wrap us-price-table">
            {if $d.price.title}<h3 class="svc-price-title">{$d.price.title}</h3>{/if}
            <table class="svc-table"><thead><tr><th>{$d.price.col1 ?: ('zks.price.col1' | lexicon)}</th><th>{$d.price.col2 ?: ('zks.price.col2' | lexicon)}</th></tr></thead><tbody>{foreach $d.price.rows as $r}<tr><td>{$r.name}</td><td>{$r.price}</td></tr>{/foreach}</tbody></table>
        </div>
        {/if}
    </div>
</section>
{/if}
