{if $videos}
<section class="videos-section section" id="videos">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zkv.list.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zkv.list.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zkv.list.text' | lexicon}</p>
            {if $zk.youtube && $zk.youtube != '#'}
            <a class="text-link" href="{$zk.youtube}" target="_blank" rel="noopener">{'zkv.hero.channel' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
            {/if}
        </div>
        <div class="video-grid">
            {foreach $videos as $i => $v}
            <article class="video-card">
                <div class="video-cover">
                    <img src="{$v.cover}" alt="" loading="lazy" width="640" height="360">
                    <span class="video-play" aria-hidden="true"><svg><use href="#i-play"/></svg></span>
                </div>
                <div class="video-body">
                    <span class="video-label">{'zkv.card.label' | lexicon}</span>
                    <h3><button class="video-open" type="button" data-video="{$v.id}" data-title="{$v.title | escape}">{$v.title}</button></h3>
                    <span class="video-watch" aria-hidden="true">{'zkv.card.watch' | lexicon}<i class="round"><svg class="icon"><use href="#i-arrow"/></svg></i></span>
                </div>
            </article>
            {/foreach}
        </div>
    </div>
</section>
{/if}
