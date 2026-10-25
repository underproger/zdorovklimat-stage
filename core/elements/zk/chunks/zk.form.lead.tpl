{$_modx->lexicon->load('zdorovklimat:home')}
{set $fid = $zkId ?: 'lead'}
{set $ua = $_modx->resource.context_key == 'web'}
<form class="lead-form" id="form-{$fid}" method="post" novalidate
      data-success-url="{($ua ? 1479 : 1478) | url}"
      data-msg-required="{'zk.form.required' | lexicon}"
      data-msg-phone="{'zk.form.phone_invalid' | lexicon}"
      data-msg-error="{'zk.form.error' | lexicon}"
      data-msg-sending="{'zk.form.sending' | lexicon}">
    <div class="field-row">
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
    </div>
    <div class="field">
        <label for="{$fid}-type">{'zk.form.type' | lexicon} *</label>
        <div class="select-wrap">
            <select id="{$fid}-type" name="type" required>
                <option value="" selected disabled>{'zk.form.type_ph' | lexicon}</option>
                {foreach ('zk.form.types' | lexicon | split : '||') as $t}<option>{$t}</option>{/foreach}
            </select>
            <svg class="icon" aria-hidden="true"><use href="#i-chevron"/></svg>
        </div>
    </div>
    <div class="field">
        <label for="{$fid}-message">{'zk.form.message' | lexicon}</label>
        <textarea id="{$fid}-message" name="message" placeholder="{'zk.form.message_ph' | lexicon}" rows="1" maxlength="2500"></textarea>
    </div>
    <div class="hp-field" aria-hidden="true"><label>E-mail <input type="text" name="workemail" value="" tabindex="-1" autocomplete="off"></label></div>
    <input type="hidden" name="title" value="{$_modx->resource.pagetitle | escape}">
    <input type="hidden" name="link" value="{$_modx->resource.id | url}">
    <div class="form-end">
        <button class="btn btn-yellow" type="submit">{'zk.form.submit' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        <p class="form-note"><svg class="icon" aria-hidden="true"><use href="#i-lock"/></svg><span>{'zk.form.privacy' | lexicon}</span></p>
    </div>
    <div class="form-result" role="status" aria-live="polite" hidden></div>
</form>
