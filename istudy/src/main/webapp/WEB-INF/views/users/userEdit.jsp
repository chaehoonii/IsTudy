<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${url}/css/users/userEdit.css" type="text/css">
<script src="${url}/js/users/userEdit.js"></script>
<script>
function userDel() {
   if(confirm("정말로 탈퇴하시겠습니까?")) {
      location.href="${url}/users/userDel";
   }
}
</script>
<title>UserForm</title>

</head>


<body>
   <div class="wrap">
      <div class="userForm_wrap">
         <h2 style="text-align: center; margin: 100px 0px 40px; font-size: 35px;">회원정보 수정</h2>
         <form method="post" action="/users/userEditOk"  onsubmit='return editCheck()' enctype="multipart/form-data">
            <div id="user_img_wrap">
               
               <span id="img_upload_phr">Click here!</span> <img src="${vo.profile_img}" id="user_img" />
            </div>
            <input type="file" name="user_img" id="profile_img" style="display:none"/>
            
            
            <fieldset>
               <legend>로그인 정보</legend>
               <div id="user_notice">* 표시는 필수 입력 사항입니다.</div>
               <ul>
                  <li>아이디</li>
                  <li><input type="text" id="idchk" value='Y' style="display: none; width: 30px; margin: 0px;"> 
                  <input type="text" id="idchk" value='N' style="display: none; width: 30px; margin: 0px;"> 
                  <input type="text" name="user_id" id="user_id" value="${vo.user_id }"  maxlength=16 readonly/>
                     <div id='chk'></div></li>
                  <li>비밀번호</li>
                  <li><input type="password" name="user_pw" id="user_pw" placeholder="* 8자리 이상"  value="${vo.user_pw }"/>
                     <div id='pwdChk'></div></li>
                  <li>비밀번호 확인</li>
                  <li><input type="password" name="pwd2" id="pwd2" placeholder="* 비밀번호 재입력"  value="${vo.user_pw }"/>
                     <div id='pwd2Chk'></div></li>
                  <li>이름</li>
                  <li><input type="text" name="user_name" id="user_name" placeholder="* 홍길동"  value="${vo.user_name }"/></li>
                  <li>닉네임</li>
                  <li><input type="text" name="user_nick" id="user_nick" placeholder="* 호부호형"  value="${vo.user_nick }"/></li>
                  <li>이메일</li>
                  <li><input type="text" name="email" id="email" placeholder="* hong123@naver.com"  value="${vo.email }"/></li>
                  <li>연락처</li>
                  <li><input type="text" name="tel" id="tel" placeholder="* 숫자만 입력해주세요"  value="${vo.tel }"/>
                     <div id='telChk'></div></li>
                  <li>분류</li>
                  <li>
                     <ul id="radio_list">
                        <li><input type="radio" name="permission" id="study_type1" value="1" />일반</li>
                        <li><input type="radio" name="permission" id="study_type2" value="2" />멘토</li>
                        <li>
                           <ul style="display: none" id="career_list">
                              <select type="hidden" name="career" id="career">
                                 <option value="">경력</option>
                                 <option value="">1~3년</option>
                                 <option value="">4~6년</option>
                                 <option value="">7~9년</option>
                                 <option value="">10년이상</option>
                              </select>
                           </ul>
                        </li>
                     </ul>
                  </li>
                  <li class="career_url"><input type="text" name="career" id="career_url" placeholder="경력을 증명할 수 있는 URL을 입력해주세요 (ex..github/blog)" /></li>

                  <li>관심분야</li>
                  <li>
                     <ul id="radio_list">
                        <li><input type="radio" name="study_type_num" id="study_type_num_frontend" value="1" />프론트엔드</li>
                        <li><input type="radio" name="study_type_num" id="study_type_num_backend" value="2" />백엔드</li>
                        <li><input type="radio" name="study_type_num" id="study_type_num_algorithm" value="3" />알고리즘</li>
                        <li><input type="radio" name="study_type_num" id="study_type_num_project" value="4" />프로젝트</li>
                        <li><input type="radio" name="study_type_num" id="study_type_num_eng" value="5" />IT영어</li>
                     </ul>
                  </li>
               </ul>
            </fieldset>
            <div class="submit_button_wrap">
               <input type="submit" value="수 정 하 기" style="margin-left: 3px; margin-right: 5px; margin-top: 0" />
               <input type="button" value="탈 퇴 하 기" style="margin-left: 5px; margin-right: 3px;" onclick='userDel()'/>
            </div>
         </form>
      </div>
   </div>
</body>
</html>