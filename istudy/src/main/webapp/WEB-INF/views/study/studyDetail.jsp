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
<img src='/images/back02.png' id="back_btn" onclick="location.href='/study/study_home'"/>
<div id="contents">
	<form id="frm">
		<div class="detail_grid">
			<div class=detailstudy>
				<span class="dname">${vo.study_name}</span>
				<span class="dlike"></span><hr/>
				<span class="dcontent">${vo.study_rule}</span><br/>
				<hr/>
				<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
					<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
				</c:forEach> 
				<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
					<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
				</c:forEach>
			</div>
			<div class="participant">
				<div class="dmemeber">
					<c:forEach var="studyuser" items="${studyuser}">
						<span class="dnick">[스터디장]&emsp;${studyuser.user_nick}</span><br/>
						<img class="dimg" src="/upload/user/${studyuser.profile_img}" class="img img-thumbnail"><br/>
					</c:forEach>
					<hr/>
					<div class="peopleIcon">
						<span>참여멤버</span>&emsp;
						<c:forEach var ="i" begin="${1}" end="${vo.in_people}">
							<img src='/images/study_info/person_1.png' class='person_img'/>
						</c:forEach>
						<c:forEach var ="i" begin="${1}" end="${vo.remain}">
							<img src='/images/study_info/person_0.png' class='person_img'/>
						</c:forEach>
					</div>
				</div>	
				<hr/>
				<div class="dmax_droom">
					<div id="droom">
						<input type="button" id="roombtn" onclick="location.href='http://localhost:8060/study/studyRoom?study_num=${study_num}';" value="스터디 룸 입장">
					</div>
				</div>
			</div>
		</div>
		<div class="sdetailuser">
            <span class="tid">ID</span>
            <span>신청글</span><br/>
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