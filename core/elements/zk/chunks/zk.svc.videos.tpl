{if $d.videos}
<section class="svc-videos section svc-alt">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.videos.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zks.videos.title' | lexicon}</h2>
            </div>
            {if $d.videoText}<div class="section-description article-content">{$d.videoText}</div>{/if}
        </div>
        <div class="video-grid">
            {foreach $d.videos as $i => $v}
            <article class="video-card">
                <div class="video-cover">
                    <img src="https://i.ytimg.com/vi/{$v}/mqdefault.jpg" alt="" loading="lazy" width="320" height="180">
                    <span class="video-play" aria-hidden="true"><svg><use href="#i-play"/></svg></span>
                </div>
                <div class="video-body">
                    <h3><button class="video-open" type="button" data-video="{$v}" data-title="{$d.title | escape}">{$d.title}</button></h3>
                    <span class="video-watch" aria-hidden="true">{'zks.watch' | lexicon}<i class="round"><svg class="icon"><use href="#i-arrow"/></svg></i></span>
                </div>
            </article>
            {/foreach}
        </div>
    </div>
</section>
{/if}
