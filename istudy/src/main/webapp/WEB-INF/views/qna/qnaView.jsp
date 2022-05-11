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
			//$("#board_num_box").val(board_num);
			var url = '/qna/qnaReplyList';
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
						if(data[i].selected == 1){
							tag += "<li><span class='is_selected'>&nbsp;✔&nbsp;</span>채택됨</li>";
						}else{
							if('${logId}'== data[i].writer_id){
								tag += "<li><span style='border:1px solid #bbb; padding:5px;'>채택하기</span></li>";
							}else{
								tag += "<li><span>&nbsp;&nbsp;&nbsp;</span></li>";
							}
						}
						if(!data[i].selected_id != '' && data[i].selected_id != null){
							tag += "<li>@ "+data[i].selected_id+"<br/>"+data[i].reply_coment+"</li>";
						}else{
							tag += "<li>"+data[i].reply_coment+"</li>";
						}
						tag += "<li><span id='qna_profile_span'><img src='/upload/user/"+data[i].profile_img+"' id='qna_profile' />&nbsp;&nbsp;&nbsp;"+data[i].user_nick+"</span></li>";
						tag += "<li>"+data[i].reply_date+"</li>";
						if('${logId}'== data[i].user_id){
							tag += "<li><input type='hidden' value='"+data[i].reply_num+"'/><span id='reply_edit'>수정</span>&nbsp;&nbsp;<span id='reply_del' onclick='ReplyDel("+data[i].reply_num+")'>삭제</span></li>";
						}
						tag += "</ul></div>";	
					}
					console.log('${logStatus}');
					$("#reply_div").html(tag);
					
					//댓글 등록
					$("#addReplybtn").off("click").on("click",function(){
						
						if($("#reply_coment").val().trim() ==''){
							alert("댓글 내용을 입력해주세요.");
							$("#reply_coment").focus();
							return false;
						}else{
							if(confirm('댓글을 등록하시겠습니까?')){
								var param = $('#replyWriteForm').serialize();
								var url = '/qna/qnaReplyWrite';
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
				}
			})//ajax
		}//qnaReplyList
		
		
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
	//댓글 삭제
	function ReplyDel(reply_num){
		if(confirm('댓글을 삭제하시겠습니까?')){
			var param04 = {"reply_num":reply_num};
			$.ajax({
				url:'/qna/replyDel',
				data:param04,
				type:'GET',
				success:function(){
					qnaReplyList();
				}
			})
		}
	}
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
						<li>${vo.content}</li>
						<li>
							<c:if test="${vo.file1 != null && vo.file1 != ''}">
								<img src='/upload/qna/${vo.file1}' class='qna_img'/>
							</c:if>
							<c:if test="${vo.file2 != null && vo.file2 != ''}">
								<img src='/upload/qna/${vo.file2}' class='qna_img'/>
							</c:if>
							<c:if test="${vo.file3 != null && vo.file3 != ''}">
								<img src='/upload/qna/${vo.file3}' class='qna_img'/>
							</c:if>
							<c:if test="${vo.file4 != null && vo.file4 != ''}">
								<img src='/upload/qna/${vo.file4}' class='qna_img'/>
							</c:if>
							<c:if test="${vo.file5 != null && vo.file5 != ''}">
								<img src='/upload/qna/${vo.file5}' class='qna_img'/>
							</c:if>
						</li>
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