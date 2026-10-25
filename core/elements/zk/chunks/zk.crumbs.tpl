{* Хлібні крошки «Головна / [...$crumbTrail] / $crumb» + BreadcrumbList.
   $crumb — назва сторінки, $crumbTrail — список проміжних рівнів [[назва, url, повний url], ...] *}
<nav class="breadcrumbs" aria-label="{'zk.breadcrumbs' | lexicon}">
    <a href="{$zk.home | url}">{'zk.nav.home' | lexicon}</a><span aria-hidden="true">/</span>{foreach $crumbTrail as $c}<a href="{$c[1]}">{$c[0]}</a><span aria-hidden="true">/</span>{/foreach}<span aria-current="page">{$crumb}</span>
</nav>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": {'zk.nav.home' | lexicon | escape : 'js'}, "item": "{$zk.home | url : ['scheme' => 'full']}" },
        {foreach $crumbTrail as $i => $c}{ "@type": "ListItem", "position": {$i + 2}, "name": {$c[0] | escape : 'js'}, "item": "{$c[2]}" },
        {/foreach}{ "@type": "ListItem", "position": {($crumbTrail | length) + 2}, "name": {$crumb | escape : 'js'}, "item": "{$_modx->resource.id | url : ['scheme' => 'full']}" }
    ]
}
{ignore}</script>{/ignore}
