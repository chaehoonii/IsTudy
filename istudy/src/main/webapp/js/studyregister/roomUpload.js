$(".r_button").click(function(){
				if(confirm('글을 등록하시겠습니까?')){
					$("#register_content").submit();
				}
				return false;

});