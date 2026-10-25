<dialog id="consult-dialog" aria-labelledby="consult-title">
    <div class="dialog-inner">
        <button class="dialog-close" type="button" data-close aria-label="{'zk.close' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-close"/></svg></button>
        <div class="eyebrow">{'zk.dialog.eyebrow' | lexicon}</div>
        <h2 id="consult-title">{'zk.dialog.title' | lexicon}</h2>
        <p class="dialog-description">{'zk.dialog.text' | lexicon}</p>
        [[!AjaxForm?
            &form=`zk.form.lead`
            &zkId=`dialog`
            &snippet=`FormIt`
            &hooks=`spam,email,FormItSaveForm`
            &formName=`{'zk.form.subject_dialog' | lexicon}`
            &formFields=`name,phone,type,message,title,link`
            &fieldNames=`name==Ім’я,phone==Телефон,type==Тип об’єкта,message==Повідомлення,title==Сторінка,link==Посилання`
            &emailSubject=`{'zk.form.subject_dialog' | lexicon}`
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
</dialog>
<dialog id="video-dialog" class="media-dialog" aria-label="{'zk.video.label' | lexicon}">
    <button class="dialog-close" type="button" data-close aria-label="{'zk.close' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-close"/></svg></button>
    <div class="video-holder"></div>
    <p class="video-fallback">{'zk.video.fallback' | lexicon} <a href="https://www.youtube.com/watch?v=lUnBVn_8tZc" target="_blank" rel="noopener">{'zk.video.open' | lexicon} ↗</a></p>
</dialog>
<dialog id="project-dialog" class="media-dialog" aria-labelledby="project-title">
    <button class="dialog-close" type="button" data-close aria-label="{'zk.close' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-close"/></svg></button>
    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="">
    <div class="media-body">
        <div class="media-category"></div>
        <h2 id="project-title"></h2>
        <div class="media-actions">
            <button class="btn btn-yellow project-consult" type="button">{'zk.projects.consult' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
            <a class="text-link project-original" href="{$zk.objects | url}">{'zk.projects.gallery' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
        </div>
    </div>
</dialog>
<dialog id="gallery-dialog" class="media-dialog gallery-dialog" aria-label="{'zk.gallery.label' | lexicon}">
    <button class="dialog-close" type="button" data-close aria-label="{'zk.close' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-close"/></svg></button>
    <figure class="gallery-stage">
        <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" alt="">
        <figcaption class="gallery-bar">
            <span class="gallery-title"></span>
            <span class="gallery-nav">
                <span class="gallery-count"></span>
                <button class="round gallery-prev" type="button" aria-label="{'zk.gallery.prev' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <button class="round gallery-next" type="button" aria-label="{'zk.gallery.next' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
                <a class="round gallery-open" href="#" target="_blank" rel="noopener" aria-label="{'zk.gallery.open' | lexicon}"><svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
            </span>
        </figcaption>
    </figure>
</dialog>
