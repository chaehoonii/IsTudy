document.addEventListener('DOMContentLoaded', function(){
    document.querySelector(".menuBtn").addEventListener("click", function(e){
        if ( document.querySelector('.menuWrap').classList.contains('on') ){
            //메뉴닫힘
            document.querySelector('.menuWrap').classList.remove('on');
            document.querySelector('.menuBtn i').classList.remove('fa-times')
            document.querySelector('.menuBtn i').classList.add('fa-bars');
        } else {
            //메뉴펼침
            document.querySelector('.menuWrap').classList.add('on');
            document.querySelector('.menuBtn i').classList.remove('fa-bars');
            document.querySelector('.menuBtn i').classList.add('fa-times');
        }
    });
});