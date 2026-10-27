{* Документація й погодження — акордеон *}
{if $c.docs}
{set $hs = $c.sections.docs}
<section class="us-docs section" id="docs">
    <div class="wrap us-docs-layout">
        <div class="us-docs-head">
            <div class="eyebrow">{$hs.eyebrow ?: ('zku.docs.eyebrow' | lexicon)}</div>
            <h2 class="section-title">{$hs.title ?: ('zku.docs.title' | lexicon)}</h2>
            {if $hs.text}<p>{$hs.text}</p>{/if}
        </div>
        <div class="us-docs-list">
            {foreach $c.docs as $i => $doc}
            <details class="faq-item" name="us-docs"{if $i == 0} open{/if}>
                <summary><span><svg class="icon" aria-hidden="true"><use href="#i-article"/></svg>{$doc.title}</span><i class="faq-sign" aria-hidden="true"></i></summary>
                <div class="faq-answer"><p>{$doc.text}</p></div>
            </details>
            {/foreach}
        </div>
    </div>
</section>
{/if}
