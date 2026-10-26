{if $d.textSeo}
<section class="seo-section" id="seo">
    <div class="wrap">
        <div class="seo-block" data-collapsible>
            <div class="seo-text" id="seo-text">{$d.textSeo}</div>
            <button class="text-link seo-toggle" type="button" aria-expanded="false" aria-controls="seo-text" data-more="{'zk.seo.more' | lexicon}" data-less="{'zk.seo.less' | lexicon}" hidden>{'zk.seo.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></button>
        </div>
    </div>
</section>
{/if}
