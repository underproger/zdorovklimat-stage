{* відгуки — $rv (дані zkReviews) *}
{set $months = 'zk.months' | lexicon | split : '||'}
<section class="reviews-list section" id="reviews">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zkr.list.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zkr.list.title' | lexicon}</h2>
            </div>
            {* при фільтрі за напрямами кількість показує лічильник фільтра *}
            {if $rv.count && !$rv.cats}
            <div class="reviews-score">
                {if $rv.avg}
                <b>{$rv.avg | number_format : 1 : ',' : ''}</b>
                <div>
                    <span class="stars" style="--rating:{$rv.avg}" role="img" aria-label="{'zkr.list.stars' | lexicon | replace : '%n%' : $rv.avg}"></span>
                    <small>{'zkr.list.avg' | lexicon} · {$rv.countLabel}</small>
                </div>
                {else}
                <small>{$rv.countLabel}</small>
                {/if}
            </div>
            {/if}
        </div>
        {if $rv.items}
        <div class="reviews-wall" data-projects data-page-size="9" data-forms="{'zkr.list.forms' | lexicon}">
            {if ($rv.cats | length) > 1}
            <div class="filter-row reviews-filter">
                <button class="filter active" type="button" data-filter="all" aria-pressed="true">{'zkr.list.all' | lexicon}</button>
                {foreach $rv.cats as $c}
                <button class="filter" type="button" data-filter="{$c.id}" aria-pressed="false">{$c.name}</button>
                {/foreach}
                <span class="project-count" data-count aria-live="polite"></span>
            </div>
            {/if}
            <div class="reviews-grid">
            {foreach $rv.items as $r}
            <figure class="review-card" data-category-id="{$r.cat ?: 'site'}" tabindex="-1">
                <div class="review-top">
                    <span class="svc-quote" aria-hidden="true">“</span>
                    {if $r.rating}<span class="stars" style="--rating:{$r.rating}" role="img" aria-label="{'zkr.list.stars' | lexicon | replace : '%n%' : $r.rating}"></span>{/if}
                </div>
                <blockquote class="review-text{$r.long ? ' is-long' : ''}"><p>{$r.text}</p></blockquote>
                {if $r.long}<button class="review-more" type="button" aria-expanded="false">{'zkr.list.read' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></button>{/if}
                {if $r.reply}
                <div class="review-reply">
                    <b>{$r.replyAuthor ?: ('zkr.list.reply' | lexicon)}</b>
                    <p>{$r.reply}</p>
                </div>
                {/if}
                <figcaption>
                    <i class="review-avatar" aria-hidden="true">{$r.name | truncate : 1 : '' | upper}</i>
                    <span><b>{$r.name}</b>{if $r.company}<small>{$r.company}</small>{/if}</span>
                    {if $r.date}<time datetime="{$r.date}">{$r.date | date : 'j'} {$months[($r.date | date : 'n') - 1]} {$r.date | date : 'Y'}</time>{/if}
                </figcaption>
                {* звідки відгук: форма на сайті чи сторінка послуги *}
                <p class="review-source"><svg class="icon" aria-hidden="true"><use href="#{$r.source == 'page' ? 'i-article' : 'i-chat'}"/></svg>{if $r.source == 'page'}{'zkr.list.src_page' | lexicon} <a href="{$r.sourceUrl}">{$r.sourceTitle}</a>{else}{'zkr.list.src_site' | lexicon}{/if}</p>
            </figure>
            {/foreach}
            </div>
            <div class="reviews-more-wrap"><button class="btn btn-outline" type="button" data-more hidden>{'zkr.list.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></button></div>
        </div>
        {else}
        <div class="reviews-empty">
            <span class="svc-quote" aria-hidden="true">“</span>
            <div>
                <h3>{'zkr.list.empty_title' | lexicon}</h3>
                <p>{'zkr.list.empty_text' | lexicon}</p>
            </div>
            <a class="btn btn-yellow" href="{$zk.self}#review-form">{'zkr.hero.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
        </div>
        {/if}
    </div>
</section>
