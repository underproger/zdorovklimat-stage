<section class="article-hero">
    <div class="wrap">
        {include 'zk.crumbs'}
        <div class="article-head">
            <div class="eyebrow">{'zk.blog.cat' | lexicon}</div>
            <h1>{$title}</h1>
            {if $lead}<p class="article-lead">{$lead}</p>{/if}
            <ul class="article-meta">
                <li><svg class="icon" aria-hidden="true"><use href="#i-calendar"/></svg><time datetime="{$res.publishedon | date : 'Y-m-d'}">{$date}</time></li>
                <li><svg class="icon" aria-hidden="true"><use href="#i-clock"/></svg>{$minutes} {'zkb.min' | lexicon}</li>
                <li><svg class="icon" aria-hidden="true"><use href="#i-eye"/></svg>{ignore}[[!HitsPage? &saveTv=`true`]]{/ignore} {'zkb.views' | lexicon}</li>
            </ul>
        </div>
    </div>
</section>
{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "BlogPosting",
    "headline": {$title | escape : 'js'},
    "description": {($lead ?: $res.description) | escape : 'js'},
    {if $ogImage}"image": "[[!++site_url:replace=`ru/==`]]{$ogImage}",
    {/if}"datePublished": "{$res.publishedon | date : 'c'}",
    "dateModified": "{($res.editedon ?: $res.publishedon) | date : 'c'}",
    "inLanguage": "{$ua ? 'uk' : 'ru'}",
    "mainEntityOfPage": "{$res.id | url : ['scheme' => 'full']}",
    "author": { "@type": "Organization", "name": "{$ua ? 'Здоровий Клімат' : 'Здоровый Климат'}", "url": "{$zk.home | url : ['scheme' => 'full']}" },
    "publisher": {
        "@type": "Organization",
        "name": "{$ua ? 'Здоровий Клімат' : 'Здоровый Климат'}",
        "logo": { "@type": "ImageObject", "url": "[[!++site_url:replace=`ru/==`]]assets/templates/zk/img/mark.svg" }
    }
}
{ignore}</script>{/ignore}
