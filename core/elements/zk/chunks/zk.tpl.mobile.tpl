{if $id in [25, 1289]}<details>
    <summary class="mobile-link">{$menutitle}<span aria-hidden="true">+</span></summary>
    {$_modx->runSnippet('pdoResources', [
        'parents' => $id,
        'depth' => 0,
        'limit' => 0,
        'sortby' => '{"menuindex":"ASC","id":"ASC"}',
        'tpl' => '@INLINE <a href="{$id | url}">{$menutitle ?: $pagetitle}</a>',
        'showHidden' => 0,
    ])}
    <a class="text-link" href="{$link}">{'zk.all_services' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
</details>{else}<a class="mobile-link{if $classnames | match : '*active*'} active{/if}" href="{$link}">{$menutitle}<small>{($idx < 10 ? '0' : '') ~ $idx}</small></a>{/if}
