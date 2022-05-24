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
                
                //신청버튼
                if(data[i].want_ok == 'T'){ //신청확정된 댓글일때
                    if('${logId}'== data[i].host_id){ //로그인아이디가 작성자일때 > 채택취소
                        tag += "<span class='select_btn' onclick='SelectApplyDel("+data[i].want_num+")'><img src='/images/study_info/check.png'></span>";
                    }else{
                        tag += "<span class='select_btn' ><img src='/images/study_info/check.png'></span>";
                    }
                }else{ //신청확정되지 않은 글일때
                    if('${logId}'== data[i].host_id){ //로그인아이디가 작성자일때 > 채택
                        tag += "<span class='select_btn' onclick='SelectApply("+data[i].want_num+")'><img src='/images/study_info/agree.png'></span>";
                    }else{
                        tag += "<span>&nbsp;&nbsp;&nbsp;</span>&emsp;&emsp;";
                    }
                }
                tag += "</div><hr/>";    //reply_top
                tag += "<div class='reply_content'><span id='reply_comment'>"+data[i].want_coment+"</span>";
                //수정삭제
                if('${logId}'== data[i].user_id){
                    tag += "<span id='reply_btns'><input type='hidden' value='"+data[i].want_num+"'/><span class='reply_edit edit_btns'>수정</span>&nbsp;&nbsp;<span class='reply_del del_btns' onclick='ApplyDel("+data[i].want_num+")'>삭제</span></div>";
                }
                tag += "</div></div>";    
            }
			$(".apply_div").html(tag);	
			
			//댓글 등록=========================================================================================
			$("#addReplybtn").off("click").on("click",function(){
				if($("#want_coment").val().trim() ==''){
					alert("댓글 내용을 입력해주세요.");
					$("#want_coment").focus();
					return false;
				}else{
					if(confirm('댓글을 등록하시겠습니까?')){
						var param = $('#applyWriteForm').serialize();
						var url = '/study/applyWrite';
						console.log(param);
						$.ajax({
							data:param,
							url:url,
							type:'POST',
							success:function(r){
								console.log(r);
								applyList();
								$("#want_coment").val("");
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
						tag01 += "<input type='hidden' name='want_num' value='"+r.want_num+"'/>";
						tag01 += "<div class='reply_write_ul'>";
						tag01 += "<textarea name='want_coment' id='want_coment'>"+r.want_coment+"</textarea>";
						tag01 += "&emsp;&emsp;<input type='button' value='댓글 수정' id='replyEditbtn' />";
						tag01 += "</div></form>";
						
						$(this).parent().parent().parent().html(tag01);
							
						//댓글 수정=========================================================================================
						$("#replyEditbtn").click(function(){
							var param = $("#replyEditForm").serialize();
							$.ajax({
								url:'/study/applyEditOk',
								data:param,
								type:'POST',
								success:function(r){
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
		//답변 채택===================================================================================================
			   function SelectApply(want_num){
			      if(confirm('신청을 수락하시겠습니까?')){
			         var param05 = {"want_num":want_num};
			         $.ajax({
			            url:'/study/applySelect',
			            data:param05,
			            type:'POST',
			            success:function(){
			               applyList();
			            }
			         })
			      }
			   }
			   //답변 채택 취소===================================================================================================
			   function SelectApplyDel(want_num){
			      if(confirm('스터디원을 강퇴하시겠습니까?')){
			         var param06 = {"want_num":want_num};
			         $.ajax({
			            url:'/study/applySelectDel',
			            data:param06,
			            type:'POST',
			            success:function(){
			               applyList();
			            }
			         })
			      }
			   }
			 //댓글 삭제===================================================================================================
			   function ApplyDel(want_num){
			      if(confirm('신청을 삭제하시겠습니까?')){
			         var param04 = {"want_num":want_num};
			         $.ajax({
			            url:'/study/applyDel',
			            data:param04,
			            type:'GET',
			            success:function(){
			            	applyList();
			            }
			         })
			      }
			   }
</script>
<img src='/images/back02.png' id="back_btn" onclick="location.href='/study/study_home'"/>
<div id="contents">
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
						<span class="dnick">[스터디장]&emsp;${vo.user_nick}
                        <c:if test="${vo.permission=='mentor'}">
                            &nbsp;<img id="level-icon" src='${vo.level_icon}' style='width:30px; margin:0;display:inline;'></span><br/>
                        </c:if>
                        <c:if test="${vo.permission=='user'}">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if></span><br/>
						<img class="dimg" src="/upload/user/${vo.profile_img}" class="img img-thumbnail"><br/>
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
			<c:if test="${logStatus=='Y'}">
				<div class='study_apply'>
		            <form method='post' id='applyWriteForm'>
						<input type='hidden' name='study_num' id='study_num_box' value='${study_num}'/>
						<span><input type="text" name="want_coment" class="graySquare" id="want_coment"/></span>&emsp;
						<span><input type='button' value='신청 등록' id="addReplybtn" /></span>
					</form>
				</div>
			</c:if>	
			<c:if test="${logStatus!='Y'}">
				<div class='comment_back03'>
					<ul class='comment_back02'>
						<li>로그인 후 신청 등록이 가능합니다.</li>
<!-- 					</ul> -->
				</div>
			</c:if>
			<div class='apply_div'>
			</div>
		</div>
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