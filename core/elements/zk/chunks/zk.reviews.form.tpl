{* форма відгуку → easyComm (assets/components/easycomm/action.php), гілка $rv.thread; публікація після модерації *}
<section class="reviews-form section" id="review-form">
    <div class="wrap reviews-form-layout">
        <div class="reviews-form-copy">
            <div class="eyebrow">{'zkr.form.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zkr.form.title' | lexicon}</h2>
            <p>{'zkr.form.text' | lexicon}</p>
            <a class="text-link" href="{$zk.maps}" target="_blank" rel="noopener">{'zkr.form.google' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
        </div>
        <div class="form-card review-form-card">
            <h3 class="form-title">{'zkr.form.card' | lexicon}</h3>
            <p class="form-subtitle">{'zkr.form.card_text' | lexicon}</p>
            <form class="review-form" method="post" novalidate
                  data-action="/assets/components/easycomm/action.php"
                  data-msg-required="{'zkr.form.required' | lexicon}"
                  data-msg-error="{'zkr.form.error' | lexicon}"
                  data-msg-sending="{'zkr.form.sending' | lexicon}">
                <input type="hidden" name="thread" value="{$rv.thread}">
                <div class="hp-field" aria-hidden="true"><label>Website <input type="text" name="{$rv.antispam}" value="" tabindex="-1" autocomplete="off"></label></div>
                <div class="field-row">
                    <div class="field">
                        <label for="rv-name">{'zkr.form.name' | lexicon} *</label>
                        <input id="rv-name" name="user_name" autocomplete="name" placeholder="{'zkr.form.name_ph' | lexicon}" required maxlength="80">
                    </div>
                    <div class="field">
                        <label for="rv-company">{'zkr.form.company' | lexicon}</label>
                        <input id="rv-company" name="user_contacts" autocomplete="organization" placeholder="{'zkr.form.company_ph' | lexicon}" maxlength="120">
                    </div>
                </div>
                <div class="field">
                    <label for="rv-email">{'zkr.form.email' | lexicon}</label>
                    <input id="rv-email" type="email" name="user_email" autocomplete="email" placeholder="{'zkr.form.email_ph' | lexicon}" maxlength="120">
                </div>
                <fieldset class="field rating-field">
                    <legend>{'zkr.form.rating' | lexicon}</legend>
                    {set $rnames = 'zkr.form.rating_names' | lexicon | split : '||'}
                    <div class="rating-input">
                        {foreach [5, 4, 3, 2, 1] as $n}
                        <input type="radio" id="rv-r{$n}" name="rating" value="{$n}">
                        <label for="rv-r{$n}" title="{$rnames[$n - 1]}"><svg viewBox="0 0 24 24" aria-hidden="true"><path d="M12 2.8l2.83 5.73 6.33.92-4.58 4.46 1.08 6.3L12 17.27l-5.66 2.98 1.08-6.3-4.58-4.46 6.33-.92z"/></svg><span class="sr-only">{$n} — {$rnames[$n - 1]}</span></label>
                        {/foreach}
                    </div>
                    <span class="rating-name" aria-hidden="true" data-names="{$rnames | join : '|'}"></span>
                </fieldset>
                <div class="field">
                    <label for="rv-text">{'zkr.form.text_label' | lexicon} *</label>
                    <textarea id="rv-text" name="text" placeholder="{'zkr.form.text_ph' | lexicon}" rows="3" required maxlength="3000"></textarea>
                </div>
                <div class="form-end">
                    <button class="btn btn-yellow" type="submit">{'zkr.form.submit' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                    <p class="form-note"><svg class="icon" aria-hidden="true"><use href="#i-lock"/></svg><span>{'zkr.form.privacy' | lexicon}</span></p>
                </div>
                <div class="form-result" role="status" aria-live="polite" hidden></div>
            </form>
            <div class="review-success" role="status" aria-live="polite" hidden>
                <i class="why-check"><svg aria-hidden="true"><use href="#i-check"/></svg></i>
                <h3>{'zkr.form.success_title' | lexicon}</h3>
                <p>{'zkr.form.success' | lexicon}</p>
            </div>
        </div>
    </div>
</section>
