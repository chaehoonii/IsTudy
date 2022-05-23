<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<link rel="stylesheet" href="/css/users/loginIdPassword.css" type="text/css"> 

<script src="/js/users/pwdSearch.js"></script>

<title>비밀번호 찾기</title>

<style>

	#userid::-webkit-input-placeholder{
        background-image: url(/images/login_icon/user.png); 
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

	#email::-webkit-input-placeholder{
        background-image: url(/images/login_icon/email.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }
</style>

<div class="page">
        <div class="content">
            <h2>비밀번호 찾기</h2>  
            <form method="post" action="/users/pwdSearchOk" class="userForm" onsubmit="return pwdSearchCheck()">
                <ul>
                    <li><input type="text" placeholder="아이디" name="user_id" id="userid"></li>
                    <li><input type="text" placeholder="이메일" name="email" id="email"></li>
                    <li><input type="submit" value="비밀번호 찾기" class="submitButton"></li>
                </ul>
            </form>
            <div class="userLink">
                <ul>
                    <li><a href="/users/login">로그인</a></li>
                    <li><a href="/users/idSearch">아이디 찾기</a></li>
                    <li><a href="/users/userForm">회원가입</a></li>
                </ul>
            </div>

        </div>

    </div>
	<div style="clear: both"></div>