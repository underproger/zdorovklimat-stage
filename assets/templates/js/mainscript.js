//open the lateral panel
jQuery(document).ready(function($){
	// Iframe Lazy Load
	const hs = $(window).innerHeight(); //1080
	$(window).scroll(function () {
		var sp = $(this).scrollTop() + hs;

		$('.iframe.lezy').each(function (i, e) {
			if (sp > $(e).offset().top) {
				var html = $(e).html();
				html = html.replace('eframe', 'iframe');
				$(e).html(html).removeClass('lezy');
			}
		})
	});
	// END Iframe Lazy Load
    
	//open the lateral panel
	$('.cd-btn').on('click', function(event){
		event.preventDefault();
		$('.cd-panel').addClass('is-visible');
	});
	//clode the lateral panel
	$('.cd-panel').on('click', function(event){
		if( $(event.target).is('.cd-panel') || $(event.target).is('.cd-panel-close') ) { 
			$('.cd-panel').removeClass('is-visible');
			event.preventDefault();
		}
	});
});

document.addEventListener("DOMContentLoaded",
    function() {
        var div, n,
            v = document.getElementsByClassName("youtube-player");
        for (n = 0; n < v.length; n++) {
            div = document.createElement("div");
            div.setAttribute("data-id", v[n].dataset.id);
            div.innerHTML = labnolThumb(v[n].dataset.id, v[n].dataset.img);
            // div.onclick = labnolIframe;
            div.addEventListener('click', labnolIframe, false);
            v[n].appendChild(div);
        }
    });
    
    
function labnolThumb(id, img) {
    var thumb = `<img src="${img}" width="924" height="550">`,
        play = '<div class="play"></div>';
    return thumb.replace("ID", id) + play;
}

function labnolIframe() {
    var iframe = document.createElement("iframe");
    var embed = "https://www.youtube.com/embed/ID?autoplay=1";
    iframe.setAttribute("src", embed.replace("ID", this.dataset.id));
    iframe.setAttribute("frameborder", "0");
    iframe.setAttribute("allowfullscreen", "1");
    this.parentNode.replaceChild(iframe, this);
}

$('body').on('click', '.youtube-player>div', labnolIframe);