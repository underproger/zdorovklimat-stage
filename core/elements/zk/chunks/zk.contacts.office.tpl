{* Карта офісу: src береться з ClientConfig «google-map» (iframe), інакше — запасний *}
{set $mapHtml = $_modx->getPlaceholder('+google-map') ?: $_modx->config['google-map']}
{set $mapSrc = ''}
{if $mapHtml | ematch : '~src="(https://www\.google\.com/maps/embed[^"]+)"~'}
    {set $mapSrc = $mapHtml | ereplace : '~^.*?src="(https://www\.google\.com/maps/embed[^"]+)".*$~s' : '$1'}
{/if}
{if !$mapSrc}{set $mapSrc = 'https://www.google.com/maps?q=' ~ ('zkc.office.dest' | lexicon | escape : 'url') ~ '&output=embed'}{/if}
{set $routeUrl = 'https://www.google.com/maps/dir/?api=1&destination=' ~ ('zkc.office.dest' | lexicon | escape : 'url')}
<section class="office-section" id="office">
    <div class="office-map">
        <iframe src="{$mapSrc}" title="{'zkc.office.map' | lexicon}" loading="lazy" referrerpolicy="no-referrer-when-downgrade" allowfullscreen></iframe>
    </div>
    <div class="wrap office-layout">
        <div class="office-card">
            <div class="eyebrow">{'zkc.office.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zkc.office.title' | lexicon}</h2>
            <address>{'zk.footer.address' | lexicon}</address>
            <p class="office-hours"><svg class="icon" aria-hidden="true"><use href="#i-clock"/></svg>{'zkc.hours_value' | lexicon}</p>
            <p class="office-text">{'zkc.office.text' | lexicon}</p>
            <div class="office-actions">
                <a class="btn btn-yellow" href="{$routeUrl}" target="_blank" rel="noopener">{'zkc.route' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                <a class="text-link" href="{$zk.maps}" target="_blank" rel="noopener">{'zkc.office.open' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
            </div>
        </div>
    </div>
</section>
