<meta charset="[[++modx_charset]]">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href="[[!++site_url]]">
[[Canonical]]
<title>[[*longtitle:default=`[[*pagetitle]]`]]</title>
<meta name="robots" content="[[+seoTab.robotsTag]]">
[[*description:notempty=`<meta name="description" content="[[*description]]">`]]
[[+seoPro.keywords:notempty=`<meta name="keywords" content="[[+seoPro.keywords]]">`]]
<meta name="theme-color" content="#111a20">
<meta property="og:type" content="website">
<meta property="og:title" content="[[*longtitle:default=`[[*pagetitle]]`]]">
[[*description:notempty=`<meta property="og:description" content="[[*description]]">`]]
<meta property="og:image" content="[[!++site_url:replace=`ru/==`]]assets/templates/zk/img/hero.webp">
<meta property="og:url" content="[[~[[*id]]? &scheme=`full`]]">
<meta name="it-rating" content="it-rat-1320b27f41502b183e5f4961dd00e5c0">
<link rel="icon" href="/favicon.ico" sizes="any">
<link rel="icon" href="{$zk.assets}img/favicon.svg" type="image/svg+xml">
[[!BabelLinks? &tpl=`BabelLink-head` &showCurrent=`1`]]
<link rel="preload" href="{$zk.assets}fonts/manrope-600.woff" as="font" type="font/woff" crossorigin>
<link rel="preload" href="{$zk.assets}fonts/manrope-400.woff" as="font" type="font/woff" crossorigin>
{if $isHome}<link rel="preload" as="image" href="{$zk.assets}img/hero.webp">{/if}
<link rel="stylesheet" href="{$zk.assets}css/main.css?v={$zk.v}">
{ignore}<script>window.AjaxForm={config:null,initialize:function(c){this.config=c}};</script>{/ignore}
<script defer src="{$zk.assets}js/main.js?v={$zk.v}"></script>
[[++google-tag-head]]
