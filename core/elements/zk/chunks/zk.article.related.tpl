{set $related = $_modx->runSnippet('pdoResources', [
    'parents' => $res.parent,
    'depth' => 1,
    'resources' => '-' ~ $res.id,
    'limit' => 3,
    'sortby' => 'publishedon',
    'sortdir' => 'DESC',
    'includeTVs' => 'img-blog-prew',
    'tvPrefix' => 'tv.',
    'tpl' => 'zk.tpl.blog.item',
]) | trim}
{if $related}
<section class="blog-section related-section section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zkb.related.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zkb.related.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$res.parent | url}">{'zkb.back' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="blog-row">
            {$related}
        </div>
    </div>
</section>
{/if}
