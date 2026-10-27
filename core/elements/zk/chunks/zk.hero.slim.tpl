{* Вузький перший екран: лише хлібні крошки і H1.
   $crumb / $crumbTrail — для крошок, $slimTitle — текст H1, $slimWall — фото для приглушеного фону (необов’язково) *}
<section class="page-hero slim-hero">
    {if $slimWall}
    <div class="video-wall" aria-hidden="true">
        {set $sc = $slimWall | length}
        {foreach 0..11 as $k}<img src="{$slimWall[$k % $sc]}" alt="" width="480" height="300">{/foreach}
    </div>
    {/if}
    <div class="page-hero-lines" aria-hidden="true"><i></i></div>
    <div class="wrap slim-hero-inner">
        {include 'zk.crumbs'}
        <h1>{$slimTitle}</h1>
    </div>
</section>
