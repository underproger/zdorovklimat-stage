{* Проміжна форма розрахунку: ім’я, телефон, параметр об’єкта; місто й коментар — у «Додати деталі». Тип послуги підставляється сторінкою *}
{set $hs = $c.sections.calc}
<section class="us-calc" id="calc">
    <div class="wrap">
        <div class="us-calc-box">
            <div class="us-calc-copy">
                <div class="eyebrow">{$hs.eyebrow ?: ('zku.calc.eyebrow' | lexicon)}</div>
                <h2 class="us-calc-title">{$hs.title ?: ('zku.calc.title' | lexicon)}</h2>
                <p>{$hs.text ?: ('zku.calc.text' | lexicon)}</p>
            </div>
            {set $calcType = $d.label | trim}{set $calcParam = $hs.note ?: ('zku.calc.param' | lexicon)}
            [[!AjaxForm?
                &form=`zk.form.calc`
                &zkId=`calc`
                &zkType=`{$calcType | escape}`
                &zkParam=`{$calcParam | escape}`
                &snippet=`FormIt`
                &hooks=`spam,email,FormItSaveForm`
                &formName=`{'zku.calc.subject' | lexicon} «{$calcType | escape}»`
                &formFields=`name,phone,type,param,title,link`
                &fieldNames=`name==Ім’я,phone==Телефон,type==Послуга,param=={$calcParam | escape},title==Сторінка,link==Посилання`
                &emailSubject=`{'zku.calc.subject' | lexicon} «{$calcType | escape}»`
                &emailTo=`[[++form-mail]]`
                &emailFrom=`no-reply@zdorovklimat.com.ua`
                &emailFromName=`[[++site_name]]`
                &emailTpl=`zk.email.calc`
                &spamCheckIp=`true`
                &validate=`name:required,phone:required,workemail:blank`
                &validationErrorMessage=`{'zk.form.required' | lexicon}`
                &successMessage=`{'zk.form.success' | lexicon}`
                &frontend_css=``
                &frontend_js=``
            ]]
        </div>
    </div>
</section>
