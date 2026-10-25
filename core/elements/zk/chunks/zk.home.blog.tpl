{set $posts = $_modx->runSnippet('pdoResources', [
    'parents' => $zk.blog,
    'depth' => 1,
    'limit' => 3,
    'sortby' => 'publishedon',
    'sortdir' => 'DESC',
    'includeTVs' => 'img-blog-prew',
    'tvPrefix' => 'tv.',
    'return' => 'json',
]) | fromJSON}
{if $posts}
<section class="blog-section section" id="blog">
    <div class="blog-decor" aria-hidden="true"><img src="{$zk.assets}img/blog-decor.jpg" alt="" loading="lazy" width="310" height="150"><i class="plus"></i></div>
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow"><span class="num">05</span><span class="sep">/</span>{'zk.blog.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.blog.title' | lexicon}</h2>
            </div>
            <a class="text-link" href="{$zk.blog | url}">{'zk.blog.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div class="blog-row">
            {foreach $posts as $i => $post}
            {set $img = $post['tv.img-blog-prew'] | replace : 'ru/' : ''}
            {if $img && !($img | ematch : '/[^\x20-\x7E]/')}
                {set $img = $_modx->runSnippet('pthumb', ['input' => $img, 'options' => 'w=820&h=300&zc=1&q=80&f=jpg']) | ereplace : '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/+~' : '/'}
            {elseif $img}
                {set $img = '/' ~ ($img | ereplace : '~^/+~' : '')}
            {/if}
            {set $url = $post.id | url}
            <article class="blog-card">
                <a class="blog-photo" href="{$url}" tabindex="-1" aria-hidden="true">
                    {if $img}<img src="{$img}" alt="" loading="lazy" width="820" height="300">{/if}
                    <span class="blog-num">0{$i + 1}</span>
                </a>
                <div class="blog-body">
                    <div class="eyebrow">{'zk.blog.cat' | lexicon}</div>
                    <h3><a href="{$url}">{$post.menutitle ?: $post.pagetitle}</a></h3>
                    <p>{($post.introtext ?: $post.description) | strip_tags | truncate : 120 : '…'}</p>
                    <div class="blog-foot">
                        <a class="text-link" href="{$url}">{'zk.blog.read' | lexicon}</a>
                        <a class="round" href="{$url}" tabindex="-1" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></a>
                    </div>
                </div>
            </article>
            {/foreach}
        </div>
    </div>
</section>
{/if}
