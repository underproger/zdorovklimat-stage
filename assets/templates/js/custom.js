$(document).ready(function(){

    // Navigation
    $('.slimmenu').slimmenu({
        resizeWidth: '1200'
    });
    
    // Map google
    $('.overlay-map').click(function() {
	   $(this).remove();
	});
    
    // Jacor
    $('a[href^="#"], *[data-href^="#"]').on('click', function(e){
        e.preventDefault();
        var t = 1000;
        var d = $(this).attr('data-href') ? $(this).attr('data-href') : $(this).attr('href');
        $('html,body').stop().animate({ scrollTop: $(d).offset().top }, t);
    });
   
  // Content up
var body = $('body'),
    $dom = $(".content-up, .seo-up"),
    $domHolder = $(".content-up-hold, .seo-up-hold"),
    $wrapper = $(".wrapper");

function textBlock() {
    if (!$dom.length) return;

    $dom.css({ visibility: 'hidden', top: 0, left: 0, right: 0, bottom: 'auto' });
    $domHolder.css('height', '');

    function calculate() {
        var domHeight   = $dom.outerHeight();
        $domHolder.height(domHeight);

        // offset относительно wrapper (не документа)
        var holderTop   = $domHolder.offset().top - $wrapper.offset().top;

       $dom.css({
            top:        holderTop,
            bottom:     'auto',
            left:       0,
            right:      0,
            visibility: 'visible',
            opacity:    1  
        });
    }

    if (document.readyState === 'complete') {
        calculate();
    } else {
        $(window).one('load', calculate);
    }
}

textBlock();

var resizeTimer;
$(window).on('resize', function () {
    clearTimeout(resizeTimer);
    resizeTimer = setTimeout(function () {
        textBlock();
        resize_mob();
    }, 150);
});
    
    // Fixed header
	$window = $(window);
	$(window).scroll(function(){
		if($window.scrollTop() > 700)
			$(".row-header-bg").addClass("fixed-head");
		else	
			$(".row-header-bg").removeClass("fixed-head");
    });
     
    //Autoheight
    $('.box').AutoHeight()
    
    // LightGallery
    lightGallery(document.getElementById('lightgallery'),{
        download:false,
        mousewheel:true,
        mode:'lg-fade',
        mousewheel:true,
        pause:2000
    });
    
    // MODAL FORM
    $(".form-modal-overlay").css({backgroundColor:'rgba(0,0,0,.9)'});
     $(function() { // ��� �a��� �o��� �a������ ���a����
    	$('.btn-mobal').click( function(event){ // �o��� ���� �o ������ � class="modal"
    	event.preventDefault(); // ������a�� ��a��a����� �o�� �������a
        $.ionSound.play('wuf-4');
        if ($(this).next('.form-modal-overlay').size()){
            var form_modal_overlay = $(this).next('.form-modal-overlay');
        } else{
            var form_modal_overlay = $('.wrapper > .form-modal-overlay');
        }
    	form_modal_overlay.fadeIn(400, // ��a�a�a ��a��o �o�a���a�� ������ �o��o���
    	function(){ // �o��� ���o������ ����������� a���a���
    	$('.form-modal-body').css('display', 'block') // ����a�� � �o�a���o�o o��a display: none;
    	.animate({opacity: 1, top: '10%'}, 300); // ��a��o ����a����� ��o��a��o��� o��o�������o �o �����a���� ����
    	});
    	});
    	/* �a������ �o�a���o�o o��a, ��� ���a�� �o �� �a�o� �o � o��a��o� �o����� */
    	$('.modal-close').click( function(){ // �o��� ���� �o �������� ��� �o��o���
    	$.ionSound.play('wuf-3');
        $('.form-modal-body').animate({opacity: 0, top: '0'}, 300,  // ��a��o ������ ��o��a��o��� �a 0 � o��o�������o ����a�� o��o �����
    		function(){ // �o��� a���a���
    		$(this).css('display', 'none'); // ���a�� ��� display: none;
    		$('.form-modal-overlay').fadeOut(400); // �����a�� �o��o���
    		}
    	);
      });
     $(document).on('af_complete', function(event, response) {
        if (response.success) { //���� ����� ��������� � ��� ������
           $.ionSound.play('wuf-3');
           $('.form-modal-body').animate({opacity: 0, top: '10%'}, 500,  // ��a��o ������ ��o��a��o��� �a 0 � o��o�������o ����a�� o��o �����
        		function(){ // �o��� a���a���
        		$(this).css('display', 'none'); // ���a�� ��� display: none;
        		$('.form-modal-overlay').fadeOut(400); // �����a�� �o��o��� 
            });
         }
       });
    });
    // END MODAL FORM
    
    // ===================================================== Sounds
    $.ionSound({
        sounds: ["bip-1", "bip-2", "wuf-1", "wuf-2", "wuf-3", "wuf-4"],
        path: "/assets/images/sound/",
        volume: 0.6
    });
    // ===================================================== Sounds
        $(document).on('mouseenter',
        '.btn-mobal, ' +
        '.btn-send, ' +
        '.btn-modal-send', function () {
            $.ionSound.play('bip-2');
        });
        $(document).on('mouseenter',
        '.btn-more, ' +
        '.btn-services, ' +
        '.btn-services, ' +
        '.btn-more-slide, ' +
        '.bx-prev, ' +
        '.bx-next, ' +
        '.owl-dot, ' +
        '.ti-search, ' +
        '.lg-icon, ' +
        '.control-play, ' +
        '.control-play, ' +
        '.lity-close, ' +
        '.ti-angle-left, ' +
        '.ti-angle-right', function () {
            $.ionSound.play('bip-1');
        });
        $(document).on('click',
        '.gallery-colum, ' +
        '.control-play', function () {
            $.ionSound.play('bip-1');
        });
        $(document).on('click',
        '.gallery-colum, ' +
        '.control-play', function () {
            $.ionSound.play('wuf-4');
        });
        $(document).on('click',
        '.lg-close, ' +
        '.lity-close', function () {
            $.ionSound.play('wuf-3');
        });
        $(document).on('click',
        '.owl-dot, ' +
        '.bx-prev, ' +
        '.bx-next, ' +
        '.lg-next.lg-icon, ' +
        '.lg-prev.lg-icon, ' +
        '.ti-angle-left, ' +
        '.ti-angle-right', function () {
            $.ionSound.play('wuf-1');
        });
        
    // OWL carousel -Logo
    $('.logo-carousel').owlCarousel({
        loop:true,
        nav:true,
        margin:30,
        smartSpeed:2000,
        lazyLoad:true,
        pullDrag:false,
        navClass:["owl-ti-prev","owl-ti-next"],
        navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                touchDrag:false,
                pullDrag:false
            },
            1200:{
                items:1
            }
        }
    });

    // OWL carousel - Other-services
    $('.serv-carousel').owlCarousel({
        loop:true,
        nav:true,
        margin:10,
        smartSpeed:2000,
        lazyLoad:true,
        autoplay:true,
        autoplayTimeout:2500,
        autoplayHoverPause:true,
        navClass:["owl-ti-prev","owl-ti-next"],
        navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                autoplay:false
            },
            505:{
                items:2,
                autoplay:false
            },
            905:{
                items:3,
                autoplay:false
            },
            1205:{
                items:4
            }
        }
    });

    // OWL carousel - Related-products
    $('.row-related-products').owlCarousel({
        nav:true,
        margin:10,
        smartSpeed:2000,
        lazyLoad:true,
        navClass:["owl-ti-prev","owl-ti-next"],
        navText:['<i class="ti-angle-left"></i>','<i class="ti-angle-right"></i>'],
        URLhashListener:false,
        responsiveClass:true,
        responsive:{
            0:{
                items:1,
                autoplay:false
            },
            460:{
                items:2,
                autoplay:false
            },
            650:{
                items:3,
                autoplay:false
            },
            800:{
                items:4
            },
            1440:{
                items:5
            }
        }
    });
    
    // Modal photos
	$('a[data-rel]').each(function() {$(this).attr('rel', $(this).data('rel'));});
	$('a[rel^=fancybox]').not('.cloned a').fancybox({
		helpers : {
			thumbs : true
		}
	});
    
    //SLIDER
    $('.bxslider').bxSlider({
        mode: 'fade',
        speed:1000,
        pager:false,
        touchEnabled: false
    });
    
    // 2 colum content
	$(function(){
		$('.columsizer').columnize({width:750});
	});
    
    // LightGallery
    lightGallery(document.getElementById('lightgallery'),{
        download:false,
        mousewheel:true,
        mode:'lg-fade',
        selector: '.full',
        mousewheel:true,
        pause:2000
    });
    //SLICK Slider for product shop
    $('.slider-main').slick({
         slidesToShow: 1,
         slidesToScroll: 1,
         arrows: true,
         fade: true,
         asNavFor: '.slider-nav'
    });
    $('.slider-nav').slick({
         slidesToShow: 5,
         asNavFor: '.slider-main',
         arrows: false,
         focusOnSelect: true
    });
    
    // TABS
    $('.tabs').pwstabs({
        effect: 'none', // You can change effects of your tabs container: scale / slideleft / slideright / slidetop / slidedown / none
        defaultTab: 1, // The tab we want to be opened by default
        containerWidth: '100%', // Set custom container width if not set then 100% is used
        tabsPosition: 'horizontal', // Tabs position: horizontal / vertical
        horizontalPosition: 'top', // Tabs horizontal position: top / bottom
        verticalPosition: 'left', // Tabs vertical position: left / right
        responsive: true, // Make tabs container responsive: true / false - boolean
        rtl: false
    });
    
    // Accordion
    var acc = document.getElementsByClassName("accordion-permanent");
    var i;
    
    for (i = 0; i < acc.length; i++) {
      acc[i].addEventListener("click", function() {
        this.classList.toggle("active");
        var panel = this.nextElementSibling;
        if (panel.style.maxHeight){
          panel.style.maxHeight = null;
        } else {
          panel.style.maxHeight = panel.scrollHeight + "px";
        } 
      });
    }
    
    
    /* peremishenie pri adaptacii*/
    function resize_mob(){
        var mql901 = window.matchMedia("screen and (min-width: 901px)");
    	if(!mql901.matches){
                jQuery(".row-shop-preim").prependTo(".row-shop-preim-mobile");
    	}
        else {
                jQuery(".row-shop-preim").prependTo(".colum-prod-info-2");
        }
    }
    
    const reviewsSlider = new Swiper('.bl4-seo-reviews-slider .swiper', {
        slidesPerView: 1,
        spaceBetween: 10,
        loop: true,
        passiveListeners: false, 
        navigation: {
            prevEl: '.bl4-seo-reviews-slider .swiper-button-prev',
            nextEl: '.bl4-seo-reviews-slider .swiper-button-next',
        },
        breakpoints: {
            600: {
                slidesPerView: 2,
                spaceBetween: 20,
            },
            1200: {
                slidesPerView: 3,
                spaceBetween: 30,
            }
        },
    });
});