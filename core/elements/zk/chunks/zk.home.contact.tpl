<section class="contact-section" id="contact">
    <div class="contact-bg" aria-hidden="true"><img src="{$zk.assets}img/contact-bg.jpg" alt="" loading="lazy"><i class="contact-stripe"></i></div>
    <div class="wrap contact-layout">
        <div class="contact-copy">
            <div class="eyebrow">{'zk.contact.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zk.contact.title' | lexicon}</h2>
            <p>{'zk.contact.text' | lexicon}</p>
            <div class="contact-chips">
                <a class="chip" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">
                    <i class="chip-icon is-yellow"><svg aria-hidden="true"><use href="#i-phone-solid"/></svg></i>
                    <span><small>{'zk.contact.phone' | lexicon}</small>{$zk.phone1}</span>
                </a>
                <a class="chip" href="mailto:{$zk.email}">
                    <i class="chip-icon"><svg aria-hidden="true"><use href="#i-mail"/></svg></i>
                    <span><small>{'zk.contact.email' | lexicon}</small>{$zk.email}</span>
                </a>
            </div>
        </div>
        <div class="form-card">
            <h3 class="form-title">{'zk.form.title' | lexicon}</h3>
            <p class="form-subtitle">{'zk.form.subtitle' | lexicon}</p>
            [[!AjaxForm?
                &form=`zk.form.lead`
                &zkId=`lead`
                &snippet=`FormIt`
                &hooks=`spam,email,FormItSaveForm`
                &formName=`{'zk.form.subject' | lexicon}`
                &formFields=`name,phone,type,message,title,link`
                &fieldNames=`name==Ім’я,phone==Телефон,type==Тип об’єкта,message==Повідомлення,title==Сторінка,link==Посилання`
                &emailSubject=`{'zk.form.subject' | lexicon}`
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
    </div>
</section>
