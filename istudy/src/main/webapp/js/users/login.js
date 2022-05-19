function loginCheck(){
		
	    var userid = document.getElementById("userid");
	    var userpw = document.getElementById("userpw");
	
	    if(userid.value==""){
	        alert("아이디를 입력하세요\n아이디는 6~16자리입니다.");
	        userid.focus();
	        return false;
	    }
	    
	    var regid = /^[a-zA-Z0-9]{6,16}$/;
	    
	    if(!regid.test(userid.value)){
	    	alert("아이디는 6~16자리 영문 또는 숫자입니다.");
	        userid.focus();
	        return false;
	    }
	
	    if(userpw.value==""){
	        alert("비밀번호를 입력하세요.\n비밀번호는 8자리 이상입니다.");
	        userpw.focus();
	        return false;
	    }
	
	    var regpw = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/;
	    
	    if(!regpw.test(userpw.value)){
	        alert("비밀번호를 잘못 입력하셨습니다.\n비밀번호는 영문 숫자 조합 8자리 이상입니다.\n");
	        userpw.focus();
	        return false;
	    }
	
	    return true;
	}