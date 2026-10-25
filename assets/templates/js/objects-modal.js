jQuery(document).ready(function($){
	$('.services-object-list .colum-category-object .open-popup-btn, .bl-object .colum-category-object .open-popup-btn').click(function (event) {
        event.preventDefault();
        const index = $(this).data('index');
        $(`.pop-up-object[data-index="${index}"]`).addClass('pop-up-object__active')
    });
	$('.pop-up-object .pop-up-object__next__pop').click(function (event) {
        event.preventDefault();
        let index = $(this).data('index') + 1;
        const count = $('.pop-up-object').length;
        const min = $('.pop-up-object').eq(0).data('index');
        const max = $('.pop-up-object').eq(count-1).data('index');
        index = index > max ? min : index; 
        $('.pop-up-object').removeClass('pop-up-object__active')
        $(`.pop-up-object[data-index="${index}"]`).addClass('pop-up-object__active')
    });
	$('.pop-up-object .pop-up-object__prev__pop').click(function (event) {
        event.preventDefault();
        let index = $(this).data('index') - 1;
        let count = $('.pop-up-object').length;
        const min = $('.pop-up-object').eq(0).data('index');
        const max = $('.pop-up-object').eq(count-1).data('index');
        index = index < min ? max : index;
        $('.pop-up-object').removeClass('pop-up-object__active')
        $(`.pop-up-object[data-index="${index}"]`).addClass('pop-up-object__active')
    });
	
	$('.pop-up-object__close__btn').click(()=>{
	    $('.pop-up-object').removeClass('pop-up-object__active')
	})
	$('.pop-up-object__close__label').click(()=>{
	    $('.pop-up-object').removeClass('pop-up-object__active')
	})
	
	let popUpSwiper = new Swiper('.pop-up-object__swiper.swiper', {
        slidesPerView: 1,
        centeredSlides: true,
        autoheight: true,
        allowTouchMove: true,
        spaceBetween: 20,
        //autoHeight: true,
        loop: false,
        navigation: {
                nextEl: '.pop-up-object__btns__container .swiper-button-next',
                prevEl: '.pop-up-object__btns__container .swiper-button-prev',
        },
        breakpoints: {
            650:{
                slidesPerView: 1,
            },
            1040:{
                slidesPerView: 1,
            },
        },
    })
});

