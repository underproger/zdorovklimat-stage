{* Комплектація: додаткові системи й роботи, посилання на суміжні послуги *}
{if $c.options}
<section class="us-options section" id="options">
    <div class="wrap">
        {set $hs = $c.sections.options}{set $hEyebrow = 'zku.options.eyebrow' | lexicon}{set $hTitle = 'zku.options.title' | lexicon}
        {include 'zk.cs.head'}
        <ul class="us-options-list">
            {foreach $c.options as $o}
            <li>
                {if $o.link}<a class="us-option" href="{$o.link}">{else}<div class="us-option">{/if}
                    <span class="us-option-title">{$o.title}</span>
                    {if $o.text}<span class="us-option-text">{$o.text}</span>{/if}
                    {if $o.link}<i class="round" aria-hidden="true"><svg class="icon"><use href="#i-arrow"/></svg></i>{/if}
                {if $o.link}</a>{else}</div>{/if}
            </li>
            {/foreach}
        </ul>
    </div>
</section>
{/if}
