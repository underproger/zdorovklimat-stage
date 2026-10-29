{extends 'zk.layout'}
{block 'body_class'} zk-reviews{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:reviews')}
{* відгуки easyComm UA + RU сторінок разом; сторінка некешована (cacheable = 0), щоб опублікований відгук з’являвся одразу *}
{* + відгуки зі сторінок послуг поточної мови (поле «Отзывы»), без повторів, з джерелом *}
{set $rv = $_modx->runSnippet('zkReviews', ['threads' => 'resource-1492,resource-1493', 'pages' => 1]) | fromJSON}
{include 'zk.reviews.hero'}
{include 'zk.reviews.list'}
{include 'zk.reviews.form'}
{include 'zk.home.clients'}
{include 'zk.home.contact'}
{/block}
