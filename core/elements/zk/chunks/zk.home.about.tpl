<section class="about-block" id="about">
    <div class="about-photo" aria-hidden="true">
        <img src="{$zk.assets}img/about-steel.jpg" alt="" loading="lazy" width="419" height="426">
    </div>
    <div class="about-grid" aria-hidden="true"><i></i><i></i><i></i></div>
    <div class="wrap about-layout">
        <div class="about-copy">
            <div class="eyebrow"><span class="num">02</span><span class="sep">/</span>{'zk.about.eyebrow' | lexicon}</div>
            <h2 class="section-title">{'zk.about.title' | lexicon}</h2>
            <p>{'zk.about.text' | lexicon}</p>
            <a class="circle-link" href="{$zk.about | url}">
                <span>{'zk.about.more' | lexicon}</span>
                <i class="circle"><svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></i>
            </a>
        </div>
        <div class="about-points">
            <ul>
                <li>
                    <i class="point-icon"><svg aria-hidden="true"><use href="#i-design"/></svg></i>
                    <div><span><b>01</b> / {'zk.about.p1.label' | lexicon}</span>{'zk.about.p1.text' | lexicon}</div>
                </li>
                <li>
                    <i class="point-icon"><svg aria-hidden="true"><use href="#i-helmet"/></svg></i>
                    <div><span><b>02</b> / {'zk.about.p2.label' | lexicon}</span>{'zk.about.p2.text' | lexicon}</div>
                </li>
                <li>
                    <i class="point-icon"><svg aria-hidden="true"><use href="#i-docs"/></svg></i>
                    <div><span><b>03</b> / {'zk.about.p3.label' | lexicon}</span>{'zk.about.p3.text' | lexicon}</div>
                </li>
            </ul>
            <button class="btn btn-yellow btn-glow" type="button" data-consult>{'zk.about.cta' | lexicon}<svg class="icon" aria-hidden="true"><use href="#i-arrow"/></svg></button>
        </div>
    </div>
</section>
