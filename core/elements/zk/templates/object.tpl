{extends 'zk.layout'}
{block 'body_class'} zk-object{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:objects')}
{* дані рахуємо в шаблоні: змінні з include назад не повертаються *}
{set $res = $_modx->resource}
{set $catId = $res.parent}
{set $rootId = $catId | resource : 'parent'}
{set $catName = ('zk.cat.' ~ $catId) | lexicon}
{if $catName == ('zk.cat.' ~ $catId)}{set $catName = ($catId | resource : 'menutitle') ?: ($catId | resource : 'pagetitle')}{/if}
{* назва з «ялинками» замість прямих лапок — лише для показу *}
{set $title = $res.pagetitle | ereplace : '~"([^"]*)"~u' : '«$1»'}
{set $crumb = $title}
{set $crumbTrail = [
    [('zko.crumb' | lexicon), ($rootId | url), ($rootId | url : ['scheme' => 'full'])],
    [$catName, ($catId | url), ($catId | url : ['scheme' => 'full'])],
]}
{set $year = $res['object-date'] | strip_tags | trim}
{set $task = $res['object-task'] | trim}
{set $text = $res.content | ereplace : '#<p>(?:\s|&nbsp;|\x{00A0})*</p>#u' : '' | trim}
{* «Місце зведення будівлі: …» з опису — у факти першого екрана *}
{set $place = ''}
{if $text | ematch : '#(?:Місце|Место)[^:<]{0,40}:#u'}
    {set $place = $text | ereplace : '#^.*?(?:Місце|Место)[^:<]{0,40}:(.*?)(?:</p>|<br).*$#su' : '$1' | strip_tags | replace : '&nbsp;' : ' ' | ereplace : '#^[\s\x{00A0}]+|[\s\x{00A0}.]+$#u' : ''}
    {* цей абзац уже показано у фактах — прибираємо з опису *}
    {set $text = $text | ereplace : '#<p>(?:(?!</p>|<br).)*?(?:Місце|Место)[^:<]{0,40}:(?:(?!</p>|<br).)*</p>#su' : '' | trim}
{/if}
{* посилання на YouTube у тексті — кнопкою, що відкриває відео у вікні *}
{set $text = $text | ereplace : '#<a[^>]+href="https?://(?:www\.)?youtube\.com/watch\?v=([\w-]{11})[^"]*"[^>]*>.*?</a>#su' : ('<button class="video-link" type="button" data-video="$1"><span class="play"><svg aria-hidden="true"><use href="#i-play"/></svg></span>' ~ ('zko.obj.video' | lexicon) ~ '</button>')}
{set $gallery = $_modx->runSnippet('ms2Gallery', ['resources' => $res.id, 'limit' => 100, 'sortby' => 'rank', 'sortdir' => 'ASC', 'tpl' => 'zk.tpl.object.gallery', 'frontend_css' => '', 'frontend_js' => '']) | trim}
{set $photoCount = ($gallery | split : 'data-full=' | length) - 1}
{include 'zk.object.hero'}
{if $gallery}
<section class="object-gallery-section">
    <div class="wrap">{$gallery}</div>
</section>
{/if}
{include 'zk.object.info'}
{include 'zk.object.more'}
{include 'zk.home.contact'}
{/block}
