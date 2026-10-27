{* Технічні характеристики: таблиця «параметр — значення / як визначаємо» *}
{if $c.specs}
<section class="us-specs section" id="specs">
    <div class="wrap">
        {set $hs = $c.sections.specs}{set $hEyebrow = 'zku.specs.eyebrow' | lexicon}{set $hTitle = 'zku.specs.title' | lexicon}
        {include 'zk.cs.head'}
        <dl class="us-specs-grid">
            {foreach $c.specs as $s}<div class="us-spec"><dt>{$s.param}</dt><dd>{$s.value}</dd></div>{/foreach}
        </dl>
    </div>
</section>
{/if}
