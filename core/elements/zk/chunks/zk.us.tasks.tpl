{* Задачі клієнта → наш підхід: рядки «проблема — рішення» *}
{if $c.tasks}
<section class="us-tasks section" id="tasks">
    <div class="wrap">
        {set $hs = $c.sections.tasks}{set $hEyebrow = 'zku.tasks.eyebrow' | lexicon}{set $hTitle = 'zku.tasks.title' | lexicon}
        {include 'zk.cs.head'}
        <div class="us-tasks-table" role="table" aria-label="{'zku.tasks.eyebrow' | lexicon}">
            <div class="us-tasks-row us-tasks-th" role="row"><span role="columnheader">{'zku.tasks.col1' | lexicon}</span><span role="columnheader">{'zku.tasks.col2' | lexicon}</span></div>
            {foreach $c.tasks as $t}
            <div class="us-tasks-row" role="row">
                <p class="us-task" role="cell">{$t.task}</p>
                <p class="us-solution" role="cell"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg><span>{$t.solution}</span></p>
            </div>
            {/foreach}
        </div>
    </div>
</section>
{/if}
