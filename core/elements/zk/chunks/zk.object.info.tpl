{if $task || $text}
<section class="object-info section">
    <div class="wrap object-info-layout">
        <div class="object-text">
            {if $task}
            <h2 class="object-subtitle">{'zko.obj.task' | lexicon}</h2>
            <div class="article-content">{$task}</div>
            {/if}
            {if $text}
            <h2 class="object-subtitle">{'zko.obj.about' | lexicon}</h2>
            <div class="article-content">{$text}</div>
            {/if}
            <a class="text-link back-link" href="{$catId | url}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg>{'zko.obj.more.all' | lexicon}</a>
        </div>
        <aside class="cta-card object-cta">
            <i class="cta-plus" aria-hidden="true"></i>
            <div class="cta-copy">
                <p class="cta-title">{'zko.obj.cta.title' | lexicon}</p>
                <p class="cta-text">{'zko.obj.cta.text' | lexicon}</p>
            </div>
            <div class="cta-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zk.projects.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="cta-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
            </div>
        </aside>
    </div>
</section>
{else}
<section class="object-info object-info-compact">
    <div class="wrap">
        <aside class="cta-card object-cta cta-wide">
            <i class="cta-plus" aria-hidden="true"></i>
            <div class="cta-copy">
                <p class="cta-title">{'zko.obj.cta.title' | lexicon}</p>
                <p class="cta-text">{'zko.obj.cta.text' | lexicon}</p>
            </div>
            <div class="cta-actions">
                <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zk.projects.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="cta-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
            </div>
        </aside>
    </div>
</section>
{/if}
