{* логотипи брендів (TV migx_logo_new, заголовок — title_logo, текст — text_logo) *}
{if $d.brands.items}
<section class="svc-brands section">
    <div class="wrap">
        <div class="section-head">
            <div>
                <div class="eyebrow">{'zks.brands.eyebrow' | lexicon}</div>
                <h2 class="section-title">{$d.brands.title ?: ('zks.brands.title' | lexicon)}</h2>
            </div>
            {if $d.brands.text}<p class="section-description">{$d.brands.text}</p>{/if}
        </div>
        <ul class="svc-brands-grid">
            {foreach $d.brands.items as $b}<li class="svc-brand"><img src="{$b}" alt="" loading="lazy" decoding="async" width="240" height="120"></li>{/foreach}
        </ul>
    </div>
</section>
{/if}
