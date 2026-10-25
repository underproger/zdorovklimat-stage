jQuery(document).ready(function($){
	let popUpSwiper = new Swiper('.services-object-list__swiper.swiper', {
        slidesPerView: 1,
        centeredSlides: true,
        autoheight: true,
        allowTouchMove: true,
        spaceBetween: 20,
        //autoHeight: true,
        loop: false,
        navigation: {
                nextEl: '.services-object-list__btns__container .swiper-button-next',
                prevEl: '.services-object-list__btns__container .swiper-button-prev',
        },
        breakpoints: {
            650:{
                slidesPerView: 2,
                centeredSlides: false,
            },
            1040:{
                slidesPerView: 2,
                centeredSlides: false,
            },
        },
    })
});

