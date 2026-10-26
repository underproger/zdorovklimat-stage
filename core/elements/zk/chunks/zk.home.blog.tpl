{set $posts = $_modx->runSnippet('pdoResources', [
    'parents' => $zk.blog,
    'depth' => 1,
    'limit' => 3,
    'sortby' => 'publishedon',
    'sortdir' => 'DESC',
    'includeTVs' => 'img-blog-prew',
    'tvPrefix' => 'tv.',
    'tpl' => 'zk.tpl.blog.item',
]) | trim}
{if $posts}
<section class="blog-section section" id="blog">
    <div class="blog-decor" aria-hidden="true"><img src="{$zk.assets}img/blog-decor.jpg" alt="" loading="lazy" width="310" height="150"><i class="plus"></i></div>
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zk.blog.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.blog.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$zk.blog | url}">{'zk.blog.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="blog-row">
            {$posts}
        </div>
    </div>
</section>
{/if}
