{set $logoRows = $_modx->runSnippet('pdoField', ['id' => 1, 'field' => 'migx_logo'])}
{if !($logoRows is iterable)}{set $logoRows = $logoRows | fromJSON}{/if}
{set $logos = []}
{foreach $logoRows as $logoRow}
    {foreach 1..8 as $n}
        {set $f = $logoRow['lg-' ~ $n] | replace : './' : '' | trim}
        {if $f}{set $logos[] = '/assets/images/design/' ~ $f}{/if}
    {/foreach}
{/foreach}
{set $seo = $_modx->resource.content | trim}
{if $logos || $seo}
<section class="partners-section" id="partners">
    <div class="wrap">
        {if $logos}
        <div class="partners-head">
            <div>
                <div class="eyebrow"><span class="num">07</span><span class="sep">/</span>{'zk.clients.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.clients.title' | lexicon}</h2>
                <p class="partners-text">{'zk.clients.text' | lexicon}</p>
            </div>
            <a class="text-link partners-link" href="{$zk.reviews | url}">{'zk.clients.link' | lexicon}</a>
        </div>
        <div class="partners-row{if ($logos | length) > 6} is-moving{/if}">
            <div class="partners-viewport"><div class="partners-track">
                {foreach $logos as $logo}<div class="partner"><img src="{$logo}" alt="" width="290" height="120" decoding="async"></div>{/foreach}
                {if ($logos | length) > 6}{foreach $logos as $logo}<div class="partner" aria-hidden="true"><img src="{$logo}" alt="" width="290" height="120" decoding="async"></div>{/foreach}{/if}
            </div></div>
        </div>
        {/if}
        {include 'zk.home.seo'}
    </div>
</section>
{/if}
