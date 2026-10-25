{* Хлібні крошки «Головна / [$crumbMid] / $crumb» + BreadcrumbList. $crumb — назва сторінки, $crumbMid — [назва, url] або false *}
<nav class="breadcrumbs" aria-label="{'zk.breadcrumbs' | lexicon}">
    <a href="{$zk.home | url}">{'zk.nav.home' | lexicon}</a><span aria-hidden="true">/</span>{if $crumbMid}<a href="{$crumbMid[1]}">{$crumbMid[0]}</a><span aria-hidden="true">/</span>{/if}<span aria-current="page">{$crumb}</span>
</nav>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": {'zk.nav.home' | lexicon | escape : 'js'}, "item": "{$zk.home | url : ['scheme' => 'full']}" },
        {if $crumbMid}{ "@type": "ListItem", "position": 2, "name": {$crumbMid[0] | escape : 'js'}, "item": "{$crumbMid[2]}" },
        {/if}{ "@type": "ListItem", "position": {$crumbMid ? 3 : 2}, "name": {$crumb | escape : 'js'}, "item": "{$_modx->resource.id | url : ['scheme' => 'full']}" }
    ]
}
{ignore}</script>{/ignore}
