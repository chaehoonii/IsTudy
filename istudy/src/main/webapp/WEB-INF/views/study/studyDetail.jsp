<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 상세 페이지</title>

<link rel="stylesheet" href="/css/studyhome/studydetail.css" type="text/css" />
<link rel="stylesheet" href="/js/study/studydetail.js" type="text/js" />

<script>
function likeDetail(){
	var pathname = decodeURIComponent(location.href);
	var study_num = pathname.substring( pathname.indexOf('=')+1);
	var param = {"study_num" : ${study_num}};
	console.log(param);
	var url = '/study/likeDetail';
	$.ajax({
		data:param,
		url:url,
		type:'GET',
		dataType:'json',
		success:function(data){
			var tag="";
			//좋아요
			if(data.like_type == 0){
					tag += "&emsp;&emsp;<span class='like_span' onclick='LikeUp("+data.study_num+")'><img src='/images/like_0_sky.png' class='qna_like' />&nbsp;"+data.like_num+"</span>";
			}else{
					tag += "&emsp;&emsp;<span class='like_span' onclick='LikeDown("+data.study_num+")'><img src='/images/like_1_sky.png' class='qna_like' />&nbsp;"+data.like_num+"</span>";
			}
			console.log(tag);
			console.log(data.like_type);
			$(".dlike").html(tag);
			
		}
})	
}
$(document).ready(function(){
	
	likeDetail();
	console.log("라이크");
	
})
</script>

<div id="contents">
	<form id="frm">
		<img class="simg" src="/images/study_info/${vo.study_img}" class="img img-thumbnail"><br/>
		<div class="detail_grid">
			<div class=detailstudy>
				<span class="dlike"></span>
				<span class="dname">${vo.study_name}<br/></span><hr/>
				<span class="dcontent">${vo.study_rule}</span><br/>
				<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
					<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
				</c:forEach> 
				<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
					<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
				</c:forEach>
			</div>
			<div class="participant">
				참여멤버<br/><hr/>
				<div class="dmemeber">
					<c:forEach var="studyuser" items="${studyuser}">
						<img class="dimg" src="/upload/user/${studyuser.profile_img}" class="img img-thumbnail"><br/>
						<span class="dnick">${studyuser.user_nick}</span><br/>
					</c:forEach>
				</div>	
				<div class="dmax_droom">
					<span class="dmax">${vo.in_people}/${vo.max}</span>
					<div id="droom">
						<input type="button" id="roombtn" onclick="location.href='http://localhost:8060/study/studyRoom?study_num=${study_num}';" value="스터디 룸 입장">
					</div>
				</div>
			</div>
		</div>
		
		<div class="sdetailuser">
			<span class="tid">ID</span>	
			<span>신청글</span><br/>	
			<c:forEach var="vo" items="${studyuser}">
				<span class="duser">${vo.user_nick}</span>
				<span class="dcoment">${vo.want_coment}</span>
				<input type="button" class="editdelete" value="수정" >		
				<input type="button" class="editdelete" value="삭제" ><br/>
			</c:forEach>
			<span class="dapply">
				<c:if test="${vo.want_ok=='T'}">
					O
				</c:if>		
				<c:if test="${vo.want_ok=='T'}">
					<input type="button" value="X" >	
				</c:if>
			</span>
			<c:if test="${logStatus=='Y'}">
			<div class='study_apply'>
				<form method='post' id='studyapplyWrite'>
					<input type='hidden' name='study_num' id='study_num_box' value='${vo.study_num}'/>
						<span><input type="text" name="apply_comment" class="graySquare" id="apply_comment"/></span>&emsp;
						<span><input type='button' value='신청 등록' id="addReplybtn" /></span>
				</form>
			</div>
			</c:if>	
			<div id='apply_div'>
			</div>
			<c:if test="${logStatus!='Y'}">
				<div class='comment_back03'>
					<ul class='comment_back02'>
						<li>로그인 후 신청 등록이 가능합니다.</li>
					</ul>
				</div>
			</c:if>
		</div>
	</form>
</div>
<!-- 스터디 목록 버튼 -->
<div id="slist_page">
	<input type="button" id="listbtn" onclick="location.href='http://localhost:8060/study/study_home';" value="스터디 목록">
</div>
<div style="clear:both"></div>

<script>
//댓글 좋아요===================================================================================================
function LikeUp(study_num){
	var param02 = {"study_num":study_num};
	console.log(study_num);
	$.ajax({
		url:'/study/likeUp',
		data:param02,
		type:'POST',
		success:function(){
			likeDetail();
		}
	});
}
//댓글 좋아요 취소===================================================================================================
function LikeDown(study_num){
	var param03 = {"study_num":study_num};
	console.log(study_num);
	$.ajax({
		url:'/study/likeDown',
		data:param03,
		type:'GET',
		success:function(){
			likeDetail();
		}
	})
}
</script>