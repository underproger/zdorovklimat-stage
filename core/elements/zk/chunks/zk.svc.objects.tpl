{if $d.objects}
{set $objCards = $_modx->runSnippet('pdoResources', [
    'parents' => 0,
    'resources' => $d.objects,
    'limit' => 6,
    'sortby' => 'FIELD(modResource.id,' ~ $d.objects ~ ')',
    'sortdir' => '',
    'includeTVs' => 'object-img,object-date',
    'tvPrefix' => 'tv.',
    'tpl' => 'zk.tpl.object.item',
]) | trim}
{if $objCards}
<section class="objects-section section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.objects.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.objects.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$zk.objects | url}">{'zks.works.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="project-grid object-grid">{$objCards}</div>
    </div>
</section>
{/if}
{/if}
