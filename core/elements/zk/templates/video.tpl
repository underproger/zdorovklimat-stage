{extends 'zk.layout'}
{block 'body_class'} zk-video{/block}
{block 'main'}
{$_modx->lexicon->load('zdorovklimat:video')}
{* відео: MIGX-TV objects-video-list (text, id YouTube, img) → $videos; рахуємо тут, бо змінні з include назад не повертаються *}
{set $zkUrlRe = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~'}
{set $rows = $_modx->runSnippet('pdoField', ['id' => $_modx->resource.id, 'field' => 'objects-video-list'])}
{if !($rows is iterable)}{set $rows = $rows | fromJSON}{/if}
{set $videos = []}
{foreach $rows as $row}
    {set $yt = $row.id | trim}
    {if $yt}
        {set $img = $row.img | trim | ereplace : '~^/+~' : ''}
        {if $img}
            {set $cover = '/' ~ ($_modx->runSnippet('pthumb', ['input' => $img, 'options' => 'w=960&h=540&zc=1&q=80&f=jpg']) | ereplace : $zkUrlRe : '')}
            {set $small = '/' ~ ($_modx->runSnippet('pthumb', ['input' => $img, 'options' => 'w=480&h=270&zc=1&q=70&f=jpg']) | ereplace : $zkUrlRe : '')}
        {else}
            {set $cover = 'https://i.ytimg.com/vi/' ~ $yt ~ '/hqdefault.jpg'}
            {set $small = $cover}
        {/if}
        {set $videos[] = ['id' => $yt, 'title' => ($row.text | trim | ereplace : '~"([^"]*)"~u' : '«$1»'), 'cover' => $cover, 'small' => $small]}
    {/if}
{/foreach}
{include 'zk.video.hero'}
{include 'zk.video.list'}
{include 'zk.home.clients'}
{include 'zk.home.contact'}
{/block}
