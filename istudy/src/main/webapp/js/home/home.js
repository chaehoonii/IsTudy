$(document).ready(function(){
    var owl = $('.owl-carousel');
    
    owl.owlCarousel({
        items:5,                 // 한번에 보여줄 아이템 수
        margin:35,               // 오른쪽 간격
        autoplay:true,           // 자동재생 여부
        autoplayTimeout:1800,    // 재생간격
        autoplayHoverPause:true  //마우스오버시 멈출지 여부
    });    
    
    $('.customNextBtn').click(function() {
        owl.trigger('next.owl.carousel');
    })
    
    $('.customPrevBtn').click(function() {
        owl.trigger('prev.owl.carousel', [300]);
    })
    
//==================스크롤 없애기===============
	var mHtml = $("html");
	var page = 1;
	
	mHtml.animate({scrollTop : 0},10);    
    
	window.addEventListener("wheel", function(e){
	    e.preventDefault();
	},{passive : false});
	
	$(window).on("wheel", function(e) {
	    if(mHtml.is(":animated")) return;
	    if(e.originalEvent.deltaY > 0) {
	        if(page == 3) return;
	        page++;
	    } else if(e.originalEvent.deltaY < 0) {
	        if(page == 1) return;
	        page--;
	    }
	    var posTop =(page-1) * $(window).height();
	    mHtml.animate({scrollTop : posTop});
	})
});