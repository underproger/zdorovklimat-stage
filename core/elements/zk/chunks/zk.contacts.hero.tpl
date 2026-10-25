{set $crumb = 'zkc.crumb' | lexicon}
<section class="contacts-hero" id="contact">
    <div class="contact-bg" aria-hidden="true"><img src="{$zk.assets}img/contact-bg.jpg" alt="" fetchpriority="high"><i class="contact-stripe"></i></div>
    <div class="wrap contacts-layout">
        <div class="contacts-copy">
            {include 'zk.crumbs'}
            <div class="eyebrow">{'zkc.hero.eyebrow' | lexicon}</div>
            <h1>{'zkc.hero.title' | lexicon}</h1>
            <p class="contacts-lead">{'zkc.hero.text' | lexicon}</p>
            <ul class="contacts-grid">
                <li class="contact-item">
                    <i class="chip-icon is-yellow"><svg aria-hidden="true"><use href="#i-phone-solid"/></svg></i>
                    <div>
                        <small>{'zkc.phones' | lexicon}</small>
                        <a class="contact-big" href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}</a>
                        {if $zk.phone2}<a class="contact-big" href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}">{$zk.phone2}</a>{/if}
                    </div>
                </li>
                <li class="contact-item">
                    <i class="chip-icon"><svg aria-hidden="true"><use href="#i-mail"/></svg></i>
                    <div>
                        <small>{'zkc.email' | lexicon}</small>
                        <a class="contact-big" href="mailto:{$zk.email}">{$zk.email}</a>
                        <span class="contact-note">{'zkc.email_note' | lexicon}</span>
                    </div>
                </li>
                <li class="contact-item">
                    <i class="chip-icon"><svg aria-hidden="true"><use href="#i-pin"/></svg></i>
                    <div>
                        <small>{'zkc.address' | lexicon}</small>
                        <address>{'zk.footer.address' | lexicon}</address>
                        <a class="contact-more" href="{$zk.self}#office">{'zkc.route' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-down"/></svg></a>
                    </div>
                </li>
                <li class="contact-item">
                    <i class="chip-icon"><svg aria-hidden="true"><use href="#i-clock"/></svg></i>
                    <div>
                        <small>{'zkc.hours' | lexicon}</small>
                        <span class="contact-big">{'zkc.hours_value' | lexicon}</span>
                        <span class="contact-note">{'zkc.hours_note' | lexicon}</span>
                    </div>
                </li>
            </ul>
            <div class="contacts-social">
                <small>{'zkc.social' | lexicon}</small>
                <div>
                    <a class="social-pill" href="{$zk.viber}"><svg aria-hidden="true"><use href="#i-viber"/></svg>Viber</a>
                    <a class="social-pill" href="{$zk.telegram}" target="_blank" rel="noopener"><svg aria-hidden="true"><use href="#i-telegram"/></svg>Telegram</a>
                    {if $zk.facebook && $zk.facebook != '#'}<a class="social-pill" href="{$zk.facebook}" target="_blank" rel="noopener"><svg aria-hidden="true"><use href="#i-facebook"/></svg>Facebook</a>{/if}
                    {if $zk.youtube && $zk.youtube != '#'}<a class="social-pill" href="{$zk.youtube}" target="_blank" rel="noopener"><svg aria-hidden="true"><use href="#i-youtube"/></svg>YouTube</a>{/if}
                </div>
            </div>
        </div>
        {include 'zk.form.card'}
    </div>
</section>
