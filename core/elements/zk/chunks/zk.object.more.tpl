{set $more = $_modx->runSnippet('pdoResources', [
    'parents' => $catId,
    'depth' => 0,
    'resources' => '-' ~ $res.id,
    'limit' => 3,
    'sortby' => 'menuindex',
    'sortdir' => 'ASC',
    'includeTVs' => 'object-img,object-date',
    'tvPrefix' => 'tv.',
    'tpl' => 'zk.tpl.object.item',
]) | trim}
{if $more}
<section class="objects-section objects-more-section section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zko.obj.more.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zko.obj.more.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$catId | url}">{'zko.obj.more.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="project-grid object-grid">
            {$more}
        </div>
    </div>
</section>
{/if}
