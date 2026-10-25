/* Здоровий Клімат — новий дизайн 2026 (головна). База: вёрстка dist/assets/app.js */
(function () {
  'use strict';
  var $ = function (q, root) { return (root || document).querySelector(q); };
  var $$ = function (q, root) { return Array.prototype.slice.call((root || document).querySelectorAll(q)); };
  var lang = document.documentElement.lang || 'uk';

  /* ---------- header / menus ---------- */
  var header = $('.header'), menuToggle = $('.menu-toggle'), mobileMenu = $('.mobile-menu'),
      serviceToggle = $('[data-services-toggle]'), megaMenu = $('.mega-menu');

  function closeMenus() {
    if (mobileMenu && menuToggle) {
      mobileMenu.hidden = true;
      menuToggle.setAttribute('aria-expanded', 'false');
      menuToggle.setAttribute('aria-label', menuToggle.dataset.labelOpen || '');
    }
    if (megaMenu && serviceToggle) {
      megaMenu.hidden = true;
      serviceToggle.setAttribute('aria-expanded', 'false');
    }
    document.body.classList.remove('locked');
  }
  if (menuToggle && mobileMenu) {
    menuToggle.addEventListener('click', function () {
      var open = mobileMenu.hidden;
      closeMenus();
      mobileMenu.hidden = !open;
      menuToggle.setAttribute('aria-expanded', String(open));
      menuToggle.setAttribute('aria-label', open ? menuToggle.dataset.labelClose : menuToggle.dataset.labelOpen);
      document.body.classList.toggle('locked', open);
    });
  }
  if (serviceToggle && megaMenu) {
    serviceToggle.addEventListener('click', function () {
      megaMenu.hidden = !megaMenu.hidden;
      serviceToggle.setAttribute('aria-expanded', String(!megaMenu.hidden));
    });
    document.addEventListener('click', function (e) {
      if (!e.target.closest('.header') && !megaMenu.hidden) {
        megaMenu.hidden = true;
        serviceToggle.setAttribute('aria-expanded', 'false');
      }
    });
  }
  document.addEventListener('keydown', function (e) { if (e.key === 'Escape') closeMenus(); });
  var onScroll = function () { if (header) header.classList.toggle('scrolled', window.scrollY > 180); };
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

  /* ---------- projects filter ---------- */
  var plural = (window.Intl && Intl.PluralRules) ? new Intl.PluralRules(lang) : null;
  $$('[data-projects]').forEach(function (root) {
    var forms = (root.dataset.forms || '').split('|');
    var counter = $('[data-count]', root);
    function count(n) {
      if (!counter || forms.length < 3) return;
      var cat = plural ? plural.select(n) : 'many';
      var word = cat === 'one' ? forms[0] : (cat === 'few' ? forms[1] : forms[2]);
      counter.textContent = n + ' ' + word;
    }
    count($$('[data-category-id]', root).length);
    $$('[data-filter]', root).forEach(function (b) {
      b.addEventListener('click', function () {
        $$('[data-filter]', root).forEach(function (x) {
          x.classList.toggle('active', x === b);
          x.setAttribute('aria-pressed', String(x === b));
        });
        var n = 0;
        $$('[data-category-id]', root).forEach(function (x) {
          var show = b.dataset.filter === 'all' || x.dataset.categoryId === b.dataset.filter;
          x.hidden = !show;
          if (show) n++;
        });
        count(n);
      });
    });
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
})();
