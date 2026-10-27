{extends 'zk.layout'}
{block 'body_class'} zk-service zk-construction{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:services')}
{$_modx->lexicon->load('zdorovklimat:construction')}
{* Будівельна послуга / напрям (макет 10.2026 «Будівництво складів»). Дані: zkServiceData (старий вміст сторінки) + zkConstruction (нові блоки, поля cs-*) *}
{set $isDir = $_modx->resource.isfolder}
{set $d = $_modx->runSnippet('zkServiceData', ['id' => $_modx->resource.id, 'root' => $zk.services, 'mode' => ($isDir ? 'direction' : '')]) | fromJSON}
{set $c = $_modx->runSnippet('zkConstruction', ['id' => $_modx->resource.id, 'objects' => $d.objects]) | fromJSON}
{set $svcMode = $isDir ? 'direction' : 'service'}
{set $crumb = $d.label}
{set $crumbTrail = [[('zks.crumb' | lexicon), ($zk.services | url), ($zk.services | url : ['scheme' => 'full'])]]}
{foreach $d.trail as $t}{set $crumbTrail[] = [$t.title, ($t.id | url), ($t.id | url : ['scheme' => 'full'])]}{/foreach}
{include 'zk.svc.hero'}
{if $isDir}{include 'zk.svc.children'}{/if}
{include 'zk.cs.approach'}
{include 'zk.cs.types'}
{include 'zk.cs.objects'}
{include 'zk.cs.build'}
{include 'zk.cs.tech'}
{include 'zk.cs.factors'}
{include 'zk.cs.cta'}
{include 'zk.cs.reviews'}
{include 'zk.home.clients'}
{include 'zk.home.map'}
{include 'zk.cs.seo'}
{include 'zk.svc.faq'}
{include 'zk.home.contact'}
{/block}
