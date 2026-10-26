{set $zkUrlRe = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/+~'}
{set $ids = $_modx->runSnippet('pdoField', ['id' => $_modx->resource.id, 'field' => 'home-objects']) | trim}
{set $params = [
    'parents' => $zk.objects,
    'depth' => 2,
    'limit' => 6,
    'includeTVs' => 'object-img',
    'tvPrefix' => 'tv.',
    'showHidden' => 1,
    'return' => 'json',
]}
{if $ids}
    {set $params.resources = $ids}
    {set $params.sortby = 'FIELD(modResource.id,' ~ $ids ~ ')'}
    {set $params.sortdir = ''}
{else}
    {set $params.where = '{"template":18}'}
    {set $params.sortby = 'publishedon'}
    {set $params.sortdir = 'DESC'}
{/if}
{set $rows = $_modx->runSnippet('pdoResources', $params) | fromJSON}
{set $cats = []}
{foreach $rows as $row}{set $cats[$row.parent] = ('zk.cat.' ~ $row.parent) | lexicon}{/foreach}
<section class="projects-section section" id="projects">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zk.projects.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.projects.title' | lexicon}</h2>
            </div>
            <p class="section-description">{'zk.projects.text' | lexicon}</p>
            <a class="text-link" href="{$zk.objects | url}">{'zk.projects.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        <div data-projects data-forms="{'zk.projects.forms' | lexicon}">
            <div class="filter-row">
                <button class="filter active" type="button" data-filter="all" aria-pressed="true">{'zk.projects.all' | lexicon}</button>
                {foreach $cats as $catId => $catName}
                <button class="filter" type="button" data-filter="{$catId}" aria-pressed="false">{$catName}</button>
                {/foreach}
                <span class="project-count" data-count aria-live="polite"></span>
            </div>
            <div class="project-grid">
                {foreach $rows as $row}
                {set $src = $row['tv.object-img'] | replace : 'ru/' : ''}
                {if !$src}
                    {set $thumb = ''}{set $big = ''}
                {elseif $src | ematch : '/[^\x20-\x7E]/'}
                    {* pThumb ламає кириличні імена файлів — віддаємо оригінал *}
                    {set $thumb = '/' ~ ($src | ereplace : '~^/+~' : '')}{set $big = $thumb}
                {else}
                    {set $thumb = $_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=760&h=520&zc=1&q=78&f=jpg']) | ereplace : $zkUrlRe : '/'}
                    {set $big = $_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=1600&h=1100&q=80&f=jpg']) | ereplace : $zkUrlRe : '/'}
                {/if}
                {set $title = ($row.menutitle ?: $row.pagetitle) | escape}
                <button class="project-card" type="button" data-project data-category-id="{$row.parent}" data-image="{$big}" data-title="{$title}" data-category="{$cats[$row.parent] | escape}" data-url="{$row.id | url}" aria-label="{'zk.projects.view' | lexicon}: {$title}">
                    <div class="project-photo">
                        {if $thumb}<img src="{$thumb}" alt="{$title}" loading="lazy" width="760" height="520">{/if}
                        <span class="round"><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></span>
                    </div>
                    <div class="project-info">
                        <div>
                            <h3>{$title}</h3>
                            <p class="project-meta">{$cats[$row.parent]}</p>
                        </div>
                    </div>
                </button>
                {/foreach}
            </div>
        </div>
    </div>
</section>
