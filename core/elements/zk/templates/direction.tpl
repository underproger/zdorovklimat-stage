{extends 'zk.layout'}
{block 'body_class'} zk-service zk-direction{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:services')}
{* усі дані — сніпет zkServiceData; змінні з include назад не повертаються *}
{set $d = $_modx->runSnippet('zkServiceData', ['id' => $_modx->resource.id, 'root' => $zk.services, 'mode' => 'direction']) | fromJSON}
{set $svcMode = 'direction'}
{set $crumb = $d.label}
{set $crumbTrail = [[('zks.crumb' | lexicon), ($zk.services | url), ($zk.services | url : ['scheme' => 'full'])]]}
{foreach $d.trail as $t}{set $crumbTrail[] = [$t.title, ($t.id | url), ($t.id | url : ['scheme' => 'full'])]}{/foreach}
{include 'zk.svc.hero'}
{include 'zk.svc.children'}
{include 'zk.svc.intro'}
{include 'zk.svc.advantages'}
{include 'zk.svc.why'}
{include 'zk.svc.steps'}
{include 'zk.svc.works'}
{include 'zk.svc.price'}
{include 'zk.svc.videos'}
{include 'zk.svc.objects'}
{set $processNum = ''}
{include 'zk.home.process'}
{include 'zk.svc.reviews'}
{include 'zk.svc.faq'}
{include 'zk.svc.seo'}
{include 'zk.home.contact'}
{/block}
