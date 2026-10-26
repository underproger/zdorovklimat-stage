<footer class="footer">
    <div class="wrap">
        <div class="footer-top">
            <div class="footer-brand">
                <a class="brand" href="{$zk.home | url}" aria-label="{'zk.brand_aria' | lexicon}">
                    <img class="brand-logo" src="{$zk.assets}img/logo.svg?v={$zk.v}" width="166" height="64" alt="{'zk.brand' | lexicon | replace : '<br>' : ' '}" loading="lazy">
                </a>
                <p class="footer-desc">{'zk.footer.desc' | lexicon}</p>
            </div>
            <div class="footer-col">
                <div class="footer-heading">{'zk.footer.company' | lexicon}</div>
                <div class="footer-links">
                    <a href="{$zk.about | url}">{'zk.footer.l_about' | lexicon}</a>
                    <a href="{$zk.objects | url}">{'zk.footer.l_objects' | lexicon}</a>
                    <a href="{$zk.video | url}">{'zk.footer.l_video' | lexicon}</a>
                    <a href="{$zk.blog | url}">{'zk.footer.l_blog' | lexicon}</a>
                    <a href="{$zk.reviews | url}">{'zk.footer.l_reviews' | lexicon}</a>
                </div>
            </div>
            <div class="footer-col">
                <div class="footer-heading">{'zk.footer.directions' | lexicon}</div>
                <div class="footer-links">
                    {foreach $zk.cards as $cardId}
                    {set $t = $cardId | resource : 'menutitle'}<a href="{$cardId | url}">{$t ?: ($cardId | resource : 'pagetitle')}</a>
                    {/foreach}
                    <a class="accent-link" href="{$zk.services | url}">{'zk.all_services' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-out"/></svg></a>
                </div>
            </div>
            <div class="footer-col">
                <div class="footer-heading">{'zk.footer.contacts' | lexicon}</div>
                <ul class="footer-contacts">
                    <li><i><svg aria-hidden="true"><use href="#i-phone-solid"/></svg></i><a href="tel:+38{$zk.phone1 | ereplace : '/\D+/' : ''}">{$zk.phone1}</a></li>
                    {if $zk.phone2}<li><i><svg aria-hidden="true"><use href="#i-phone-solid"/></svg></i><a href="tel:+38{$zk.phone2 | ereplace : '/\D+/' : ''}">{$zk.phone2}</a></li>{/if}
                    <li><i><svg aria-hidden="true"><use href="#i-mail-solid"/></svg></i><a href="mailto:{$zk.email}">{$zk.email}</a></li>
                    <li><i><svg aria-hidden="true"><use href="#i-pin-solid"/></svg></i><a href="{$zk.maps}" target="_blank" rel="noopener">{'zk.footer.address' | lexicon}<svg class="icon arrow" aria-hidden="true"><use href="#i-out"/></svg></a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <span>{'zk.footer.copy' | lexicon : ['year' => ('now' | date : 'Y')]}</span>
            <a href="https://impulse-design.com.ua/" target="_blank" rel="noopener">{'zk.footer.design' | lexicon}</a>
            <a class="top-link" href="{$zk.self}#top">{'zk.footer.top' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-up"/></svg></a>
        </div>
    </div>
</footer>
<div class="float-socials">
    <a href="{$zk.viber}" class="float-socials__item viber" aria-label="Viber"><svg width="19" height="20" viewBox="0 0 19 20" aria-hidden="true"><path fill="#fff" d="M7.19.06C4.57.38 2.64 1.16 1.66 2.31.98 3.11.44 4.37.18 5.82c-.17.93-.24 4.09-.11 5.18.35 3.04 1.63 4.96 3.83 5.79l.47.17v1.03c.01 1.21.08 1.59.35 1.82.47.41.79.21 2.09-1.31l.77-.9 1.55-.01c3.14-.02 5.63-.63 6.86-1.69.92-.77 1.6-1.92 1.92-3.15.43-1.7.51-5.35.16-7.11C17.38 2.3 15.8.88 11.96.2 10.92.01 8.18-.06 7.19.06Zm3.58 1.41c2.2.23 3.79.8 4.61 1.61.54.54.99 1.46 1.24 2.57.17.72.21 1.11.24 2.47.09 3.47-.29 5.08-1.5 6.28-.64.64-1.07.89-2.03 1.17-1.2.35-2.39.52-3.97.56l-1.47.05-.98 1.2c-.53.66-1.15 1.38-1.36 1.6-.6.64-.63.59-.63-1.57v-1.78l-.46-.17c-1.4-.51-2.39-1.7-2.82-3.4-.35-1.35-.37-4.52-.04-6.1.52-2.54 1.82-3.75 4.58-4.32 1.31-.27 3.18-.34 4.59-.18ZM5.35 4.24c-.71.37-1.3 1.11-1.31 1.65 0 .54.92 2.54 1.75 3.79.59.88 1.82 2.14 2.69 2.74.86.6 2.21 1.35 2.91 1.6.51.19.61.2.89.12.36-.11.84-.52 1.16-.99.46-.67.4-.96-.34-1.57-.77-.65-1.45-1.05-1.75-1.05-.36 0-.5.09-.76.45-.32.47-.58.55-1.1.35-1.11-.43-2.12-1.42-2.59-2.58-.29-.71-.26-.88.24-1.37.37-.37.43-.46.43-.73 0-.34-.41-1.07-1.07-1.92-.49-.61-.72-.71-1.16-.49Z"/></svg></a>
    <a href="{$zk.telegram}" class="float-socials__item telegram" target="_blank" rel="noopener" aria-label="Telegram"><svg width="21" height="18" viewBox="0 0 21 18" aria-hidden="true"><path fill="#fff" d="M16.22 1.01C14.55 1.57 10.34 2.95 6.87 4.1.9 6.06.56 6.19.32 6.45c-.43.49-.43 1.13 0 1.62.18.21.72.48 2.53 1.27 1.27.55 2.32 1.02 2.36 1.05.03.02.37 1.49.75 3.26.45 2.07.75 3.27.84 3.4.21.29.53.3.93.03.26-.17 2.59-1.89 3.34-2.48.05-.03.93.63 2.11 1.6 1.26 1.03 2.14 1.7 2.33 1.75.66.2 1.35-.2 1.56-.89.06-.21.92-3.84 1.92-8.07C20.38 3.07 20.78 1.24 20.74 1.02 20.63.48 20.05 0 19.5 0c-.12 0-1.6.45-3.27 1.01Zm3.29.39c-.02.1-.84 3.6-1.83 7.77-.98 4.17-1.79 7.6-1.81 7.6-.01.02-1.44-1.13-3.17-2.54L9.56 11.66l.56-.57c2.73-2.81 5.88-6.16 5.94-6.33.15-.39-.14-.78-.58-.78-.13 0-7.16 3.83-9.5 5.18-.21.12-.28.1-2.23-.75C2.64 7.92 1.6 7.47 1.46 7.39l-.28-.14 1.91-.63c1.04-.34 5.15-1.69 9.12-3 3.98-1.32 7.25-2.39 7.29-2.39.03-.01.04.07.01.17ZM11.55 7.81c-.35.37-1.24 1.31-1.98 2.08-.74.77-1.38 1.49-1.43 1.58-.06.1-.25.74-.45 1.41-.19.68-.36 1.23-.36 1.22-.04-.03-.85-3.82-.83-3.83.06-.05 5.63-3.12 5.66-3.12.02 0-.26.3-.61.66Zm-1.83 5.54c.22.18.4.35.39.38-.01.03-.41.35-.89.72-.55.41-.87.61-.84.51.02-.08.16-.55.3-1.04.14-.5.27-.94.29-1.01.04-.12.06-.11.75.44Z"/></svg></a>
</div>
