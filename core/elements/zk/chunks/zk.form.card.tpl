{* Картка із формою заявки (AjaxForm + FormIt). Тема листа залежить від сторінки *}
{set $formSubject = $isHome ? ('zk.form.subject' | lexicon) : (('zk.form.subject_page' | lexicon) ~ ' «' ~ ($_modx->resource.menutitle ?: $_modx->resource.pagetitle) ~ '»')}
<div class="form-card">
    <h3 class="form-title">{'zk.form.title' | lexicon}</h3>
    <p class="form-subtitle">{'zk.form.subtitle' | lexicon}</p>
    [[!AjaxForm?
        &form=`zk.form.lead`
        &zkId=`lead`
        &snippet=`FormIt`
        &hooks=`spam,email,FormItSaveForm`
        &formName=`{$formSubject}`
        &formFields=`name,phone,type,message,title,link`
        &fieldNames=`name==Ім’я,phone==Телефон,type==Тип об’єкта,message==Повідомлення,title==Сторінка,link==Посилання`
        &emailSubject=`{$formSubject}`
        &emailTo=`[[++form-mail]]`
        &emailFrom=`no-reply@zdorovklimat.com.ua`
        &emailFromName=`[[++site_name]]`
        &emailTpl=`zk.email.lead`
        &spamCheckIp=`true`
        &validate=`name:required,phone:required,type:required,workemail:blank`
        &validationErrorMessage=`{'zk.form.required' | lexicon}`
        &successMessage=`{'zk.form.success' | lexicon}`
        &frontend_css=``
        &frontend_js=``
    ]]
</div>
