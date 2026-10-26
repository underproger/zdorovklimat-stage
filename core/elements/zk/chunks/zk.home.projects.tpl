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
{* «Наші об’єкти» на головній (макет 10.2026): заголовок і опис через вертикальну лінію, білі картки з фото, кнопка «Дивитися всі роботи» *}
<section class="projects-section section" id="projects">
    <div class="wrap">
        <div class="hp-head">
            <div>
                <div class="eyebrow">{'zk.projects.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.projects.title' | lexicon}</h2>
            </div>
            <p class="hp-text">{'zk.projects.text' | lexicon}</p>
        </div>
        <div class="hp-grid">
            {foreach $rows as $row}
            {set $src = $row['tv.object-img'] | replace : 'ru/' : ''}
            {if !$src}
                {set $thumb = ''}{set $big = ''}
            {elseif $src | ematch : '/[^\x20-\x7E]/'}
                {* pThumb ламає кириличні імена файлів — віддаємо оригінал *}
                {set $thumb = '/' ~ ($src | ereplace : '~^/+~' : '')}{set $big = $thumb}
            {else}
                {set $thumb = $_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=800&h=460&zc=1&q=80&f=jpg']) | ereplace : $zkUrlRe : '/'}
                {set $big = $_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=1600&h=1100&q=80&f=jpg']) | ereplace : $zkUrlRe : '/'}
            {/if}
            {set $title = ($row.menutitle ?: $row.pagetitle) | escape}
            <button class="hp-card" type="button" data-project data-image="{$big}" data-title="{$title}" data-category="{$cats[$row.parent] | escape}" data-url="{$row.id | url}" aria-label="{'zk.projects.view' | lexicon}: {$title}">
                <span class="hp-photo">{if $thumb}<img src="{$thumb}" alt="{$title}" loading="lazy" width="800" height="460">{/if}</span>
                <span class="hp-body">
                    <span class="hp-info">
                        <span class="hp-title">{$title}</span>
                        <span class="hp-cat">{$cats[$row.parent]}</span>
                    </span>
                    <span class="hp-arrow" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></span>
                </span>
            </button>
            {/foreach}
        </div>
        <div class="hp-more">
            <a class="btn btn-yellow" href="{$zk.objects | url}">{'zk.projects.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
    </div>
</section>
