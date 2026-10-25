{* Хлібні крошки «Головна / $crumb» + розмітка BreadcrumbList. Потрібна змінна $crumb *}
<nav class="breadcrumbs" aria-label="{'zk.breadcrumbs' | lexicon}">
    <a href="{$zk.home | url}">{'zk.nav.home' | lexicon}</a><span aria-hidden="true">/</span><span aria-current="page">{$crumb}</span>
</nav>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "BreadcrumbList",
    "itemListElement": [
        { "@type": "ListItem", "position": 1, "name": {'zk.nav.home' | lexicon | escape : 'js'}, "item": "{$zk.home | url : ['scheme' => 'full']}" },
        { "@type": "ListItem", "position": 2, "name": {$crumb | escape : 'js'}, "item": "{$_modx->resource.id | url : ['scheme' => 'full']}" }
    ]
}
{ignore}</script>{/ignore}
