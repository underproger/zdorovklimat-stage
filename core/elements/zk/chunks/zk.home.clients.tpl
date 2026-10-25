{set $logoRows = $_modx->runSnippet('pdoField', ['id' => 1, 'field' => 'migx_logo'])}
{if !($logoRows is iterable)}{set $logoRows = $logoRows | fromJSON}{/if}
{set $logos = []}
{foreach $logoRows as $logoRow}
    {foreach 1..8 as $n}
        {set $f = $logoRow['lg-' ~ $n] | replace : './' : '' | trim}
        {if $f}{set $logos[] = '/assets/images/design/' ~ $f}{/if}
    {/foreach}
{/foreach}
{if $logos}
<section class="clients-section">
    <div class="wrap">
        <div class="clients-intro">
            <div class="eyebrow">{'zk.clients.eyebrow' | lexicon}</div>
            <p>{'zk.clients.text' | lexicon}</p>
        </div>
    </div>
    <div class="client-marquee">
        <div class="client-track">
            {foreach $logos as $logo}<img src="{$logo}" alt="" width="290" height="120" decoding="async">{/foreach}
            {foreach $logos as $logo}<img src="{$logo}" alt="" loading="lazy" width="290" height="120" aria-hidden="true">{/foreach}
        </div>
    </div>
</section>
{/if}
