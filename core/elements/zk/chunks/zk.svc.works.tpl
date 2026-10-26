{if $d.works}
{set $wn = $d.works | length}
{set $wcls = ''}
{if $wn == 3 || $wn == 5 || $wn == 6}{set $wcls = ' is-3'}{/if}
<section class="svc-works section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.works.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.works.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$zk.objects | url}">{'zks.works.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="svc-works-grid{$wcls}" data-gallery>
            {foreach $d.works as $i => $w}
            <button class="gallery-tile" type="button" data-full="{$w.full}" data-title="{($w.title ?: $d.title) | escape} — {$i + 1} / {$d.works | length}"{if $i > 7} hidden{/if}>
                <img src="{$w.thumb}" alt="{($w.title ?: $d.title) | escape}" loading="lazy" width="600" height="420">
                {if $i == 7 && ($d.works | length) > 8}<span class="gallery-more">+{($d.works | length) - 8}</span>{/if}
                <span class="round gallery-zoom" aria-hidden="true"><svg class="icon"><use href="#i-zoom"/></svg></span>
            </button>
            {/foreach}
        </div>
    </div>
</section>
{/if}
