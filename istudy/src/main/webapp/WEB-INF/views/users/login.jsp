
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>


<style>
    a{
        text-decoration: none;
        color: black;
    }
    a:hover{
        color: gray;
    }
    body, ul, li{
        margin: 0;
        padding: 0;
        list-style-type: none;
    }
    .page{
        width: 100%;
        margin-bottom: 300px;
    }
    .logo{
        margin-top:300px;
    }
    .content{
        width:600px;
        margin: 0 auto;
        
    }
    .title{
        margin-bottom: 10px;
        font-size:18px;
    }
    .userForm{
        text-align: center;
        width:600px;
        height: 320px;
        border: 1px solid black;
        margin: 0 auto;
        justify-content: center;
        position: relative;
        border-radius: 3px;
    }
    .userForm ul{
        position: relative;
        text-align: center;
        top: 50%;
        left: 50%;
        transform: translate(-50%,-50%); 
    }
    .userForm li input{
        width: 300px;
        height: 60px;
        border-radius: 5px;
        border: 1px solid #ddd;
        display: inline-block;
        font-size: 16px;
    }
    #userid::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/user.png); 
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }
    #userpw::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/password.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }
    .submitButton{
        margin-top: 30px;
        background-color: rgb(230, 223, 215);
    }
    .userLink{
        width:600px;
        text-align: center;
    }
    .userLink ul{
        text-align: center;
        margin-top: 15px;
    }
    .userLink li{
        float: left;
        width: 33.3%;
        font-size: 16px;
    }

</style>
<script>

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
</script>

<div class="page">
        <div class="logo">

        </div>
        <div class="content">
            <div class="title">로그인</div>
            
            <form method="post" action="${url}/users/loginOk" class="userForm" onsubmit="return loginCheck()">
                <ul>
                    <li><input type="text" placeholder="아이디" name="user_id" id="userid"></li>
                    <li><input type="password" placeholder="비밀번호" name="user_pw" id="userpw"></li>
                    <li><input type="submit" value="로그인" class="submitButton"></li>
                </ul>
            </form>
            <div class="userLink">
                <ul>
                    <li><a href="${url}/users/idSearch">아이디 찾기</a></li>
                    <li><a href="${url}/users/pwdSearch">비밀번호 찾기</a></li>
                    <li><a href="${url}/users/userForm">회원가입</a></li>
                </ul>
            </div>

        </div>

    </div>
