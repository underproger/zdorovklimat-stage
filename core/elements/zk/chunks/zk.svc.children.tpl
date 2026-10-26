{if $d.children}
<section class="svc-children section svc-alt" id="children">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.children.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.children.title' | lexicon}</h2>
            </div>
            <p class="section-description">{$d.childrenLabel}</p>
        </div>
        <div class="svc-grid">
            {foreach $d.children as $c}
            <a class="svc-card" href="{$c.id | url}">
                <span class="svc-card-photo">{if $c.img}<img src="{$c.img}" alt="{$c.title | escape}" loading="lazy" width="760" height="520">{/if}</span>
                <span class="svc-card-body">
                    <span class="svc-card-title">{$c.title}</span>
                    {if $c.intro}<span class="svc-card-text">{$c.intro}</span>{/if}
                    <span class="svc-card-foot">{if $c.subLabel}<span>{$c.subLabel}</span>{else}<span>{'zks.more' | lexicon}</span>{/if}<i class="round"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></i></span>
                </span>
            </a>
            {/foreach}
        </div>
    </div>
</section>
{/if}
