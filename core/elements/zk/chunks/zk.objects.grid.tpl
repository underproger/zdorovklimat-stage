{* Сітка об’єктів: $objects — готові картки (zk.tpl.object.item), $catList — фільтр (лише на загальній сторінці) *}
<section class="objects-section section" id="portfolio">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{$gridEyebrow}</div>
                <h2 class="section-title">{$gridTitle}</h2>
            </div>
            <p class="section-description">{'zko.list.text' | lexicon}</p>
        </div>
        <div data-projects data-page-size="12" data-forms="{'zk.projects.forms' | lexicon}">
            <div class="filter-row">
                {if $gridFilter}
                <button class="filter active" type="button" data-filter="all" aria-pressed="true">{'zk.projects.all' | lexicon}</button>
                {foreach $catList as $c}
                <button class="filter" type="button" data-filter="{$c.id}" aria-pressed="false">{$c.name}</button>
                {/foreach}
                {/if}
                <span class="project-count" data-count aria-live="polite"></span>
            </div>
            <div class="project-grid object-grid">
                {$objects}
            </div>
            <div class="objects-more">
                <button class="btn btn-outline" type="button" data-more hidden>{'zko.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></button>
            </div>
        </div>
    </div>
</section>
