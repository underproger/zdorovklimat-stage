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
        {include 'zk.form.card'}
    </div>
</section>
