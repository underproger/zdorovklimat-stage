{* Ліцензії: MIGX-TV migx_sertificat, файли з джерела «All» (assets/images/all/) *}
{set $zkUrlRe = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~'}
{set $licRows = $_modx->runSnippet('pdoField', ['id' => $_modx->resource.id, 'field' => 'migx_sertificat'])}
{if !($licRows is iterable)}{set $licRows = $licRows | fromJSON}{/if}
{set $lics = []}
{foreach $licRows as $row}
    {set $f = $row.img | replace : './' : '' | trim}
    {if $f}
        {set $src = 'assets/images/all/' ~ ($f | ereplace : '~^/+~' : '')}
        {set $lics[] = [
            'thumb' => '/' ~ ($_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=520&h=720&zc=T&q=82&f=jpg']) | ereplace : $zkUrlRe : ''),
            'full' => '/' ~ $src,
        ]}
    {/if}
{/foreach}
{if $lics}
<section class="lic-section section" id="licenses">
    <div class="wrap lic-layout">
        <div class="lic-copy">
            <div class="eyebrow"><span class="num">05</span><span class="sep">/</span>{'zka.lic.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zka.lic.title' | lexicon}</h2>
            <p>{'zka.lic.text' | lexicon}</p>
        </div>
        <div class="lic-docs" data-gallery>
            {foreach $lics as $i => $lic}
            {set $label = ('zka.lic.item' | lexicon) ~ ' ' ~ ($i + 1)}
            <button class="lic-doc" type="button" data-full="{$lic.full}" data-title="{$label}" aria-label="{'zka.lic.open' | lexicon}: {$label}">
                <span class="lic-paper"><img src="{$lic.thumb}" alt="{$label}" loading="lazy" width="520" height="720"></span>
                <span class="lic-meta"><span>{($i < 9 ? '0' : '') ~ ($i + 1)}</span><i class="round"><svg class="icon" aria-hidden="true"><use href="#i-zoom"/></svg></i></span>
            </button>
            {/foreach}
        </div>
    </div>
</section>
{/if}
