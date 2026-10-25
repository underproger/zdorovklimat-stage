{extends 'zk.layout'}
{block 'body_class'} zk-about{/block}
{block 'head'}<link rel="preload" as="image" href="{$zk.assets}img/steel.webp">{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:about')}
{include 'zk.about.hero'}
{include 'zk.home.metrics'}
{include 'zk.about.intro'}
{include 'zk.about.pillars'}
{include 'zk.about.docs'}
{include 'zk.home.process'}
{include 'zk.about.licenses'}
{include 'zk.home.clients'}
{include 'zk.home.contact'}
{/block}
