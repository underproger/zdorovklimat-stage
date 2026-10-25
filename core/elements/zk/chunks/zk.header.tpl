<header class="header">
    <div class="header-inner wrap">
        <a class="brand" href="{$zk.home | url}" aria-label="{'zk.brand_aria' | lexicon}">
            <img src="{$zk.assets}img/mark.svg" width="48" height="48" alt="">
            <span>{'zk.brand' | lexicon}</span>
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
        <div class="lang-switch" role="group" aria-label="{'zk.lang' | lexicon}">[[!BabelLinks? &tpl=`zk.tpl.lang` &showCurrent=`1` &includeUnlinked=`1` &activeCls=`is-active` &outputSeparator=``]]</div>
        <a class="header-phone" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}" aria-label="{'zk.call' | lexicon}: {$zk.phone1}">
            <svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}
        </a>
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
</nav>
