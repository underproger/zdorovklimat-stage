{ignore}<script type="application/ld+json">{/ignore}
{
    "@context": "https://schema.org",
    "@type": "LocalBusiness",
    "@id": "[[!++site_url]]",
    "url": "[[!++site_url]]",
    "name": "{$ua ? 'Здоровий Клімат' : 'Здоровый Климат'}",
    "image": "[[!++site_url:replace=`ru/==`]]assets/templates/zk/img/hero.webp",
    "logo": "[[!++site_url:replace=`ru/==`]]assets/templates/zk/img/mark.svg",
    "description": "{'zk.footer.desc' | lexicon | escape : 'js'}",
    "email": "{$zk.email}",
    "telephone": "+38{$zk.phone1 | ereplace : '/\D+/' : ''}",
    "priceRange": "$$",
    "address": {
        "@type": "PostalAddress",
        "streetAddress": "{$ua ? 'вул. Стрийська, 55' : 'ул. Стрыйская, 55'}",
        "addressLocality": "{$ua ? 'с. Солонка' : 'с. Солонка'}",
        "addressRegion": "{$ua ? 'Львівська обл.' : 'Львовская обл.'}",
        "addressCountry": "UA"
    },
    "areaServed": "UA",
    "openingHoursSpecification": [{
        "@type": "OpeningHoursSpecification",
        "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
        "opens": "09:00",
        "closes": "18:00"
    }]
}
{ignore}</script>{/ignore}
