<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaView.css" type="text/css">
<script>
		//댓글 리스트
		function qnaReplyList(){
			var pathname = decodeURIComponent(location.href);
			var board_num = pathname.substring( pathname.indexOf('=')+1);
			var param = {"board_num" : board_num};
			var url = '/board/replyList';
			$.ajax({
				data:param,
				url:url,
				type:'GET',
				dataType:'json',
				success:function(data){
					var tag = "";
					for(var i=0; i<data.length; i++){
						tag += "<div class='qna_back02'>";
						tag += "<ul class='reply_ul'>";
						if(data[i].like_type == 0){
							tag += "<li><span class='like_span' onclick='LikeUp("+data[i].reply_num+")'><img src='/images/like_0_sky.png' class='qna_like' />&nbsp;"+data[i].like_num+"</span></li>";
						}else{
							tag += "<li><span class='like_span' onclick='LikeDown("+data[i].reply_num+")'><img src='/images/like_1_sky.png' class='qna_like' />&nbsp;"+data[i].like_num+"</span></li>";
						}
						if(data[i].selected == 1){ //답변채택된 글일때
							if('${logId}'== data[i].writer_id){	//로그인아이디가 작성자일때 > 채택취소
								tag += "<li><span class='is_selected_01'><span class='is_selected_02' onclick='SelectReplyDel("+data[i].reply_num+")'>&nbsp;✔&nbsp;</span>채택됨</span></li>";
							}else{ //로그인아이디가 작성자 아닐때
								tag += "<li><span class='is_selected_01'><span class='is_selected_02'>&nbsp;✔&nbsp;</span>채택됨</span></li>";
							}
						}else{ //답변채택되지 않은 글일때
							if('${logId}'== data[i].writer_id && data[i].solved == 0){ //로그인아이디가 작성자일때 > 채택
								tag += "<li><span id='select_btn' onclick='SelectReply("+data[i].reply_num+")'>채택하기</span></li>";
							}else{
								tag += "<li><span>&nbsp;&nbsp;&nbsp;</span></li>";
							}
						}
						tag += "<li>"+data[i].reply_coment+"</li>";
						tag += "<li><span id='qna_profile_span'>";
						tag += "<img src='/upload/user/"+data[i].profile_img+"' id='qna_profile' />";
						tag += data[i].user_nick;
						if('${logPermission}'=='mentor'){
							tag += "<img src='"+data[i].level_icon+"' style='width:20px; margin-right:10px;'/>"
						}
						tag += "</span></li>";
						tag += "<li>"+data[i].reply_date+"</li>";
						if('${logId}'== data[i].user_id){
							tag += "<li><input type='hidden' value='"+data[i].reply_num+"'/><span class='reply_edit edit_btns'>수정</span>&nbsp;&nbsp;<span class='reply_del del_btns' onclick='ReplyDel("+data[i].reply_num+")'>삭제</span></li>";
						}
						tag += "</ul></div>";	
					}
					$("#reply_div").html(tag);
					
					//댓글 등록=========================================================================================
					$("#addReplybtn").off("click").on("click",function(){
						
						if($("#reply_coment").val().trim() ==''){
							alert("댓글 내용을 입력해주세요.");
							$("#reply_coment").focus();
							return false;
						}else{
							if(confirm('댓글을 등록하시겠습니까?')){
								var param = $('#replyWriteForm').serialize();
								var url = '/board/replyWrite';
								console.log(param);
								$.ajax({
									data:param,
									url:url,
									type:'POST',
									success:function(r){
										console.log(r);
										qnaReplyList();
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
						var reply_num = $(this).prev().val();
						var param = {"reply_num":reply_num};
						console.log("reply_num="+reply_num);
						$.ajax({
							url:'/board/replyEdit',
							data:param,
							type:'GET',
							context: this,
							success:function(r){
								console.log("success");
								var tag01 = "";
								tag01 += "<form method='post' id='replyEditForm'>";
								tag01 += "<input type='hidden' name='reply_num' value='"+r.reply_num+"'/>";
								tag01 += "<input type='hidden' name='board_num' value='"+r.board_num+"'/>";
								tag01 += "<ul class='reply_write_ul'>";
								tag01 += "<li><textarea name='reply_coment' class='graySquare' id='reply_coment'>"+r.reply_coment+"</textarea></li>";
								tag01 += "<li><input type='button' value='댓글 수정' id='replyEditbtn' /></li>";
								tag01 += "</ul></form>";
								
								$(this).parent().parent().parent().html(tag01);
								
								//댓글 수정=========================================================================================
								$("#replyEditbtn").click(function(){
									var param = $("#replyEditForm").serialize();
									$.ajax({
										url:'/board/replyEditOk',
										data:param,
										type:'POST',
										success:function(){
											qnaReplyList();
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
		
	// 게시글 삭제===================================================================================================
	function BoardDel(){
		if(confirm("글을 삭제하시겠습니까?")){
	   		location.href = "/board/boardDelete?board_num="+${vo.board_num};     
	    }
	    return false;
	}
	// 게시글 수정폼으로 이동================================================================================================
	function BoardEdit(){
		if(confirm("글을 수정하시겠습니까?")){
	   		location.href = "/qna/qnaEdit?board_num="+${vo.board_num};     
	    }
	    return false;
	}
	//댓글 좋아요===================================================================================================
	function LikeUp(reply_num){
		var param02 = {"reply_num":reply_num};
		console.log(reply_num);
		$.ajax({
			url:'/qna/likeUp',
			data:param02,
			type:'POST',
			success:function(){
				qnaReplyList();
			}
		});
	}
	//댓글 좋아요 취소===================================================================================================
	function LikeDown(reply_num){
		var param03 = {"reply_num":reply_num};
		console.log(reply_num);
		$.ajax({
			url:'/qna/likeDown',
			data:param03,
			type:'GET',
			success:function(){
				qnaReplyList();
			}
		})
	}
	//댓글 삭제===================================================================================================
	function ReplyDel(reply_num){
		if(confirm('댓글을 삭제하시겠습니까?')){
			var param04 = {"reply_num":reply_num};
			$.ajax({
				url:'/board/replyDel',
				data:param04,
				type:'GET',
				success:function(){
					qnaReplyList();
				}
			})
		}
	}
	//답변 채택===================================================================================================
	function SelectReply(reply_num){
		if(confirm('답변을 채택하시겠습니까?')){
			var param05 = {"reply_num":reply_num};
			$.ajax({
				url:'/qna/replySelect',
				data:param05,
				type:'POST',
				success:function(){
					qnaReplyList();
				}
			})
		}
	}
	//답변 채택 취소===================================================================================================
	function SelectReplyDel(reply_num){
		if(confirm('답변채택을 취소하시겠습니까?')){
			var param06 = {"reply_num":reply_num};
			$.ajax({
				url:'/qna/replySelectDel',
				data:param06,
				type:'POST',
				success:function(){
					qnaReplyList();
				}
			})
		}
	}
	
	//댓글 리스트 불러오기
	qnaReplyList();
</script>

<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<ul>
				<li>
					<ul id="qna_title">
						<li>${vo.title}</li>
						<li>작성일&nbsp;: &nbsp;${vo.write_date}</li>
						<li>조회수&nbsp;: &nbsp;${vo.hit}</li>
					</ul>
				</li>
				<li>
					<ul id="qna_content">
						<li id='content_box'>${vo.content}</li>
						<li class='nocenter'>
							<br/><br/>
							<c:forEach var="lang_list" items="${vo.lang_list}">
								<span class="lang_list">${lang_list}</span>&nbsp;&nbsp;
							</c:forEach> 
							<c:forEach var="tag_list" items="${vo.tag_list}">
								<span class="tag_list">${tag_list}</span>&nbsp;&nbsp;
							</c:forEach>
						</li>
						<li><br/><br/><span id='qna_profile_span'><img src='/upload/user/${vo.profile_img}' id='qna_profile' />&nbsp;&nbsp;&nbsp;${vo.user_nick}</span></li>
						<c:if test="${logId == vo.user_id}">
							<li><span class='edit_btns' onclick="BoardEdit()">수정</span>&nbsp;&nbsp;<span class='del_btns' onclick="BoardDel()">삭제</span></li>
						</c:if>
					</ul>						
					
				</li>
			</ul>
		</div>
		<div id='reply_div'>
		</div>
		<c:if test="${logStatus=='Y'}">
			<div class='qna_back02'>
				<form method='post' id='replyWriteForm'>
					<input type='hidden' name='board_num' id='board_num_box' value='${vo.board_num}'/>
					<ul class='reply_write_ul'>
						<li><textarea name="reply_coment" class="graySquare" id="reply_coment"></textarea></li>
						<li><input type='button' value='댓글 등록' id="addReplybtn" /></li>
					</ul>
				</form>
			</div>
		</c:if>	
		<c:if test="${logStatus!='Y'}">
			<div class='qna_back02'>
					<ul class='reply_ul02'>
						<li>로그인 후 댓글 등록이 가능합니다.</li>
					</ul>
			</div>
		</c:if>
	</div>
</div>