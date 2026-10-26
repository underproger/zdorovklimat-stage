<section class="section services-dirs" id="directions">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.dirs.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.dirs.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zks.dirs.text' | lexicon}</p>
        </div>
        <div class="service-grid is-3">
            {foreach $d.children as $i => $c}
            <a class="service-card" href="{$c.id | url}">
                {if $c.img}<img src="{$c.img}" alt="{$c.title | escape}" loading="lazy" width="760" height="520">{/if}
                <span class="card-arrow"><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></span>
                <div class="card-bottom">
                    <h3>{$c.title}</h3>
                    {if $c.subLabel}<span class="card-tag">{$c.subLabel}</span>{/if}
                </div>
            </a>
            {/foreach}
        </div>
    </div>
</section>
<section class="section svc-alt services-catalog" id="catalog">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.all.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.all.title' | lexicon}</h2>
            </div>
        </div>
        <div class="svc-catalog">
            {foreach $d.children as $i => $c}
            <div class="svc-cat-group">
                <a class="svc-cat-title" href="{$c.id | url}">{$c.title}</a>
                {if $c.kids}
                <ul>
                    {foreach $c.kids as $k}<li><a href="{$k.id | url}">{$k.title}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a></li>{/foreach}
                </ul>
                {/if}
            </div>
            {/foreach}
        </div>
    </div>
</section>
