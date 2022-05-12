<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />


<title>비밀번호 찾기</title>
<style>
	@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
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
    body * {
    	font-family: "NanumSquare";
    	transform: skew(-0.03deg);
    }
    h2{
    	font-weight: bold;
    }
    .page{
        width: 100%;       
        display: flex;
        min-height: 85vh; 
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
    #userid::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/user.png);
        background-size: contain;
        background-position: 2px;
        background-repeat: no-repeat;
        text-indent: 2em;
    }

    #email::-webkit-input-placeholder{
        background-image: url(${url}/images/login_icon/email.png);
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
        font-size: 14px;
        
    }
    .userLink a{
    	color: gray;
    }

</style>
<script>

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

</script>

<div class="page">
        <div class="content">
            <h2>비밀번호 찾기</h2>  
            <form method="post" action="${url}/users/pwdSearchOk" class="userForm" onsubmit="return pwdSearchCheck()">
                <ul>
                    <li><input type="text" placeholder="아이디" name="user_id" id="userid"></li>
                    <li><input type="text" placeholder="이메일" name="email" id="email"></li>
                    <li><input type="submit" value="비밀번호 찾기" class="submitButton"></li>
                </ul>
            </form>
            <div class="userLink">
                <ul>
                    <li><a href="${url}/users/login">로그인</a></li>
                    <li><a href="${url}/users/idSearch">아이디 찾기</a></li>
                    <li><a href="${url}/users/userForm">회원가입</a></li>
                </ul>
            </div>

        </div>

    </div>
	<div style="clear: both"></div>