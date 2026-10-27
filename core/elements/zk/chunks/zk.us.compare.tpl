{* Порівняння двох рішень: критерії в рядках, варіанти в колонках *}
{if $c.compare}
{set $hs = $c.sections.compare}
{set $cols = ($hs.note ?: ('zku.compare.cols' | lexicon)) | split : '|'}
<section class="us-compare section" id="compare">
    <div class="wrap">
        {set $hEyebrow = 'zku.compare.eyebrow' | lexicon}{set $hTitle = 'zku.compare.title' | lexicon}
        {include 'zk.cs.head'}
        <div class="svc-table-wrap">
            <table class="us-compare-table">
                <thead><tr><th scope="col">{'zku.compare.criterion' | lexicon}</th><th scope="col">{$cols[0] | trim}</th><th scope="col">{$cols[1] | trim}</th></tr></thead>
                <tbody>{foreach $c.compare as $r}<tr><th scope="row">{$r.criterion}</th><td>{$r.a}</td><td>{$r.b}</td></tr>{/foreach}</tbody>
            </table>
        </div>
        <div class="us-compare-foot">
            <p>{'zku.compare.help' | lexicon}</p>
            <button class="btn btn-yellow" type="button" data-consult>{'zku.compare.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
    </div>
</section>
{/if}
