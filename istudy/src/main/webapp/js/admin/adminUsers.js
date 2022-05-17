$(function(){
	   $("#approve").click(function(){
			  
		   var cntApp = 0
		   
		   $(".check").each(function(i, chk){
			   
			   if(chk.checked){
				   cntApp++;
			   }			   
		   });		   
		   if(cntApp<=0){
			   alert("승인할 회원을 선택 후 승인 버튼을 누르세요.");
			   return false;
		   }		   
		   if(confirm("해당 회원을 멘토로 승인하시겠습니까?")){
			   
			  $(".contents").attr("action","/admin/approveUser");
			  
			  $(".contents").submit();			   
		   }		   			   
	   });
	   
	   $("#sendBack").click(function(){
		   
		   var cntSend = 0
		   
		   $(".check").each(function(i, chk){			   
			   if(chk.checked){
				   cntSend++;
			   }			   
		   });
		   
		   if(cntSend<=0){
			   alert("반려할 회원을 선택 후 반려 버튼을 누르세요.");
			   return false;
		   }		   
		   if(confirm("해당 일반 회원의 멘토 신청을 반려하시겠습니까?")){
			   
				  $(".contents").attr("action","/admin/sendBackUser");
				  
				  $(".contents").submit();				   
			}  
	   })
	   
	   $(".types").click(function(){
		   
		   var button = document.querySelectorAll(".types");
		   
		   for(var i=0; i<button.length; i++){
			   button[i].classList.remove("button-click");
		   }
		   
		   this.classList.add('button-click');
		   
	   });

   }); 