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
<section class="partners-section" id="partners">
    <div class="wrap">
        <div class="partners-head">
            <div>
                <div class="eyebrow">{'zk.clients.eyebrow' | lexicon}</div>
                <h2 class="section-title">{'zk.clients.title' | lexicon}</h2>
                <p class="partners-text">{'zk.clients.text' | lexicon}</p>
            </div>
            <a class="text-link partners-link" href="{$zk.reviews | url}">{'zk.clients.link' | lexicon}</a>
        </div>
        <div class="partners-slider" data-slider>
            <div class="partners-viewport" data-slider-viewport tabindex="0" aria-label="{'zk.clients.eyebrow' | lexicon}">
                <div class="partners-grid">
                    {foreach $logos as $logo}<div class="partner"><img src="{$logo}" alt="" width="290" height="120" loading="lazy" decoding="async"></div>{/foreach}
                </div>
            </div>
            <div class="slider-controls" data-slider-controls hidden>
                <div class="slider-dots" data-slider-dots></div>
                <div class="slider-arrows">
                    <button class="round slider-prev" type="button" data-slider-prev aria-label="{'zk.slider.prev' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                    <button class="round slider-next" type="button" data-slider-next aria-label="{'zk.slider.next' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                </div>
            </div>
        </div>
    </div>
</section>
{/if}
