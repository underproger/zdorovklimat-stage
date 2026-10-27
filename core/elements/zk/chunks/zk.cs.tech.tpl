{* Технології будівництва: рядки «фото + опис + пункти», через один — дзеркально *}
{if $c.tech}
<section class="cs-tech section svc-alt" id="tech">
    <div class="wrap">
        {set $hs = $c.sections.tech}{set $hEyebrow = 'zkc.tech.eyebrow' | lexicon}{set $hTitle = 'zkc.tech.title' | lexicon}
        {include 'zk.cs.head'}
        <div class="cs-tech-list">
            {foreach $c.tech as $i => $t}
            <article class="cs-tech-row{($i % 2 == 1) ? ' is-rev' : ''}">
                <div class="cs-tech-photo">{if $t.img}<img src="{$t.img}" alt="{$t.title | escape}" loading="lazy" width="1100" height="680">{/if}</div>
                <div class="cs-tech-body">
                    <div class="cs-tech-main">
                        <span class="cs-dash" aria-hidden="true"></span>
                        <h3>{$t.title}</h3>
                        {if $t.text}<p>{$t.text}</p>{/if}
                        {if $t.link}
                        <a class="btn btn-yellow" href="{$t.link}">{'zkc.tech.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></a>
                        {else}
                        <button class="btn btn-yellow" type="button" data-consult>{'zkc.build.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                        {/if}
                    </div>
                    {if $t.bullets}<ul class="cs-tech-bullets">{foreach $t.bullets as $b}<li>{$b}</li>{/foreach}</ul>{/if}
                </div>
            </article>
            {/foreach}
        </div>
    </div>
</section>
{/if}
