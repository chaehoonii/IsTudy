	$(function(){
    		   
    		   $("#searchText").keyup(function(){
    			   
    			   var val = $(this).val();
    			   
    			   if(val==""){
    				   $(".eachContent").show();
    				   
    			   }else{			   
    				   $(".eachContent").hide();
    				   $(".eachContent:contains('"+val+"')").show();			   
    			   } 			   
    		   })		   
    	   }); 
    	   
    	   
    function ReplyDel(reply_num){
    		 if(confirm("댓글을 삭제하시겠습니까?")){
    			 location.href = '/board/replyDel?reply_num='+reply_num;
    		 }
    		 return false;
    	 } 
    	 
     function BoardDel(board_num){
    	     if(confirm("글을 삭제하시겠습니까?")){
    	          location.href = "/board/boardDelete?board_num="+board_num;
    	        }
    	     return false;
    	}
   $(document).ready(function(){
	    $("#icon_hover").hover(function(){
			$("#level_info").css("display","block");
		}, function(){
			$("#level_info").css("display","none");
		})
	}) 	