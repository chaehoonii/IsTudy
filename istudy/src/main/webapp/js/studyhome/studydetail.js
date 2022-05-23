/**
 * 
 */
//스터디 신청 리스트
function qnaReplyList(){
	var pathname = decodeURIComponent(location.href);
	var board_num = pathname.substring( pathname.indexOf('=')+1);
	var param = {"study_num" : study_num};
	var url = '/board/replyList';
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
				if('${logPermission}'=='mentor'){
					tag += "&nbsp;<img src='"+data[i].level_icon+"'style='width:20px; margin-right:10px;'/>"
				}
				tag += "</div>"; //qna_profile_reply
				//채택버튼
				if(data[i].selected == 1){ //답변채택된 글일때
					if('${logId}'== data[i].writer_id){	//로그인아이디가 작성자일때 > 채택취소
							tag += "<div class='reply_date' style='display:inline-block;'><span class='is_selected_01'><span class='is_selected_02' onclick='SelectReplyDel("+data[i].reply_num+")'>&nbsp;✔&nbsp;</span>채택됨</span>&emsp;&emsp;";
					}else{ //로그인아이디가 작성자 아닐때
							tag += "<div class='reply_date' style='display:inline-block;'><span class='is_selected_01'><span class='is_selected_02'>&nbsp;✔&nbsp;</span>채택됨</span>&emsp;&emsp;";
					}
				}else{ //답변채택되지 않은 글일때
					if('${logId}'== data[i].writer_id && data[i].solved == 0){ //로그인아이디가 작성자일때 > 채택
						tag += "<div class='reply_date' style='display:inline-block;'><span id='select_btn' onclick='SelectReply("+data[i].reply_num+")'>채택하기</span>&emsp;&emsp;";
					}else{
						tag += "<div class='reply_date' style='display:inline-block;'><span>&nbsp;&nbsp;&nbsp;</span>&emsp;&emsp;";
					}
				}
				tag += ""+data[i].reply_date+"</div></div><hr/>";	//reply_top
				
				//reply bottom
				//댓글 내용, 좋아요
				tag += "<div class='reply_bottom'>";
				if(data[i].like_type == 0){
					tag += "&emsp;&emsp;<span class='like_span' onclick='LikeUp("+data[i].reply_num+")'><img src='/images/like_0_sky.png' class='qna_like' />&nbsp;"+data[i].like_num+"</span>";
				}else{
					tag += "&emsp;&emsp;<span class='like_span' onclick='LikeDown("+data[i].reply_num+")'><img src='/images/like_1_sky.png' class='qna_like' />&nbsp;"+data[i].like_num+"</span>";
				}
				tag += "&emsp;&emsp;<div class='reply_content'>"+data[i].reply_coment;
				
				//수정삭제
				if('${logId}'== data[i].user_id){
					tag += "<div id='reply_btns'><input type='hidden' value='"+data[i].reply_num+"'/><span class='reply_edit edit_btns'>수정</span>&nbsp;&nbsp;<span class='reply_del del_btns' onclick='ReplyDel("+data[i].reply_num+")'>삭제</span></div>";
				}
				tag += "</div></div>";	
			}
			$("#reply_div").html(tag);	
		}
	})//ajax
}//qnaReplyList