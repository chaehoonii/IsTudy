function pwdSearchCheck(){
	
    var userid = document.getElementById("userid");
    var email = document.getElementById("email");
    
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

    if(email.value==""){
        alert("이메일을 입력하세요.\n");
        email.focus();
        return false;
    }
    
    var regemail = /^\w{2,}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
    
    if(!regemail.test(email.value)){
    	alert("이메일을 다시 입력하세요. 적절하지 않은 이메일 형식 입니다.");
    	email.focus();
    	return false;
    }

    return true;

}
