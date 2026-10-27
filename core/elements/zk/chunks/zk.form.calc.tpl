{$_modx->lexicon->load('zdorovklimat:home')}
{$_modx->lexicon->load('zdorovklimat:universal')}
{set $fid = $zkId ?: 'calc'}
{set $ua = $_modx->resource.context_key == 'web'}
<form class="lead-form calc-form" id="form-{$fid}" method="post" novalidate
      data-success-url="{($ua ? 1479 : 1478) | url}"
      data-msg-required="{'zk.form.required' | lexicon}"
      data-msg-phone="{'zk.form.phone_invalid' | lexicon}"
      data-msg-error="{'zk.form.error' | lexicon}"
      data-msg-sending="{'zk.form.sending' | lexicon}">
    <div class="calc-fields">
        <div class="field">
            <label for="{$fid}-name">{'zk.form.name' | lexicon} *</label>
            <input id="{$fid}-name" name="name" autocomplete="name" placeholder="{'zk.form.name_ph' | lexicon}" required maxlength="80">
        </div>
        <div class="field field-phone">
            <label for="{$fid}-phone">{'zk.form.phone' | lexicon} *</label>
            <div class="phone-wrap">
                <span class="flag-ua" aria-hidden="true"></span>
                <input id="{$fid}-phone" type="tel" inputmode="tel" name="phone" autocomplete="tel" placeholder="{'zk.form.phone_ph' | lexicon}" required maxlength="24">
            </div>
        </div>
        <div class="field">
            <label for="{$fid}-param">{$zkParam}</label>
            <input id="{$fid}-param" name="param" maxlength="120" placeholder="{'zku.calc.param_ph' | lexicon}">
        </div>
    </div>
    <details class="calc-more">
        <summary>{'zku.calc.more' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg></summary>
        <div class="calc-fields calc-fields-2">
            <div class="field">
                <label for="{$fid}-city">{'zku.calc.city' | lexicon}</label>
                <input id="{$fid}-city" name="city" autocomplete="address-level2" maxlength="120" placeholder="{'zku.calc.city_ph' | lexicon}">
            </div>
            <div class="field">
                <label for="{$fid}-message">{'zku.calc.comment' | lexicon}</label>
                <textarea id="{$fid}-message" name="message" placeholder="{'zku.calc.comment_ph' | lexicon}" rows="1" maxlength="2500"></textarea>
            </div>
        </div>
    </details>
    <div class="hp-field" aria-hidden="true"><label>E-mail <input type="text" name="workemail" value="" tabindex="-1" autocomplete="off"></label></div>
    <input type="hidden" name="type" value="{$zkType}">
    <input type="hidden" name="title" value="{$_modx->resource.pagetitle | escape}">
    <input type="hidden" name="link" value="{$_modx->resource.id | url}">
    <div class="form-end">
        <button class="btn btn-dark" type="submit">{'zku.calc.submit' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        <p class="form-note"><svg class="icon" aria-hidden="true"><use href="#i-lock"/></svg><span>{'zk.form.privacy' | lexicon}</span></p>
    </div>
    <div class="form-result" role="status" aria-live="polite" hidden></div>
</form>
