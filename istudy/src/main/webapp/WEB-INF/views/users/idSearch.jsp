
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<title>아이디 찾기</title>
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
        font-size: 18px;
    }
    #username::-webkit-input-placeholder{
        background-image: url(${url}/images/user.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

    #tel::-webkit-input-placeholder{
        background-image: url(${url}/images/phone.png);
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

	function idSearchCheck(){
		
	    var username = document.getElementById("username");
	    var tel = document.getElementById("tel");
	    
	    console.log(userid.value);
	
	    if(username.value==""){
	        alert("이름을 입력하세요\n");
	        username.focus();
	        return false;
	    }
	
	    if(tel.value==""){
	        alert("전화번호를 입력하세요.\n - 을 붙여서 입력하세요");
	        tel.focus();
	        return false;
	    }
	
	    var regtel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
	    
	    if(!regtel.test(tel.value)){
	        alert("전화번호를 잘못 입력하셨습니다.\n전화번호는 - 를 포함해야 합니다\n");
	        tel.focus();
	        return false;
	    }
	
	    return true;
	
	}


</script>

	<div class="page">
        <div class="logo">

        </div>
        <div class="content">
            <div class="title">아이디 찾기</div>
            <form method="post" action="${url}/users/idSearchOk" class="userForm" onsubmit="return idSearchCheck()">
                <ul>
                    <li><input type="text" placeholder="이름" name="user_name" id="username"></li>
                    <li><input type="text" placeholder="예시) 010-0000-0000" name="tel" id="tel"></li>
                    <li><input type="submit" value="아이디 찾기" class="submitButton"></li>
                </ul>
            </form>
            <div class="userLink">
                <ul>
                    <li><a href="${url}/users/login">로그인</a></li>
                    <li><a href="${url}/users/pwdSearch">비밀번호 찾기</a></li>
                    <li><a href="${url}/users/userForm">회원가입</a></li>
                </ul>
            </div>
        </div>
    </div>
