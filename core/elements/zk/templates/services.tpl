{extends 'zk.layout'}
{block 'body_class'} zk-services{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:services')}
{* напрями з картинками і переліком послуг — сніпет zkServiceData (&tree=1) *}
{set $d = $_modx->runSnippet('zkServiceData', ['id' => $_modx->resource.id, 'root' => 0, 'tree' => 1]) | fromJSON}
{set $crumb = 'zks.crumb' | lexicon}
{include 'zk.services.hero'}
{include 'zk.services.list'}
{set $processNum = '03'}
{include 'zk.home.process'}
{include 'zk.home.clients'}
{include 'zk.home.contact'}
{/block}
