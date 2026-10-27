{* Відгуки клієнтів — слайдер (відгуки послуги, напряму й сусідніх будівельних послуг) *}
{if $c.reviews}
{set $n = $c.reviews | length}
<section class="cs-reviews section" id="reviews" data-cs-slider>
    <div class="wrap">
        {set $hs = $c.sections.reviews}
        <div class="section-head cs-head cs-slider-head">
            <div>
                <div class="eyebrow">{$hs.eyebrow ?: ('zkc.reviews.eyebrow' | lexicon)}</div>
                <h2 class="section-title">{$hs.title ?: ('zkc.reviews.title' | lexicon)}</h2>
            </div>
            <p class="section-description">{$hs.text ?: ('zkc.reviews.text' | lexicon)}</p>
            <div class="cs-slider-nav" data-cs-nav>
                <span class="cs-count"><b data-cs-current>01</b> / {$n < 10 ? '0' : ''}{$n}</span>
                <button class="round cs-prev" type="button" data-cs-prev aria-label="{'zk.slider.prev' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <button class="round cs-next" type="button" data-cs-next aria-label="{'zk.slider.next' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            </div>
        </div>
        <div class="cs-track cs-rev-track" data-cs-track tabindex="0" aria-label="{'zkc.reviews.eyebrow' | lexicon}">
            {foreach $c.reviews as $r}
            <figure class="cs-rev">
                <span class="cs-rev-quote" aria-hidden="true">“</span>
                <blockquote>{$r.text}</blockquote>
                {if $r.name}<figcaption><span class="cs-rev-ava" aria-hidden="true">{$r.initial}</span><span>{$r.name}</span></figcaption>{/if}
            </figure>
            {/foreach}
        </div>
        <div class="cs-rev-foot">
            <span class="cs-progress" aria-hidden="true"><i data-cs-progress></i></span>
            <a class="text-link" href="{$zk.reviews | url}">{'zkc.reviews.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
        </div>
    </div>
</section>
{/if}
