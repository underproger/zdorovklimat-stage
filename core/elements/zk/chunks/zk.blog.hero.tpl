{set $crumb = 'zkb.crumb' | lexicon}
<section class="blog-hero">
    <div class="blog-decor" aria-hidden="true"><img src="{$zk.assets}img/blog-decor.jpg" alt="" width="310" height="150"><i class="plus"></i></div>
    <div class="wrap">
        {include 'zk.crumbs'}
        <div class="eyebrow">{'zkb.hero.eyebrow' | lexicon}</div>
        <h1>{'zkb.hero.title' | lexicon}</h1>
        <p class="blog-hero-text">{'zkb.hero.text' | lexicon}</p>
    </div>
</section>
