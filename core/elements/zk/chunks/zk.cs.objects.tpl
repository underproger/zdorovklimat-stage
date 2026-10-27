{* Реалізовані об’єкти — слайдер карток реальних об’єктів із розділу «Об’єкти» *}
{if $c.objects}
{set $n = $c.objects | length}
<section class="cs-objects section svc-alt" id="objects" data-cs-slider>
    <div class="wrap">
        {set $hs = $c.sections.objects}
        <div class="section-head cs-head cs-slider-head">
            <div>
                <div class="eyebrow">{$hs.eyebrow ?: ('zkc.objects.eyebrow' | lexicon)}</div>
                <h2 class="section-title">{$hs.title ?: ('zkc.objects.title' | lexicon)}</h2>
            </div>
            {if $hs.text}<p class="section-description">{$hs.text}</p>{/if}
            <div class="cs-slider-nav" data-cs-nav>
                <span class="cs-count"><b data-cs-current>01</b> / {$n < 10 ? '0' : ''}{$n}</span>
                <button class="round cs-prev" type="button" data-cs-prev aria-label="{'zk.slider.prev' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <button class="round cs-next" type="button" data-cs-next aria-label="{'zk.slider.next' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            </div>
        </div>
        <div class="cs-track" data-cs-track tabindex="0" aria-label="{'zkc.objects.eyebrow' | lexicon}">
            {foreach $c.objects as $o}
            <a class="cs-obj" href="{$o.url}">
                <span class="cs-obj-photo">{if $o.img}<img src="{$o.img}" alt="{$o.title | escape}" loading="lazy" width="760" height="470">{/if}</span>
                <span class="cs-obj-body">
                    <span class="cs-obj-title">{$o.title}</span>
                    <span class="cs-obj-meta">{if $o.cat}<span><svg class="icon" aria-hidden="true"><use href="#i-buildings"/></svg>{$o.cat}</span>{/if}{if $o.year}<span><svg class="icon" aria-hidden="true"><use href="#i-calendar"/></svg>{$o.year}</span>{/if}</span>
                </span>
                <i class="round" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></i>
            </a>
            {/foreach}
        </div>
        <div class="cs-center"><a class="btn btn-yellow btn-glow" href="{$c.objectsAll}">{'zkc.objects.all' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a></div>
    </div>
</section>
{/if}
