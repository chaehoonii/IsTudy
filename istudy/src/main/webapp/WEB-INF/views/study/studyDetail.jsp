<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 상세 페이지</title>

<link rel="stylesheet" href="/css/studyhome/studydetail.css" type="text/css" />

<script>
//리뷰등록
$("#frm").submit(function(param, value){
		data= $("#frm").serialize();
		$.ajax({
			type: 'POST',
			url: 'study/study_home',
			data:params,
			success: function(value){
				$("#content").val("");
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	}
});
//리뷰 목록
function ajaxSend(param, value) {
	data=$(#'frm').serialize()
	alert(data)
	$.ajax({
		type: 'POST',
		url: "${vo.study_num}",
		data: "${vo.study_num}",
		success: function(value) {
			$("#commentList").html(tag);
		},
		error: function(e) {
			console.log(e.responseText);
		}
	});
}
</script>

<div id="contents">
	<form id="frm">
		<img class="simg" src="/images/study_info/${vo.study_img}" class="img img-thumbnail"><br/>
		<div class=detailstudy>
			<span class="dname">${vo.study_name}<br/></span>
			<span class="dcontent">${vo.study_rule}</span><br/>
			<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
				<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
			</c:forEach> 
			<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
				<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
			</c:forEach>
		</div>
		<div class="participant">
			참여멤버<br/>
			<img class="dimg" src="/images/study_info/${vo.profile_img}"><br/>
			<span class="dhost">${vo.host_id}</span><br/>
			<span class="dmax">${vo.in_people}/${vo.max}</span>
			<div id="sroom_page">
				<input type="button" id="roombtn" onclick="location.href='http://localhost:8060/study/study_home';" value="스터디 룸 입장">
			</div>
		</div>
		<div class="sdetailuser">
			<span class="tid">ID</span>	
			<span>신청글</span><br/>	
			<c:forEach var="vo" items="${studyuser}">
				<span class="duser">${vo.user_id}</span>
				<span class="dcoment">${vo.want_coment}</span><br/>		
				<input type="button" value="수정" >		
				<input type="button" value="삭제" >		
			</c:forEach>
			<span class="dapply">
				<c:if test="${vo.want_ok=='T'}">
					<input type="button" value="O" >
				</c:if>		
				<c:if test="${vo.want_ok=='T'}">
					<input type="button" value="X" >	
				</c:if>
			</span>
			<div id="type_comment">
				<textarea name="content" id="content" placeholder="내용을 작성해 주세요."></textarea>
				<input type="submit" id="commentbtn"value="리뷰등록"/>
			</div>
			<div id="commentList">
			</div>
		</div>
	</form>
</div>
<!-- 스터디 목록 버튼 -->
<div id="slist_page">
	<input type="button" id="listbtn" onclick="location.href='http://localhost:8060/study/study_home';" value="스터디 목록">
</div>
<div style="clear:both"></div>