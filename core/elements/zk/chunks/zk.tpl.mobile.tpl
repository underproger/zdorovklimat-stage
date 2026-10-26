{* пункт мобільного меню (pdoMenu, рівень 1): іконка + назва + стрілка; «Послуги» розкриваються в напрямки, напрямки — у послуги *}
{set $ico = 'i-next'}
{if $id in [1, 1288]}{set $ico = 'i-home'}
{elseif $id in [25, 1289]}{set $ico = 'i-tool'}
{elseif $id in [3, 1294]}{set $ico = 'i-users'}
{elseif $id in [66, 1549]}{set $ico = 'i-article'}
{elseif $id in [26, 1295]}{set $ico = 'i-buildings'}
{elseif $id in [1565, 1566]}{set $ico = 'i-video'}
{elseif $id in [2, 1296]}{set $ico = 'i-pin'}
{elseif $id in [1492, 1493]}{set $ico = 'i-chat'}
{/if}
{set $here = $_modx->resource.id}
{set $act = $classnames | match : '*active*'}
{if $id in [25, 1289]}
{set $menu = $_modx->runSnippet('zkMenu', ['root' => $id]) | fromJSON}
{set $hereUp = $_modx->getParentIds($here)}
<li class="mm-item">
    <button class="mm-link{$act ? ' active' : ''}" type="button" data-mm-toggle aria-expanded="{$act ? 'true' : 'false'}" aria-controls="mm-sub-{$id}"><svg class="icon mm-ico" aria-hidden="true"><use href="#{$ico}"/></svg><span>{$menutitle}</span><svg class="icon mm-arr" aria-hidden="true"><use href="#i-chevron"/></svg></button>
    <ul class="mm-sub" id="mm-sub-{$id}"{$act ? '' : ' hidden'}>
        {foreach $menu as $d}
        {set $open = $d.id in $hereUp}{if $d.id == $here}{set $open = true}{/if}
        <li class="mm-dir">
            <div class="mm-dir-row">
                <a class="mm-dir-link{$d.id == $here ? ' active' : ''}" href="{$d.id | url}"{$d.id == $here ? ' aria-current="page"' : ''}><span class="mm-dir-ico">{$d.icon ?: '<svg class="icon" aria-hidden="true"><use href="#i-grid"/></svg>'}</span><span>{$d.title}</span></a>
                {if $d.kids}<button class="mm-dir-toggle" type="button" data-mm-toggle aria-expanded="{$open ? 'true' : 'false'}" aria-controls="mm-dir-{$d.id}" aria-label="{'zk.menu_expand' | lexicon}: {$d.title | escape}"><svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></button>{/if}
            </div>
            {if $d.kids}
            <ul class="mm-kids" id="mm-dir-{$d.id}"{$open ? '' : ' hidden'}>
                {foreach $d.kids as $k}<li><a href="{$k.id | url}"{$k.id == $here ? ' class="active" aria-current="page"' : ''}>{$k.title}</a></li>{/foreach}
            </ul>
            {/if}
        </li>
        {/foreach}
        <li class="mm-all"><a href="{$link}">{'zk.all_services' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a></li>
    </ul>
</li>
{else}
<li class="mm-item"><a class="mm-link{$act ? ' active' : ''}" href="{$link}"{$id == $here ? ' aria-current="page"' : ''}><svg class="icon mm-ico" aria-hidden="true"><use href="#{$ico}"/></svg><span>{$menutitle}</span><svg class="icon mm-arr" aria-hidden="true"><use href="#i-next"/></svg></a></li>
{/if}
