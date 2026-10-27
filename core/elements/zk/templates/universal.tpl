{extends 'zk.layout'}
{block 'body_class'} zk-service zk-universal{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:services')}
{$_modx->lexicon->load('zdorovklimat:construction')}
{$_modx->lexicon->load('zdorovklimat:universal')}
{* Універсальна сторінка послуги / напряму (майстер-шаблон 10.2026). Блоки виводяться лише за наявності вмісту.
   Дані: zkServiceData (вміст старої сторінки) + zkConstruction (поля cs-*; порожнє в послузі береться з напряму) *}
{set $isDir = $_modx->resource.isfolder}
{set $d = $_modx->runSnippet('zkServiceData', ['id' => $_modx->resource.id, 'root' => $zk.services, 'mode' => ($isDir ? 'direction' : '')]) | fromJSON}
{set $c = $_modx->runSnippet('zkConstruction', ['id' => $_modx->resource.id, 'objects' => $d.objects]) | fromJSON}
{set $svcMode = $isDir ? 'direction' : 'service'}
{set $heroUniversal = true}
{set $crumb = $d.label}
{set $crumbTrail = [[('zks.crumb' | lexicon), ($zk.services | url), ($zk.services | url : ['scheme' => 'full'])]]}
{foreach $d.trail as $t}{set $crumbTrail[] = [$t.title, ($t.id | url), ($t.id | url : ['scheme' => 'full'])]}{/foreach}
{* I. Пропозиція, довіра й вибір рішення *}
{include 'zk.svc.hero'}
{include 'zk.cs.approach'}
{include 'zk.cs.types'}
{include 'zk.us.tasks'}
{if $isDir}{include 'zk.svc.children'}{/if}
{include 'zk.us.result'}
{include 'zk.cs.objects'}
{include 'zk.us.price'}
{include 'zk.us.calc'}
{* II. Технічна експертиза *}
{include 'zk.cs.build'}
{include 'zk.cs.tech'}
{include 'zk.us.specs'}
{include 'zk.us.compare'}
{include 'zk.us.options'}
{include 'zk.cs.factors'}
{include 'zk.us.stages'}
{include 'zk.us.timing'}
{include 'zk.us.docs'}
{* III. Чому обрати компанію *}
{include 'zk.us.why'}
{include 'zk.us.quality'}
{include 'zk.svc.brands'}
{include 'zk.us.warranty'}
{include 'zk.svc.videos'}
{include 'zk.cs.reviews'}
{include 'zk.home.clients'}
{include 'zk.home.map'}
{include 'zk.svc.faq'}
{include 'zk.cs.seo'}
{include 'zk.home.contact'}
{/block}
