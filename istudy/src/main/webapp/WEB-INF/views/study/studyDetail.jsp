<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 상세 페이지</title>

<link rel="stylesheet" href="/css/studyhome/studydetail.css" type="text/css" />
<script src="/js/studyhome/studydetail.js"></script>

<script>
//스터디 신청 리스트
function applyList(){
	var study_num=${study_num};
	var param = {"study_num" : study_num};
	var url = '/study/applyList';
	$.ajax({
		data:param,
		url:url,
		type:'GET',
		dataType:'json',
		success:function(data){
			var tag = "";
			for(var i=0; i<data.length; i++){
				tag += "<div class='qna_back03_reply'>";
				//reply top
				//프로필, 날짜
				tag += "<div class='reply_top'>";
				tag += "<div class='qna_profile_reply' style='display:inline-block;'><img src='/upload/user/"+data[i].profile_img+"' id='qna_profile'/>&emsp;";
				tag += data[i].user_nick;
				tag += "</div>"; //qna_profile_reply
				//채택버튼
				if(data[i].want_ok == 'T'){ //답변채택된 글일때
					tag += "<div class='reply_date' style='display:inline-block;'><span class='is_selected_01'><span class='is_selected_02'>&nbsp;✔&nbsp;</span>승인 완료</span>&emsp;&emsp;";
				}else{ //답변채택되지 않은 글일때
					if('${logId}'== data[i].host_id){ //로그인아이디가 작성자일때 > 채택
						tag += "<span id='select_btn' onclick='SelectReply("+data[i].want_num+")'>수락</span>&emsp;&emsp;";
					}else{
						tag += "<span>&nbsp;&nbsp;&nbsp;</span>&emsp;&emsp;";
					}
				}
				tag += "</div><hr/>";	//reply_top
				
				tag += "&emsp;&emsp;<div class='reply_content'>"+data[i].want_coment;
				
				//수정삭제
				if('${logId}'== data[i].user_id){
					tag += "<div id='reply_btns'><input type='hidden' value='"+data[i].want_num+"'/><span class='reply_edit edit_btns'>수정</span>&nbsp;&nbsp;<span class='reply_del del_btns' onclick='ReplyDel("+data[i].want_num+")'>삭제</span></div>";
				}
				tag += "</div></div>";	
			}
			$(".study_apply").html(tag);	
			
			//댓글 등록=========================================================================================
			$("#addReplybtn").off("click").on("click",function(){
				if($("#reply_coment").val().trim() ==''){
					alert("댓글 내용을 입력해주세요.");
					$("#reply_coment").focus();
					return false;
				}else{
					if(confirm('댓글을 등록하시겠습니까?')){
						var param = $('#replyWriteForm').serialize();
						var url = '/study/applyWrite';
						console.log(param);
						$.ajax({
							data:param,
							url:url,
							type:'POST',
							success:function(r){
								console.log(r);
								applyList();
								$("#reply_coment").val("");
							},
							error:function(error){
						        alert("error:"+error);
						    }
						})
					}
					return false;
				}
			})
			//댓글 수정폼=========================================================================================
			$(".reply_edit").click(function(){
				var want_num = $(this).prev().val();
				var param = {"want_num":want_num};
				console.log("want_num="+want_num);
				$.ajax({
					url:'/study/applyEdit',
					data:param,
					type:'GET',
					context: this,
					success:function(r){
						console.log("success");
						var tag01 = "";
						tag01 += "<form method='post' id='replyEditForm'>";
						tag01 += "<input type='hidden' name='reply_num' value='"+r.want_num+"'/>";
						//tag01 += "<input type='hidden' name='board_num' value='"+r.board_num+"'/>";
						tag01 += "<ul class='reply_write_ul'>";
						tag01 += "<li><textarea name='reply_coment' class='graySquare' id='reply_coment'>"+r.want_coment+"</textarea></li>";
						tag01 += "<li><input type='button' value='댓글 수정' id='replyEditbtn' /></li>";
						tag01 += "</ul></form>";
						
						$(this).parent().parent().parent().html(tag01);
							
						//댓글 수정=========================================================================================
						$("#replyEditbtn").click(function(){
							var param = $("#replyEditForm").serialize();
							$.ajax({
								url:'/study/applyEditOk',
								data:param,
								type:'POST',
								success:function(){
									applyList();
								}
							})
						})
					},
					error:function(error){
						alert("error:"+error);
					}
				})
			})
		}
	})//ajax
}//qnaReplyList
applyList();
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