/* Здоровий Клімат — новий дизайн 2026 (головна). База: вёрстка dist/assets/app.js */
(function () {
  'use strict';
  var $ = function (q, root) { return (root || document).querySelector(q); };
  var $$ = function (q, root) { return Array.prototype.slice.call((root || document).querySelectorAll(q)); };
  var lang = document.documentElement.lang || 'uk';

  /* ---------- header / menus ---------- */
  var header = $('.header'), menuToggle = $('.menu-toggle'), mobileMenu = $('.mobile-menu'),
      serviceToggle = $('[data-services-toggle]'), megaMenu = $('.mega-menu'),
      phoneDrop = $('[data-phone-drop]');
  var canHover = window.matchMedia ? window.matchMedia('(hover: hover) and (pointer: fine)') : { matches: false };

  function setMega(open) {
    if (!megaMenu || !serviceToggle) return;
    megaMenu.hidden = !open;
    serviceToggle.setAttribute('aria-expanded', String(open));
  }
  function setPhones(open) {
    if (!phoneDrop) return;
    phoneDrop.classList.toggle('is-open', open);
    var b = $('.header-phone-btn', phoneDrop);
    if (b) b.setAttribute('aria-expanded', String(open));
  }
  function closeMenus() {
    var wasOpen = mobileMenu && !mobileMenu.hidden;
    if (mobileMenu && menuToggle) {
      mobileMenu.hidden = true;
      menuToggle.setAttribute('aria-expanded', 'false');
    }
    setMega(false);
    setPhones(false);
    document.body.classList.remove('locked');
    if (wasOpen && menuToggle) menuToggle.focus({ preventScroll: true });
  }

  /* мобільне меню: панель поверх сторінки, закривається хрестиком, тлом або Esc */
  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener('click', function () {
      closeMenus();
      mobileMenu.hidden = false;
      menuToggle.setAttribute('aria-expanded', 'true');
      document.body.classList.add('locked');
      var c = $('.mm-close', mobileMenu);
      if (c) c.focus({ preventScroll: true });
    });
    $$('[data-menu-close]', mobileMenu).forEach(function (b) { b.addEventListener('click', closeMenus); });
    mobileMenu.addEventListener('click', function (e) { if (e.target === mobileMenu) closeMenus(); });
    // фокус не виходить за межі відкритої панелі
    mobileMenu.addEventListener('keydown', function (e) {
      if (e.key !== 'Tab') return;
      var f = $$('a[href], button:not([disabled])', mobileMenu).filter(function (el) { return el.offsetParent !== null; });
      if (!f.length) return;
      var first = f[0], last = f[f.length - 1];
      if (e.shiftKey && document.activeElement === first) { e.preventDefault(); last.focus(); }
      else if (!e.shiftKey && document.activeElement === last) { e.preventDefault(); first.focus(); }
    });
  }
  /* розкриття «Послуг» і напрямків у мобільному меню */
  $$('[data-mm-toggle]').forEach(function (b) {
    b.addEventListener('click', function () {
      var t = document.getElementById(b.getAttribute('aria-controls'));
      if (!t) return;
      var open = b.getAttribute('aria-expanded') !== 'true';
      b.setAttribute('aria-expanded', String(open));
      t.hidden = !open;
    });
  });

  /* «Послуги» на десктопі: відкриття кліком або наведенням, напрямок — наведенням/фокусом */
  if (serviceToggle && megaMenu) {
    var megaTimer;
    serviceToggle.addEventListener('click', function () {
      setPhones(false);
      setMega(canHover.matches ? true : megaMenu.hidden);
    });
    serviceToggle.addEventListener('mouseenter', function () {
      if (!canHover.matches) return;
      clearTimeout(megaTimer);
      setMega(true);
    });
    [serviceToggle, megaMenu].forEach(function (el) {
      el.addEventListener('mouseleave', function () {
        if (!canHover.matches) return;
        clearTimeout(megaTimer);
        megaTimer = setTimeout(function () { setMega(false); }, 280);
      });
      el.addEventListener('mouseenter', function () { clearTimeout(megaTimer); });
    });
    document.addEventListener('click', function (e) {
      if (!megaMenu.hidden && !e.target.closest('.mega-menu') && !e.target.closest('[data-services-toggle]')) setMega(false);
    });

    var dirs = $$('[data-mega-dir]', megaMenu), panes = $$('[data-mega-pane]', megaMenu), dirTimer;
    var showPane = function (id) {
      dirs.forEach(function (d) { d.classList.toggle('is-active', d.dataset.megaDir === id); });
      panes.forEach(function (p) { p.hidden = p.dataset.megaPane !== id; });
    };
    dirs.forEach(function (d) {
      d.addEventListener('mouseenter', function () {
        clearTimeout(dirTimer);
        dirTimer = setTimeout(function () { showPane(d.dataset.megaDir); }, 90);
      });
      d.addEventListener('mouseleave', function () { clearTimeout(dirTimer); });
      d.addEventListener('focus', function () { showPane(d.dataset.megaDir); });
      // сенсорний екран: перший дотик показує послуги напрямку, другий — відкриває його сторінку
      d.addEventListener('click', function (e) {
        if (!canHover.matches && !d.classList.contains('is-active')) { e.preventDefault(); showPane(d.dataset.megaDir); }
      });
    });
  }

  /* телефон у шапці на мобільному: список із двох номерів */
  if (phoneDrop) {
    var phoneBtn = $('.header-phone-btn', phoneDrop);
    if (phoneBtn) phoneBtn.addEventListener('click', function (e) {
      e.stopPropagation();
      var open = !phoneDrop.classList.contains('is-open');
      setMega(false);
      setPhones(open);
    });
    document.addEventListener('click', function (e) {
      if (phoneDrop.classList.contains('is-open') && !e.target.closest('[data-phone-drop]')) setPhones(false);
    });
  }

  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeMenus(); });
  var toTop = $('[data-to-top]');
  var onScroll = function () {
    if (header) header.classList.toggle('scrolled', window.scrollY > 180);
    if (toTop) toTop.classList.toggle('is-visible', window.scrollY > 700);
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();
  window.addEventListener('resize', function () {
    if (window.innerWidth > 950 && mobileMenu && !mobileMenu.hidden) closeMenus();
  });

  /* ---------- dialogs ---------- */
  function openDialog(d) {
    if (!d) return;
    if (typeof d.showModal === 'function') d.showModal(); else d.setAttribute('open', '');
    document.body.classList.add('locked');
  }
  $$('dialog').forEach(function (d) {
    d.addEventListener('close', function () {
      document.body.classList.remove('locked');
      var frame = $('iframe', d);
      if (frame) frame.remove();
    });
    d.addEventListener('click', function (e) {
      if (e.target !== d) return;
      var r = d.getBoundingClientRect();
      if (e.clientX < r.left || e.clientX > r.right || e.clientY < r.top || e.clientY > r.bottom) d.close();
    });
    var c = $('[data-close]', d);
    if (c) c.addEventListener('click', function () { d.close(); });
  });

  var consult = $('#consult-dialog');
  function openConsult(type) {
    closeMenus();
    if (!consult) { var c = $('#contact'); if (c) c.scrollIntoView({ behavior: 'smooth' }); return; }
    if (type) {
      var select = $('select[name="type"]', consult);
      if (select) {
        var option = Array.prototype.find.call(select.options, function (o) { return o.value === type || o.text === type; });
        if (option) select.value = option.value;
      }
    }
    openDialog(consult);
  }
  $$('[data-consult]').forEach(function (b) {
    b.addEventListener('click', function () { openConsult(b.dataset.consult); });
  });

  var videoDialog = $('#video-dialog');
  $$('[data-video]').forEach(function (b) {
    b.addEventListener('click', function () {
      var id = b.dataset.video, holder = $('.video-holder', videoDialog);
      holder.innerHTML = '';
      var frame = document.createElement('iframe');
      frame.className = 'video-frame';
      frame.title = b.dataset.title || '';
      frame.src = 'https://www.youtube-nocookie.com/embed/' + encodeURIComponent(id) + '?autoplay=1';
      frame.allow = 'autoplay; encrypted-media; picture-in-picture';
      frame.allowFullscreen = true;
      holder.appendChild(frame);
      $('.video-fallback a', videoDialog).href = 'https://www.youtube.com/watch?v=' + encodeURIComponent(id);
      openDialog(videoDialog);
    });
  });

  var projectDialog = $('#project-dialog');
  $$('[data-project]').forEach(function (b) {
    b.addEventListener('click', function () {
      var img = $('img', projectDialog);
      img.src = b.dataset.image || '';
      img.alt = b.dataset.title || '';
      img.hidden = !b.dataset.image;
      $('h2', projectDialog).textContent = b.dataset.title || '';
      $('.media-category', projectDialog).textContent = b.dataset.category || '';
      $('.project-original', projectDialog).href = b.dataset.url;
      openDialog(projectDialog);
    });
  });
  var projectConsult = projectDialog && $('.project-consult', projectDialog);
  if (projectConsult) projectConsult.addEventListener('click', function () { projectDialog.close(); openConsult(); });

  /* ---------- gallery (ліцензії тощо) ---------- */
  var gallery = $('#gallery-dialog');
  if (gallery) {
    var gImg = $('img', gallery), gItems = [], gIndex = 0;
    var showItem = function (i) {
      gIndex = (i + gItems.length) % gItems.length;
      var b = gItems[gIndex];
      gImg.src = b.dataset.full;
      gImg.alt = b.dataset.title || '';
      $('.gallery-title', gallery).textContent = b.dataset.title || '';
      $('.gallery-count', gallery).textContent = (gIndex + 1) + ' / ' + gItems.length;
      $('.gallery-open', gallery).href = b.dataset.full;
    };
    $$('[data-gallery]').forEach(function (root) {
      var items = $$('[data-full]', root);
      items.forEach(function (b, i) {
        b.addEventListener('click', function () {
          gItems = items;
          gallery.classList.toggle('is-single', items.length < 2);
          showItem(i);
          openDialog(gallery);
        });
      });
    });
    $('.gallery-prev', gallery).addEventListener('click', function () { showItem(gIndex - 1); });
    $('.gallery-next', gallery).addEventListener('click', function () { showItem(gIndex + 1); });
    gallery.addEventListener('keydown', function (e) {
      if (gItems.length < 2) return;
      if (e.key === 'ArrowLeft') showItem(gIndex - 1);
      if (e.key === 'ArrowRight') showItem(gIndex + 1);
    });
  }

  /* ---------- article: зміст за заголовками h2 ---------- */
  var article = $('[data-article]'), toc = $('[data-toc]');
  if (article && toc) {
    var heads = $$('h2', article).filter(function (h) { return h.textContent.trim(); });
    if (heads.length > 1) {
      var list = $('ol', toc), links = [];
      heads.forEach(function (h, i) {
        if (!h.id) h.id = 'section-' + (i + 1);
        var li = document.createElement('li'), a = document.createElement('a');
        // через <base href> відносне #id веде на головну — беремо повний шлях сторінки
        a.href = location.pathname + location.search + '#' + h.id;
        a.textContent = h.textContent.trim();
        li.appendChild(a); list.appendChild(li); links.push(a);
      });
      toc.hidden = false;
      if ('IntersectionObserver' in window) {
        var setActive = function (id) {
          links.forEach(function (a) { a.classList.toggle('is-active', a.hash === '#' + id); });
        };
        var io = new IntersectionObserver(function (entries) {
          entries.forEach(function (en) { if (en.isIntersecting) setActive(en.target.id); });
        }, { rootMargin: '-20% 0px -70% 0px' });
        heads.forEach(function (h) { io.observe(h); });
      }
    }
  }

  /* ---------- projects / objects: фільтр, лічильник, «Показати ще» ---------- */
  var plural = (window.Intl && Intl.PluralRules) ? new Intl.PluralRules(lang) : null;
  $$('[data-projects]').forEach(function (root) {
    var forms = (root.dataset.forms || '').split('|');
    var counter = $('[data-count]', root), more = $('[data-more]', root);
    var size = parseInt(root.dataset.pageSize || '0', 10), limit = size, current = 'all';
    var items = $$('[data-category-id]', root), filters = $$('[data-filter]', root);
    function count(n) {
      if (!counter || forms.length < 3) return;
      var cat = plural ? plural.select(n) : 'many';
      var word = cat === 'one' ? forms[0] : (cat === 'few' ? forms[1] : forms[2]);
      counter.textContent = n + ' ' + word;
    }
    function apply() {
      var n = 0;
      items.forEach(function (x) {
        var match = current === 'all' || x.dataset.categoryId === current;
        if (match) n++;
        x.hidden = !(match && (!size || n <= limit));
      });
      count(n);
      if (more) more.hidden = !size || n <= limit;
    }
    filters.forEach(function (b) {
      b.addEventListener('click', function () {
        filters.forEach(function (x) {
          x.classList.toggle('active', x === b);
          x.setAttribute('aria-pressed', String(x === b));
        });
        current = b.dataset.filter;
        limit = size;
        apply();
      });
    });
    if (more) more.addEventListener('click', function () {
      var first = items.filter(function (x) { return x.hidden && (current === 'all' || x.dataset.categoryId === current); })[0];
      limit += size;
      apply();
      if (first) first.focus({ preventScroll: true });
    });
    apply();
    root.classList.add('is-ready');
  });

  /* ---------- collapsible SEO text ---------- */
  $$('[data-collapsible]').forEach(function (box) {
    var text = $('.seo-text', box), btn = $('.seo-toggle', box);
    if (!text || !btn || text.scrollHeight < 260) return;
    box.classList.add('is-collapsible');
    btn.hidden = false;
    btn.addEventListener('click', function () {
      var open = box.classList.toggle('is-open');
      btn.setAttribute('aria-expanded', String(open));
      btn.firstChild.nodeValue = open ? btn.dataset.less : btn.dataset.more;
      if (!open) box.scrollIntoView({ behavior: 'smooth', block: 'start' });
    });
  });

  /* ---------- logo slider (2 rows, scroll-snap) ---------- */
  var reduceMotion = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  $$('[data-slider]').forEach(function (slider) {
    var vp = $('[data-slider-viewport]', slider), controls = $('[data-slider-controls]', slider),
        dotsBox = $('[data-slider-dots]', slider), prev = $('[data-slider-prev]', slider), next = $('[data-slider-next]', slider);
    if (!vp) return;
    var pages = 1, timer = null, hover = false;
    function pageWidth() { return vp.clientWidth || 1; }
    function current() { return Math.round(vp.scrollLeft / pageWidth()); }
    function build() {
      pages = Math.max(1, Math.ceil((vp.scrollWidth - 2) / pageWidth()));
      controls.hidden = pages < 2;
      dotsBox.innerHTML = '';
      for (var i = 0; i < pages; i++) {
        var d = document.createElement('button');
        d.type = 'button'; d.className = 'slider-dot'; d.setAttribute('aria-label', String(i + 1));
        d.addEventListener('click', (function (n) { return function () { go(n); restart(); }; })(i));
        dotsBox.appendChild(d);
      }
      sync();
    }
    function sync() {
      var c = Math.min(current(), pages - 1);
      $$('.slider-dot', dotsBox).forEach(function (d, i) {
        d.classList.toggle('is-active', i === c);
        d.setAttribute('aria-current', i === c ? 'true' : 'false');
      });
      if (prev) prev.disabled = vp.scrollLeft <= 2;
      if (next) next.disabled = vp.scrollLeft + vp.clientWidth >= vp.scrollWidth - 2;
    }
    function go(n) {
      if (n < 0) n = pages - 1;
      if (n > pages - 1) n = 0;
      vp.scrollTo({ left: n * pageWidth(), behavior: reduceMotion ? 'auto' : 'smooth' });
    }
    function restart() {
      if (timer) clearInterval(timer);
      if (reduceMotion || pages < 2) return;
      timer = setInterval(function () { if (!hover && !document.hidden) go(current() + 1); }, 5000);
    }
    if (prev) prev.addEventListener('click', function () { go(current() - 1); restart(); });
    if (next) next.addEventListener('click', function () { go(current() + 1); restart(); });
    var raf = 0;
    vp.addEventListener('scroll', function () { cancelAnimationFrame(raf); raf = requestAnimationFrame(sync); }, { passive: true });
    slider.addEventListener('mouseenter', function () { hover = true; });
    slider.addEventListener('mouseleave', function () { hover = false; });
    slider.addEventListener('focusin', function () { hover = true; });
    slider.addEventListener('focusout', function () { hover = false; });
    vp.addEventListener('touchstart', function () { restart(); }, { passive: true });
    vp.addEventListener('keydown', function (e) {
      if (e.key === 'ArrowRight') { e.preventDefault(); go(current() + 1); restart(); }
      if (e.key === 'ArrowLeft') { e.preventDefault(); go(current() - 1); restart(); }
    });
    var rt = 0;
    window.addEventListener('resize', function () { clearTimeout(rt); rt = setTimeout(function () { build(); restart(); }, 150); });
    build(); restart();
  });

  /* ---------- forms (AjaxForm + FormIt) ---------- */
  var isProduction = /(^|\.)zdorovklimat\.com\.ua$/.test(location.hostname);

  function phoneDigits(v) { return (v || '').replace(/\D/g, ''); }

  function formatPhone(input) {
    var d = phoneDigits(input.value);
    if (!d) { input.value = ''; return; }
    if (d.indexOf('380') !== 0) {
      if (d.charAt(0) === '0') d = '38' + d;
      else if (d.length <= 9 && input.value.trim().charAt(0) !== '+') d = '380' + d;
    }
    if (d.indexOf('380') !== 0) { input.value = '+' + d.slice(0, 15); return; }
    var r = d.slice(3, 12), out = '+380';
    if (r.length) out += ' ' + r.slice(0, 2);
    if (r.length > 2) out += ' ' + r.slice(2, 5);
    if (r.length > 5) out += ' ' + r.slice(5, 7);
    if (r.length > 7) out += ' ' + r.slice(7, 9);
    input.value = out;
  }

  function sendToCrm(form) {
    if (!isProduction) return; // заявки в Bitrix24 — лише з бойового домену
    var fd = new FormData(form), body = new URLSearchParams();
    var comment = [fd.get('type'), fd.get('message')].filter(Boolean).join('. ');
    body.append('lidName', 'Лид с сайта ' + location.hostname.replace(/^www\./, ''));
    body.append('lidSour', 'Лендінг Здоровий клімат (заявка)');
    body.append('url_site', location.href);
    body.append('phone', fd.get('phone') || '');
    body.append('phone_mail', fd.get('phone') || '');
    body.append('name_mail', fd.get('name') || '');
    body.append('comm', comment);
    body.append('hostt', location.host);
    try {
      if (navigator.sendBeacon) navigator.sendBeacon('/rest.php', body);
      else fetch('/rest.php', { method: 'POST', body: body, keepalive: true });
    } catch (e) { /* ignore */ }
  }

  function showResult(form, msg, isError) {
    var box = $('.form-result', form);
    if (!box) return;
    box.textContent = msg;
    box.classList.toggle('is-error', !!isError);
    box.hidden = !msg;
  }

  function validate(form) {
    var ok = true, firstBad = null;
    $$('.field', form).forEach(function (f) { f.classList.remove('is-invalid'); });
    $$('[required]', form).forEach(function (el) {
      var bad = !String(el.value || '').trim();
      if (el.name === 'phone' && !bad) {
        var n = phoneDigits(el.value).length;
        bad = n < 10 || n > 15;
      }
      if (bad) {
        ok = false;
        var f = el.closest('.field');
        if (f) f.classList.add('is-invalid');
        if (!firstBad) firstBad = el;
      }
    });
    if (!ok) {
      var phone = $('[name="phone"]', form);
      var phoneBad = phone && phone.closest('.field').classList.contains('is-invalid') && phone.value.trim();
      showResult(form, phoneBad ? form.dataset.msgPhone : form.dataset.msgRequired, true);
      if (firstBad) firstBad.focus();
    }
    return ok;
  }

  $$('form.lead-form').forEach(function (form) {
    var phone = $('[name="phone"]', form);
    if (phone) {
      phone.addEventListener('focus', function () { if (!phone.value) phone.value = '+380 '; });
      phone.addEventListener('blur', function () { if (phoneDigits(phone.value).length <= 3) phone.value = ''; });
      phone.addEventListener('input', function (e) {
        if (e.inputType && e.inputType.indexOf('delete') === 0) return;
        formatPhone(phone);
      });
    }
    $$('input, select, textarea', form).forEach(function (el) {
      el.addEventListener('input', function () { var f = el.closest('.field'); if (f) f.classList.remove('is-invalid'); });
      el.addEventListener('change', function () { var f = el.closest('.field'); if (f) f.classList.remove('is-invalid'); });
    });
    var ta = $('textarea', form);
    if (ta) ta.addEventListener('input', function () { ta.style.height = 'auto'; ta.style.height = Math.min(ta.scrollHeight, 220) + 'px'; });

    form.addEventListener('submit', function (e) {
      e.preventDefault();
      showResult(form, '', false);
      if (!validate(form)) return;
      var cfg = window.AjaxForm && window.AjaxForm.config;
      var btn = $('[type="submit"]', form);
      if (!cfg || !cfg.actionUrl) { showResult(form, form.dataset.msgError, true); return; }
      var fd = new FormData(form);
      if (cfg.pageId) fd.append('pageId', cfg.pageId);
      btn.setAttribute('aria-busy', 'true');
      var label = btn.firstChild.nodeValue;
      btn.firstChild.nodeValue = form.dataset.msgSending || label;
      fetch(cfg.actionUrl, {
        method: 'POST',
        body: fd,
        credentials: 'same-origin',
        headers: { 'X-Requested-With': 'XMLHttpRequest' }
      }).then(function (r) { return r.json(); }).then(function (res) {
        if (res && res.success) {
          sendToCrm(form);
          showResult(form, res.message || '', false);
          if (window.dataLayer) window.dataLayer.push({ event: 'lead_form_submit', form: form.id });
          var to = form.dataset.successUrl;
          if (to) setTimeout(function () { location.href = to; }, 400);
          else form.reset();
          return;
        }
        var errors = (res && res.data) || {};
        Object.keys(errors).forEach(function (k) {
          var el = form.elements[k], f = el && el.closest ? el.closest('.field') : null;
          if (f) f.classList.add('is-invalid');
        });
        showResult(form, (res && res.message) || form.dataset.msgError, true);
      }).catch(function () {
        showResult(form, form.dataset.msgError, true);
      }).then(function () {
        btn.removeAttribute('aria-busy');
        btn.firstChild.nodeValue = label;
      });
    });
  });

  /* ---------- відгуки: «Читати повністю», оцінка, форма easyComm ---------- */
  $$('.review-more').forEach(function (btn) {
    var text = btn.previousElementSibling;
    btn.addEventListener('click', function () {
      var open = text.classList.toggle('is-open');
      btn.setAttribute('aria-expanded', String(open));
    });
  });
  $$('form.review-form').forEach(function (form) {
    var result = $('.form-result', form), success = form.parentNode.querySelector('.review-success');
    var nameBox = $('.rating-name', form), names = nameBox ? (nameBox.dataset.names || '').split('|') : [];
    function say(msg, isError) {
      result.textContent = msg || '';
      result.classList.toggle('is-error', !!isError);
      result.hidden = !msg;
    }
    $$('input[name="rating"]', form).forEach(function (r) {
      r.addEventListener('change', function () { if (nameBox) nameBox.textContent = names[r.value - 1] || ''; });
    });
    $$('input, textarea', form).forEach(function (el) {
      el.addEventListener('input', function () { var f = el.closest('.field'); if (f) f.classList.remove('is-invalid'); });
    });
    var ta = $('textarea', form);
    if (ta) ta.addEventListener('input', function () { ta.style.height = 'auto'; ta.style.height = Math.min(ta.scrollHeight, 320) + 'px'; });
    form.addEventListener('submit', function (e) {
      e.preventDefault();
      say('');
      var bad = null;
      $$('.field', form).forEach(function (f) { f.classList.remove('is-invalid'); });
      $$('[required]', form).forEach(function (el) {
        if (!String(el.value || '').trim()) { el.closest('.field').classList.add('is-invalid'); bad = bad || el; }
      });
      if (bad) { say(form.dataset.msgRequired, true); bad.focus(); return; }
      var btn = $('[type="submit"]', form), label = btn.firstChild.nodeValue;
      var fd = new FormData(form);
      fd.append('action', 'message/create');
      btn.setAttribute('aria-busy', 'true');
      btn.firstChild.nodeValue = form.dataset.msgSending || label;
      fetch(form.dataset.action, { method: 'POST', body: fd, credentials: 'same-origin', headers: { 'X-Requested-With': 'XMLHttpRequest' } })
        .then(function (r) { return r.json(); })
        .then(function (res) {
          if (res && res.success) {
            form.reset();
            form.hidden = true;
            form.parentNode.classList.add('is-sent');
            if (success) { success.hidden = false; success.scrollIntoView({ behavior: 'smooth', block: 'center' }); }
            if (window.dataLayer) window.dataLayer.push({ event: 'review_submit' });
            return;
          }
          var errs = (res && Array.isArray(res.data)) ? res.data : [];
          errs.forEach(function (er) {
            var el = form.elements[er.field], f = el && el.closest ? el.closest('.field') : null;
            if (f) f.classList.add('is-invalid');
          });
          say((errs[0] && errs[0].message) || (res && res.message) || form.dataset.msgError, true);
        })
        .catch(function () { say(form.dataset.msgError, true); })
        .then(function () { btn.removeAttribute('aria-busy'); btn.firstChild.nodeValue = label; });
    });
  });

  /* ---------- «Повернутися назад» на 404/403 ---------- */
  $$('[data-back]').forEach(function (a) {
    a.addEventListener('click', function (e) {
      if (document.referrer && history.length > 1) { e.preventDefault(); history.back(); }
    });
  });

  /* ---------- мова: випадаючий список (наведення на десктопі, клік — для дотику й клавіатури) ---------- */
  $$('[data-lang-drop]').forEach(function (box) {
    var btn = $('.lang-current', box);
    function set(open) { box.classList.toggle('is-open', open); btn.setAttribute('aria-expanded', String(open)); }
    btn.addEventListener('click', function (e) { e.stopPropagation(); set(!box.classList.contains('is-open')); });
    document.addEventListener('click', function (e) { if (!box.contains(e.target)) set(false); });
    document.addEventListener('keydown', function (e) { if (e.key === 'Escape' && box.classList.contains('is-open')) { set(false); btn.focus(); } });
  });
})();
