
	function idSearchCheck(){

	    var username = document.getElementById("username");
	    var tel = document.getElementById("tel");
	    
	    if(username.value==""){
	        alert("이름을 입력하세요\n");
	        username.focus();
	        return false;
	    }
	
	    if(tel.value==""){
	        alert("전화번호를 입력하세요.\n - 를 제외하고 입력하세요");
	        tel.focus();
	        return false;
	    }
	
	    let regtel = /^(010|011|016|019|02|031|032|041|051)[0-9]{3,4}[0-9]{4}$/;
	    
	    if(!regtel.test(tel.value)){
	        alert("전화번호를 잘못 입력하셨습니다.\n - 를 제외하고 입력하세요\n");
	        tel.focus();
	        return false;
	    }
	
	    return true;
	}