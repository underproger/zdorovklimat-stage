{* Карта об’єктів (Google My Maps з ClientConfig «google-map_object») + умовні позначення *}
{set $mapHtml = $_modx->getPlaceholder('+google-map_object') ?: $_modx->config['google-map_object']}
{set $mapSrc = ''}
{if $mapHtml | ematch : '#src="(https://www\.google\.com/maps/d/embed[^"]+)"#'}
    {set $mapSrc = $mapHtml | ereplace : '#^.*?src="(https://www\.google\.com/maps/d/embed[^"]+)".*$#s' : '$1'}
{/if}
{if $mapSrc}
<section class="objmap-section" id="map">
    <div class="wrap objmap-layout">
        <div class="objmap-copy">
            <div class="eyebrow">{'zko.map.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zko.map.title' | lexicon}</h2>
            <p>{'zko.map.text' | lexicon}</p>
            <p class="objmap-legend-title">{'zko.map.legend' | lexicon}</p>
            <ul class="objmap-legend">
                {foreach ['shop', 'sklady', 'cold2', 'garage', 'others', 'cold'] as $i => $icon}
                <li><img src="/assets/images/map/_icon_{$icon}.png" alt="" width="28" height="28" loading="lazy">{('zko.map.l' ~ ($i + 1)) | lexicon}</li>
                {/foreach}
            </ul>
            <a class="text-link" href="{$mapSrc | replace : '/maps/d/embed' : '/maps/d/viewer'}" target="_blank" rel="noopener">{'zko.map.open' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
        </div>
        <div class="objmap-frame">
            <iframe src="{$mapSrc}" title="{'zko.map.iframe' | lexicon}" loading="lazy" allowfullscreen></iframe>
        </div>
    </div>
</section>
{/if}
