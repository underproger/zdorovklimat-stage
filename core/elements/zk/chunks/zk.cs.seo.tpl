{* Повний опис послуги (основний текст і блок про вартість зі старої сторінки) — згорнутим SEO-блоком перед заявкою *}
{if $d.textMain || $d.price.intro || $d.price.rows || $d.price.text || $d.textSeo}
<section class="seo-section cs-seo" id="seo">
    <div class="wrap">
        <div class="seo-block" data-collapsible>
            <div class="seo-text" id="seo-text">
                {$d.textMain}
                {$d.price.intro}
                {if $d.price.rows}
                {if $d.price.title}<h3>{$d.price.title}</h3>{/if}
                <div class="svc-table-wrap"><table class="svc-table"><thead><tr><th>{$d.price.col1 ?: ('zks.price.col1' | lexicon)}</th><th>{$d.price.col2 ?: ('zks.price.col2' | lexicon)}</th></tr></thead><tbody>{foreach $d.price.rows as $r}<tr><td>{$r.name}</td><td>{$r.price}</td></tr>{/foreach}</tbody></table></div>
                {/if}
                {$d.price.text}
                {$d.textSeo}
            </div>
            <button class="text-link seo-toggle" type="button" aria-expanded="false" aria-controls="seo-text" data-more="{'zk.seo.more' | lexicon}" data-less="{'zk.seo.less' | lexicon}" hidden>{'zk.seo.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></button>
        </div>
    </div>
</section>
{/if}
