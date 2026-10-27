{* «Враховуємо все, що важливо»: картки з іконкою, текстом і фото *}
{if $c.factors}
<section class="cs-factors section" id="factors">
    <div class="wrap">
        {set $hs = $c.sections.factors}{set $hEyebrow = 'zkc.factors.eyebrow' | lexicon}{set $hTitle = 'zkc.factors.title' | lexicon}
        {include 'zk.cs.head'}
        <div class="cs-factors-grid">
            {foreach $c.factors as $f}
            <article class="cs-factor{$f.img ? '' : ' no-photo'}">
                <div class="cs-factor-body">
                    <i class="cs-factor-ico" aria-hidden="true"><svg class="icon"><use href="#i-{$f.icon ?: 'check'}"/></svg></i>
                    <h3>{$f.title}</h3>
                    {if $f.text}<p>{$f.text}</p>{/if}
                </div>
                {if $f.img}<div class="cs-factor-photo"><img src="{$f.img}" alt="{$f.title | escape}" loading="lazy" width="420" height="420"></div>{/if}
            </article>
            {/foreach}
        </div>
    </div>
</section>
{/if}
