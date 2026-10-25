<section class="article-hero object-hero">
    <div class="wrap">
        {include 'zk.crumbs'}
        <div class="object-head">
            <div class="object-head-copy">
                <a class="eyebrow eyebrow-link" href="{$catId | url}">{$catName}</a>
                <h1>{$title}</h1>
            </div>
            {if $year || $place || $photoCount}
            <ul class="object-facts">
                {if $year}<li><i class="chip-icon"><svg aria-hidden="true"><use href="#i-calendar"/></svg></i><span><small>{'zko.obj.year' | lexicon}</small>{$year}</span></li>{/if}
                {if $place}<li class="is-place"><i class="chip-icon"><svg aria-hidden="true"><use href="#i-pin"/></svg></i><span><small>{'zko.obj.place' | lexicon}</small>{$place}</span></li>{/if}
                {if $photoCount}<li><i class="chip-icon"><svg aria-hidden="true"><use href="#i-camera"/></svg></i><span><small>{'zko.obj.photos' | lexicon}</small>{$photoCount}</span></li>{/if}
            </ul>
            {/if}
        </div>
    </div>
</section>
