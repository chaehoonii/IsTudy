
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="/css/users/loginIdPassword.css" type="text/css">  
<script src="/js/users/idSearch.js"></script>
<title>아이디 찾기</title>

<style>
	#username::-webkit-input-placeholder{
        background-image: url(/images/login_icon/user.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

    #tel::-webkit-input-placeholder{
        background-image: url(/images/login_icon/phone.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

</style>

<div class="page">
        <div class="content">
        <h2>아이디 찾기</h2>  
            <form method="post" action="/users/idSearchOk" class="userForm" onsubmit="return idSearchCheck()">
                <ul>
                    <li><input type="text" placeholder="이름" name="user_name" id="username"></li>
                    <li><input type="text" placeholder="- 를 제외하고 입력하세요" name="tel" id="tel"></li>
                    <li><input type="submit" value="아이디 찾기" class="submitButton"></li>
                </ul>
            </form>
            <div class="userLink">
                <ul>
                    <li><a href="/users/login">로그인</a></li>
                    <li><a href="/users/pwdSearch">비밀번호 찾기</a></li>
                    <li><a href="/users/userForm">회원가입</a></li>
                </ul>
            </div>
        </div>
    	
    </div>
	<div style="clear: both"></div>