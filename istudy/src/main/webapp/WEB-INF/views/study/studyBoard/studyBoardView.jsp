<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/studyboard/studyboard.css" type="text/css">
<script>
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
	   		location.href = "/study/studyBoard/studyBoardEdit?board_num="+${vo.board_num};     
	    }
	    return false;
	}
</script>
<div class="studyboard_view_outer">
	<div class="studyboard_view_inner">
		<div class="studyboard_view_top">
			<ul>
				<li>
					<ul id="studyboard_view_title">
						<li>${vo.title}</li>
						<li>작성일&nbsp;: &nbsp;${vo.write_date}</li>
						<li>조회수&nbsp;: &nbsp;${vo.hit}</li>
					</ul>
				</li>
				<li>
					<ul id="studyboard_view_content">
						<li id='studyboard_view__box'>${vo.content}</li>
						
						<li><br/><br/><span id='studyboard_view_profile_span'><img src='/upload/user/${vo.profile_img}' id='studyboard_view_profile' />&nbsp;&nbsp;&nbsp;${vo.user_nick}</span></li>
						<c:if test="${logId == vo.user_id}">
							<li><span class='edit_btn' onclick="BoardEdit()">수정</span>&nbsp;&nbsp;<span class='del_btn' onclick="BoardDel()">삭제</span></li>
						</c:if>
					</ul>						
					
				</li>
			</ul>
		</div>
	</div>	
</div>