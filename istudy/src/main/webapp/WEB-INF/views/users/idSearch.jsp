
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
    body::-webkit-scrollbar{
        	display: none;
    }
    .page{
        width: 100%;       
        display: flex;
        min-height: 83vh; 
        align-items: center;
        margin-top:60px;
    }
    .content{
        width:500px;
        margin: 0 auto;
        border: 1px solid rgb(240,240,240);
        height: 430px;
    }
    .content h2{
    	text-align: center;
    	margin-top:30px;
    } 
    .userForm{
        text-align: center;
        width:500px;
        height: 320px;
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
        width: 400px;
        height: 60px;
        border-radius: 5px;
        border: 1px solid #ddd;
        display: inline-block;
        font-size: 16px;
    }
    #username::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/user.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

    #tel::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/phone.png);
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
        width:500px;
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
    .userLink a{
    	color: gray;
    }

</style>
<script>

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


</script>

<div class="page">
        <div class="content">
            <h2>아이디 찾기</h2>  
            <form method="post" action="${url}/users/idSearchOk" class="userForm" onsubmit="return idSearchCheck()">
                <ul>
                    <li><input type="text" placeholder="이름" name="user_name" id="username"></li>
                    <li><input type="text" placeholder="- 를 제외하고 입력하세요" name="tel" id="tel"></li>
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
	<div style="clear: both"></div>