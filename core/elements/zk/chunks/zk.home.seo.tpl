{set $text = $_modx->resource.content | trim}
{if $text}
<section class="seo-section" id="seo">
    <div class="wrap seo-layout">
        <div class="eyebrow">{'zk.seo.eyebrow' | lexicon}</div>
        <div class="seo-body" data-collapsible>
            <div class="seo-text" id="seo-text">{$text | replace : '<h1' : '<h2' | replace : '</h1>' : '</h2>'}</div>
            <button class="text-link seo-toggle" type="button" aria-expanded="false" aria-controls="seo-text" data-more="{'zk.seo.more' | lexicon}" data-less="{'zk.seo.less' | lexicon}" hidden>{'zk.seo.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></button>
        </div>
    </div>
</section>
{/if}
