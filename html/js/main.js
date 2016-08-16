jQuery(document).ready(function($){
	new WOW().init(); 
	$('.open-close').on('click', function(e){
		e.preventDefault();
		var $this = $(this);
		$this.parents('.level0').find('.submenu').stop().slideToggle();
		$(this).toggleClass('active')
		return false;
	});
	$('.open-close-1').on('click', function(e){
		e.preventDefault();
		var $this = $(this);
		$this.parents('.level1').find('.submenu1').stop().slideToggle();
		$(this).toggleClass('active')
		return false;
	});
	/* MOBILE */
	$('.mobile-but').on('click', function(e){
		e.preventDefault();
		var $this = $(this);
		$this.parents('#mobile').find('.submenu').stop().slideToggle();
		return false;
	});
	
	$('.has_megamenu').hover(function(){
		var el = $(this).find('.mega_menu');
		$(this).children('a').addClass('triangle');
		el.hide();
		el.stop(true, true).slideDown(200);
	},function(){
		$(this).find('.mega_menu').stop(true,true).delay(150).slideUp(200);
		$(this).children('a').removeClass('triangle');
	});

	$('.main-nav>.has_submenu').hover(function(){
		$(this).children('a').addClass('triangle');   
		$(this).children('ul.submenu').hide();
		$(this).children('ul.submenu').stop(true,true).delay(100).slideDown(300);

	},function(){   
		$(this).children('ul.submenu').stop(true,true).delay(100).slideUp(200);
		$(this).children('a').removeClass('triangle');      
	});

	$('.main-nav .has_submenu>.submenu>.has_submenu').hover(function(){
		$(this).children('ul.child_submenu').hide();
		$(this).children('ul.child_submenu').stop(true,true).delay(100).slideDown(300);

	},function(){   
		$(this).children('ul.child_submenu').stop(true,true).delay(100).slideUp(200);   
	});

	$('.slideshow').hover(    
		function(){   
			$('.slideshow .carousel-control').fadeIn(200);

		}, function(){

			$('.slideshow .carousel-control').fadeOut(200);

		}

	); 

	$('.mini-cart').mouseover(function(){
		if($(window).width() >= 992){
			var el = $(this).find('.cart-content');   
			el.stop(true, true).delay(100).slideDown(200);
		}
		return false;

	}).mouseleave(function(){
		if($(window).width() >= 992){
			var el = $(this).find('.cart-content');
			el.stop(true, true).delay(100).slideUp(200);
		}
		return false;
	});



	$('#wrap-feedback').owlCarousel({
		navigation : false, // Show next and prev buttons
		slideSpeed : 300,
		paginationSpeed : 400,
		singleItem:true
	});
	$('#tab-collection-1').owlCarousel({
		navigation:true,
		navigationText:["<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/prev.png?1450421272243' />","<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/next.png?1450421272243' />"],
		pagination:false,
		slideSpeed : 300,
		paginationSpeed : 400,
		items : 4, //10 items above 1000px browser width
		itemsDesktop : [1000,3], //5 items between 1000px and 901px
		itemsDesktopSmall : [900,2], // betweem 900px and 601px
		itemsTablet: [768,2], //2 items between 600 and 0
		itemsMobile : [540,1] // itemsMobile disabled - inherit from itemsTablet option
	});
	$('#tab-collection-2').owlCarousel({
		navigation:true,
		navigationText:["<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/prev.png?1450421272243' />","<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/next.png?1450421272243' />"],
		pagination:false,
		slideSpeed : 300,
		paginationSpeed : 400,
		items : 4, //10 items above 1000px browser width
		itemsDesktop : [1000,3], //5 items between 1000px and 901px
		itemsDesktopSmall : [900,2], // betweem 900px and 601px
		itemsTablet: [768,2], //2 items between 600 and 0
		itemsMobile : [540,1] // itemsMobile disabled - inherit from itemsTablet option
	});
	$('#tab-collection-3').owlCarousel({
		navigation:true,
		navigationText:["<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/prev.png?1450421272243' />","<img src='//bizweb.dktcdn.net/100/027/105/themes/35105/assets/next.png?1450421272243' />"],
		pagination:false,
		slideSpeed : 300,
		paginationSpeed : 400,
		items : 4, //10 items above 1000px browser width
		itemsDesktop : [1000,3], //5 items between 1000px and 901px
		itemsDesktopSmall : [900,2], // betweem 900px and 601px
		itemsTablet: [768,2], //2 items between 600 and 0
		itemsMobile : [540,1] // itemsMobile disabled - inherit from itemsTablet option
	});
	$('.block-social').owlCarousel({
		navigation:true,
		pagination:false,
		slideSpeed: 400,
		items: 6,
		itemsDesktop: [1000, 4],
		itemsDesktopSmall:[900, 3],
		itemsTablet: [768,2],

	}); 
	$("#featured-product-slider .slider-items").owlCarousel({
		items : 6, //10 items above 1000px browser width
		itemsDesktop : [1024,4], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : true,
		navigationText : ["<a class=\"flex-prev\"></a>","<a class=\"flex-next\"></a>"],
		slideSpeed : 500,
		pagination : false
	});
	$("#featured-product-slider-3 .slider-items").owlCarousel({
		items : 6, //10 items above 1000px browser width
		itemsDesktop : [1024,4], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : true,
		navigationText : ["<a class=\"flex-prev\"></a>","<a class=\"flex-next\"></a>"],
		slideSpeed : 500,
		pagination : false
	});
	$("#featured-product-slider-4 .slider-items").owlCarousel({
		items : 6, //10 items above 1000px browser width
		itemsDesktop : [1024,4], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : true,
		navigationText : ["<a class=\"flex-prev\"></a>","<a class=\"flex-next\"></a>"],
		slideSpeed : 500,
		pagination : false
	});
	$("#featured-product-slider-5 .slider-items").owlCarousel({
		items : 6, //10 items above 1000px browser width
		itemsDesktop : [1024,4], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : true,
		navigationText : ["<a class=\"flex-prev\"></a>","<a class=\"flex-next\"></a>"],
		slideSpeed : 500,
		pagination : false
	});
	$("#featured-product-daitel-slider .slider-items").owlCarousel({
		items : 4, //10 items above 1000px browser width
		itemsDesktop : [1024,4], //5 items between 1024px and 901px
		itemsDesktopSmall : [900,3], // 3 items betweem 900px and 601px
		itemsTablet: [600,2], //2 items between 600 and 0;
		itemsMobile : [320,1],
		navigation : true,
		navigationText : ["<a class=\"flex-prev\"></a>","<a class=\"flex-next\"></a>"],
		slideSpeed : 500,
		pagination : false
	});
	
	$(window).scroll(function () {
		if ($(window).scrollTop() != 0) {
			$('#back-top').fadeIn();

		} else {

			$('#back-top').fadeOut();

		}

	});

	$('#back-top').click(function () {
		$('html, body').animate({ scrollTop: 0 }, 500);

	});

	if ($("#more-view-jcarousel ul").length > 0) {
		$("#more-view-jcarousel ul").jcarousel({
			vertical: true
		}).css("visibility", "visible");


	};
	$(window).scroll(function() {
		if ($(this).scrollTop() > 1){  
			$('header#header').addClass("sticky");
		}
		else{
			$('header#header').removeClass("sticky");
		}
	}); 
	function mobile_menu(){
		$('.toogle-mobile-menu').click(function(){
			if ($('.mobile-nav').is(':hidden'))
			{
				$('.mobile-nav').slideDown('300');
			} else {
				$('.mobile-nav').slideUp('fast');
			}
			return false;
		});
		$(".mobile-nav").accordion({
			accordion:false,
			speed: 300,
			closedSign: '+',
			openedSign: '-'
		});
	};
	AjaxModal();
	mobile_menu();
	heightBanner();
	$(window).resize(heightBanner);
	customer_topbar();
	$(window).resize(customer_topbar);
	slideshow();
	$(window).resize(slideshow);
});
function customer_topbar (){
	if ($(window).width() >= 992 ) {
		$('.customer-topbar').mouseover(function(){
			var el = $(this).find('.customer-links');   
			el.stop(true, true).delay(100).slideDown(200);
		}).mouseleave(function(){
			var el = $(this).find('.customer-links');
			el.stop(true, true).delay(100).slideUp(200);
		});
	} else {
		$('.customer-topbar').click( function(){

			if ($('.customer-links').is(':hidden')){
				$('.customer-links').stop(true,true).delay(100).slideDown(200);
			} else {
				$('.customer-links').stop(true,true).delay(100).slideUp(200); 
			};

		});     
	}
};
function AjaxModal() {
	$(".close-modal, .overlay").click(function() {
		clearTimeout(timeout);
		$(".ajax-success-modal").fadeOut(500)
	});	
};
function slideshow() {
	var heightSlide = $('.slideshow .carousel-inner').height();
	$('.slideshow .carousel-caption').css('height',heightSlide);	 

};
function heightBanner(){
	var height2banner = $('.block-banner .two-banner').height();
	var heightBanner = $('.block-banner .two-banner figure').height();
	var widthBanner = $('.block-banner .two-banner figure').width();
	$('.block-banner .two-banner figure figcaption .image').each(function(){				
		$(this).css("height", heightBanner);
		$(this).css("width",widthBanner);
	});
	$('.block-banner .video iframe').css("height",height2banner - 10);
};
(function($){
	$.fn.extend({ 
		accordion: function(options) {  
			var defaults = {
				accordion: 'true',
				speed: 300,
				closedSign: '[-]',
				openedSign: '[+]'
			};  
			var opts = $.extend(defaults, options); 
			var $this = $(this);  
			$this.find("li").each(function() {
				if($(this).find("ul").size() != 0){
					$(this).find("a:first").after("<em>"+ opts.closedSign +"</em>");  

				}
			}); 
			$this.find("li em").click(function() {
				if($(this).parent().find("ul").size() != 0){
					if(opts.accordion){
						//Do nothing when the list is open
						if(!$(this).parent().find("ul").is(':visible')){
							parents = $(this).parent().parents("ul");
							visible = $this.find("ul:visible");
							visible.each(function(visibleIndex){
								var close = true;
								parents.each(function(parentIndex){
									if(parents[parentIndex] == visible[visibleIndex]){
										close = false;
										return false;
									}
								});
								if(close){
									if($(this).parent().find("ul") != visible[visibleIndex]){
										$(visible[visibleIndex]).slideUp(opts.speed, function(){
											$(this).parent("li").find("em:first").html(opts.closedSign);
										});   
									}
								}
							});
						}
					}
					if($(this).parent().find("ul:first").is(":visible")){
						$(this).parent().find("ul:first").slideUp(opts.speed, function(){
							$(this).parent("li").find("em:first").delay(opts.speed).html(opts.closedSign);
						}); 
					}else{
						$(this).parent().find("ul:first").slideDown(opts.speed, function(){
							$(this).parent("li").find("em:first").delay(opts.speed).html(opts.openedSign);
						});
					}
				}
			});
		}
	});
	
})(jQuery);