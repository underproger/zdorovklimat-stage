{set $cardImg = ['hero.webp', 'steel.webp', 'card-cold.webp', 'card-design.webp']}
<section class="section wrap" id="services">
    <div class="section-head">
        <div>
            <div class="eyebrow"><span class="num">01</span><span class="sep">/</span>{'zk.services.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zk.services.title' | lexicon}</h2>
        </div>
        <p class="section-description">{'zk.services.text' | lexicon}</p>
        <a class="text-link" href="{$zk.services | url}">{'zk.all_services' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
    </div>
    <div class="service-grid">
        {foreach $zk.cards as $i => $cardId}
        {set $n = $i + 1}
        <a class="service-card" href="{$cardId | url}">
            <img src="{$zk.assets}img/{$cardImg[$i]}" alt="{$cardId | resource : 'pagetitle' | escape}" loading="lazy" width="410" height="365">
            <span class="number">0{$n}</span>
            <span class="card-arrow"><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></span>
            <div class="card-bottom">
                <h3>{('zk.card' ~ $n ~ '.title') | lexicon}</h3>
                <span class="card-tag">{('zk.card' ~ $n ~ '.tag') | lexicon}</span>
            </div>
        </a>
        {/foreach}
    </div>
    <div class="engineering">
        <p class="engineering-label"><b>{'zk.engineering.title' | lexicon}</b>{'zk.engineering.text' | lexicon}</p>
        <div class="engineering-links">
            {$_modx->runSnippet('pdoResources', [
                'parents' => $zk.services,
                'resources' => '-' ~ ($zk.cards | join : ',-'),
                'depth' => 0,
                'limit' => 0,
                'sortby' => '{"menuindex":"ASC","id":"ASC"}',
                'tpl' => '@INLINE <a href="{$id | url}">{$menutitle ?: $pagetitle}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>',
                'showHidden' => 0,
            ])}
        </div>
    </div>
</section>
