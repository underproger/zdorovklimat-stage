{* Галерея об’єкта: tpl для ms2Gallery ($files). Велике фото — з водяним знаком, як на старому сайті *}
{set $re = '~^(\\[\\[!?\\+\\+url_site\\]\\]|https?://[^/]+)?/*~'}
{if $files}
{set $total = $files | length}
{set $t = $_modx->resource.pagetitle | ereplace : '~"([^"]*)"~u' : '«$1»' | escape}
<div class="object-gallery" data-gallery>
    {foreach $files as $i => $f}
    {set $src = $f.url | ereplace : '~^/+~' : ''}
    {if $src | ematch : '/[^\x20-\x7E]/'}
        {set $big = '/' ~ $src}{set $thumb = $big}
    {else}
        {set $big = '/' ~ ($_modx->runSnippet('pthumb', ['input' => $src, 'options' => 'w=1920&h=1440&q=82&f=jpg&fltr[]=wmi|assets/images/design/watermark_obgekt_page_box.png|C|35|10|10|0']) | ereplace : $re : '')}
        {set $thumb = '/' ~ ($_modx->runSnippet('pthumb', ['input' => $src, 'options' => ($i == 0 ? 'w=1440&h=640&zc=1&q=80&f=jpg' : 'w=600&h=420&zc=1&q=76&f=jpg')]) | ereplace : $re : '')}
    {/if}
    <button class="gallery-tile{$i == 0 ? ' is-main' : ''}" type="button" data-full="{$big}" data-title="{$t}"{if $i > 8} hidden{/if}>
        <img src="{$thumb}" alt="{$t}, {'zko.obj.photo' | lexicon} {$i + 1}"{if $i > 0} loading="lazy" width="600" height="420"{else} fetchpriority="high" width="1440" height="640"{/if}>
        {if $i == 8 && $total > 9}<span class="gallery-more">+{$total - 9}</span>{/if}
        <span class="round gallery-zoom" aria-hidden="true"><svg class="icon"><use href="#i-zoom"/></svg></span>
    </button>
    {/foreach}
</div>
{/if}
