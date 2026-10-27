{* Шапка блоку будівельної послуги: $hs — тексти блоку з cs-sections, $hEyebrow — надзаголовок за замовчуванням, $hTitle — заголовок за замовчуванням *}
<div class="section-head cs-head">
    <div>
        <div class="eyebrow">{$hs.eyebrow ?: $hEyebrow}</div>
        <h2 class="section-title">{$hs.title ?: $hTitle}</h2>
    </div>
    {if $hs.text}<p class="section-description">{$hs.text}</p>{/if}
</div>
