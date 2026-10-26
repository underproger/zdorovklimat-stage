<header class="header{$darkHero ? '' : ' solid'}">
    <div class="header-inner wrap">
        <a class="brand" href="{$zk.home | url}" aria-label="{'zk.brand_aria' | lexicon}">
            <img class="brand-logo" src="{$zk.assets}img/logo.svg?v={$zk.v}" width="144" height="56" alt="{'zk.brand' | lexicon | replace : '<br>' : ' '}">
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
        <div class="header-phone" data-phone-drop>
            <a class="header-phone-icon" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}" aria-label="{'zk.call' | lexicon}: {$zk.phone1}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg></a>
            {* на телефоні: іконка відкриває список із двох номерів *}
            <button class="header-phone-btn" type="button" aria-expanded="false" aria-controls="header-phones" aria-label="{'zk.phones' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg></button>
            <span class="header-phone-list" id="header-phones">
                <a href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone1}</a>
                {if $zk.phone2}<a href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}"><svg class="icon" aria-hidden="true"><use href="#i-phone"/></svg>{$zk.phone2}</a>{/if}
            </span>
        </div>
        <button class="btn btn-light header-cta" type="button" data-consult>{'zk.header_cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        <button class="menu-toggle" type="button" aria-label="{'zk.menu_open' | lexicon}" aria-expanded="false" aria-controls="mobile-menu">
            <svg class="icon" aria-hidden="true"><use href="#i-menu"/></svg>
        </button>
    </div>
    {* дворівневе меню «Послуги»: напрямки зліва, послуги вибраного напрямку справа *}
    {set $svcMenu = $_modx->runSnippet('zkMenu', ['root' => $zk.services]) | fromJSON}
    {set $megaActive = 0}
    {foreach $svcMenu as $d}{if $d.id in $zkParents}{set $megaActive = $d.id}{/if}{if $d.id == $_modx->resource.id}{set $megaActive = $d.id}{/if}{/foreach}
    {if !$megaActive && $svcMenu}{set $megaActive = $svcMenu.0.id}{/if}
    <div class="mega-menu" id="services-menu" hidden>
        <div class="mega-inner wrap">
            <div class="mega-dirs">
                <div class="mega-label">{'zk.menu_directions' | lexicon}</div>
                {foreach $svcMenu as $d}
                <a class="mega-dir{$d.id == $megaActive ? ' is-active' : ''}" href="{$d.id | url}" data-mega-dir="{$d.id}">
                    <span class="mega-ico">{$d.icon ?: '<svg class="icon" aria-hidden="true"><use href="#i-grid"/></svg>'}</span>
                    <span class="mega-dir-title">{$d.title}</span>
                    {if $d.kids}<small>{$d.kids | length}</small>{/if}
                    <svg class="icon mega-dir-arr" aria-hidden="true"><use href="#i-next"/></svg>
                </a>
                {/foreach}
                <a class="all-services" href="{$zk.services | url}">{'zk.all_directions' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
            </div>
            <div class="mega-panes">
                {foreach $svcMenu as $d}
                <div class="mega-pane" data-mega-pane="{$d.id}"{$d.id == $megaActive ? '' : ' hidden'}>
                    <div class="mega-pane-head">
                        <a class="mega-pane-title" href="{$d.id | url}">{$d.title}</a>
                        <a class="text-link text-link-light" href="{$d.id | url}">{'zk.menu_go' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                    </div>
                    {if $d.kids}
                    <ul class="mega-list">
                        {foreach $d.kids as $k}
                        <li><a href="{$k.id | url}"{$k.id == $_modx->resource.id ? ' aria-current="page"' : ''}><span>{$k.title}</span><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a></li>
                        {/foreach}
                    </ul>
                    {else}
                    <p class="mega-empty">{'zk.menu_single' | lexicon}</p>
                    {/if}
                </div>
                {/foreach}
            </div>
        </div>
    </div>
</header>
{* мобільне меню: біла панель — логотип і «закрити», пункти з іконками, «Послуги» → напрямки → послуги, внизу телефони і мови *}
<div class="mobile-menu" id="mobile-menu" hidden>
    <div class="mm-panel" role="dialog" aria-modal="true" aria-label="{'zk.menu_mobile' | lexicon}">
        <div class="mm-top">
            <a class="mm-brand" href="{$zk.home | url}" aria-label="{'zk.brand_aria' | lexicon}"><img src="{$zk.assets}img/logo-dark.svg?v={$zk.v}" width="129" height="50" alt="{'zk.brand' | lexicon | replace : '<br>' : ' '}"></a>
            <button class="mm-close" type="button" data-menu-close aria-label="{'zk.menu_close' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-close"/></svg></button>
        </div>
        <nav class="mm-body" aria-label="{'zk.menu_main' | lexicon}">
            <ul class="mm-list">
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
            </ul>
            <button class="btn btn-yellow mm-cta" type="button" data-consult>{'zk.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </nav>
        <div class="mm-bottom">
            <span class="mm-phone-ico" aria-hidden="true"><svg class="icon"><use href="#i-phone"/></svg></span>
            <span class="mm-phones">
                <a href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}</a>
                {if $zk.phone2}<a href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}">{$zk.phone2}</a>{/if}
            </span>
            <div class="mm-lang" aria-label="{'zk.lang' | lexicon}">[[!BabelLinks? &tpl=`zk.tpl.lang` &showCurrent=`1` &includeUnlinked=`1` &activeCls=`is-active` &outputSeparator=`<span class="mm-lang-sep">/</span>`]]</div>
        </div>
    </div>
</div>
