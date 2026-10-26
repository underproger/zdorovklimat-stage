<header class="header{$darkHero ? '' : ' solid'}">
    <div class="header-inner wrap">
        <a class="brand" href="{$zk.home | url}" aria-label="{'zk.brand_aria' | lexicon}">
            <img class="brand-logo" src="{$zk.assets}img/logo.svg?v={$zk.v}" width="140" height="70" alt="{'zk.brand' | lexicon | replace : '<br>' : ' '}">
        </a>
        <nav class="main-nav" aria-label="{'zk.menu_main' | lexicon}">
            {$_modx->runSnippet('pdoMenu', [
                'parents' => 0,
                'level' => 1,
                'resources' => ($ua ? '-1492' : '-1493'),
                'tpl' => 'zk.tpl.nav',
                'tplOuter' => '@INLINE {$wrapper}',
                'hereClass' => 'active',
                'firstClass' => '',
                'lastClass' => '',
                'levelClass' => '',
                'parentClass' => '',
                'rowClass' => '',
                'sortby' => 'menuindex',
            ])}
        </nav>
        <div class="lang-switch" data-lang-drop>
            <button class="lang-current" type="button" aria-haspopup="true" aria-expanded="false" aria-label="{'zk.lang' | lexicon}: {$ua ? 'UA' : 'RU'}">{$ua ? 'UA' : 'RU'}<svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></button>
            <div class="lang-menu">[[!BabelLinks? &tpl=`zk.tpl.lang` &showCurrent=`1` &includeUnlinked=`1` &activeCls=`is-active` &outputSeparator=``]]</div>
        </div>
        <div class="header-phone">
            <a class="header-phone-icon" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}" aria-label="{'zk.call' | lexicon}: {$zk.phone1}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg></a>
            <span class="header-phone-list">
                <a href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}</a>
                {if $zk.phone2}<a href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}">{$zk.phone2}</a>{/if}
            </span>
        </div>
        <button class="btn btn-light header-cta" type="button" data-consult>{'zk.header_cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        <button class="menu-toggle" type="button" aria-label="{'zk.menu_open' | lexicon}" data-label-open="{'zk.menu_open' | lexicon}" data-label-close="{'zk.menu_close' | lexicon}" aria-expanded="false" aria-controls="mobile-menu">
            <svg class="icon" aria-hidden="true"><use href="#i-menu"/></svg>
        </button>
    </div>
    <div class="mega-menu" id="services-menu" hidden>
        {$_modx->runSnippet('pdoResources', [
            'parents' => $zk.services,
            'depth' => 0,
            'limit' => 0,
            'sortby' => '{"menuindex":"ASC","id":"ASC"}',
            'tpl' => 'zk.tpl.mega',
            'showHidden' => 0,
        ])}
        <a class="all-services" href="{$zk.services | url}">{'zk.all_directions' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
    </div>
</header>
<nav class="mobile-menu" id="mobile-menu" aria-label="{'zk.menu_mobile' | lexicon}" hidden>
    {$_modx->runSnippet('pdoMenu', [
        'parents' => 0,
        'level' => 1,
        'tpl' => 'zk.tpl.mobile',
        'tplOuter' => '@INLINE {$wrapper}',
        'hereClass' => 'active',
        'firstClass' => '',
        'lastClass' => '',
        'levelClass' => '',
        'rowClass' => '',
        'sortby' => 'menuindex',
    ])}
    <div class="mobile-lang">[[!BabelLinks? &tpl=`zk.tpl.lang` &showCurrent=`1` &includeUnlinked=`1` &activeCls=`is-active` &outputSeparator=``]]</div>
    <button class="btn btn-yellow" type="button" data-consult>{'zk.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
    <a class="mobile-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}</a>
    {if $zk.phone2}<a class="mobile-phone" href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}">{$zk.phone2}</a>{/if}
</nav>
