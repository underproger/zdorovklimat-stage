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
        <div class="us-price-layout">
            {if $c.price.factor}
            <div class="us-price-factors">
                <p class="us-sub">{'zku.price.factors' | lexicon}</p>
                <ol class="us-factor-list">
                    {foreach $c.price.factor as $f}<li><b>{$f.title}</b>{if $f.text}<span>{$f.text}</span>{/if}</li>{/foreach}
                </ol>
            </div>
            {/if}
            <aside class="us-price-card">
                {if $c.price.included}<p class="us-sub">{'zku.price.included' | lexicon}</p><ul class="us-check-list">{foreach $c.price.included as $f}<li>{$f.title}{if $f.text} <span>{$f.text}</span>{/if}</li>{/foreach}</ul>{/if}
                {if $c.price.extra}<p class="us-sub">{'zku.price.extra' | lexicon}</p><ul class="us-dash-list">{foreach $c.price.extra as $f}<li>{$f.title}{if $f.text} <span>{$f.text}</span>{/if}</li>{/foreach}</ul>{/if}
                {if $c.price.input}<p class="us-sub">{'zku.price.input' | lexicon}</p><ul class="us-dash-list">{foreach $c.price.input as $f}<li>{$f.title}{if $f.text} <span>{$f.text}</span>{/if}</li>{/foreach}</ul>{/if}
                <a class="btn btn-yellow btn-glow" href="{$zk.self}#calc">{'zku.price.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
            </aside>
        </div>
        {if $d.price.rows}
        <div class="svc-table-wrap us-price-table">
            {if $d.price.title}<h3 class="svc-price-title">{$d.price.title}</h3>{/if}
            <table class="svc-table"><thead><tr><th>{$d.price.col1 ?: ('zks.price.col1' | lexicon)}</th><th>{$d.price.col2 ?: ('zks.price.col2' | lexicon)}</th></tr></thead><tbody>{foreach $d.price.rows as $r}<tr><td>{$r.name}</td><td>{$r.price}</td></tr>{/foreach}</tbody></table>
        </div>
        {/if}
    </div>
</section>
{/if}
