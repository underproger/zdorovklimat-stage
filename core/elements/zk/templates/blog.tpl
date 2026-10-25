{extends 'zk.layout'}
{block 'body_class'} zk-blog{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:blog')}
{include 'zk.blog.hero'}
<section class="blog-list" id="posts">
    <div class="wrap">
{* усі статті без пагінації: шаблон кешується цілком, а некешований pdoPage з @INLINE-шаблонами
   ламається повторним проходом Fenom. Статей мало; якщо їх стане багато — винести tpl пагінації в чанки *}
{set $posts = $_modx->runSnippet('pdoResources', [
    'parents' => $_modx->resource.id,
    'depth' => 1,
    'limit' => 0,
    'hideContainers' => 1,
    'sortby' => 'publishedon',
    'sortdir' => 'DESC',
    'includeTVs' => 'img-blog-prew',
    'tvPrefix' => 'tv.',
    'tpl' => 'zk.tpl.blog.item',
]) | trim}
        {if $posts}
        <div class="blog-row">
            {$posts}
        </div>
        {else}
        <p class="blog-empty">{'zkb.empty' | lexicon}</p>
        {/if}
    </div>
</section>
{include 'zk.home.contact'}
{/block}
