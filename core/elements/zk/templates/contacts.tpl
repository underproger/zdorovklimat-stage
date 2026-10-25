{extends 'zk.layout'}
{block 'body_class'} zk-contacts{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:contacts')}
{include 'zk.contacts.hero'}
{include 'zk.contacts.office'}
{set $processNum = ''}
{include 'zk.home.process'}
{/block}
