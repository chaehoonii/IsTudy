
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>
<link rel="stylesheet" href="/css/users/loginIdPassword.css" type="text/css">  
<script src="${url}/js/users/login.js"></script>


<style>

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

</style>

<div class="page">
        <div class="content">
            <h2>로그인</h2>  
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
    <div style="clear: both"></div>
