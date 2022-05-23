<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/studyboard/studyboardList.css" type="text/css" />

<div class='studyboard_back'>
	<div id='studyboard_list'>
		<h1 id='studyboard_logo' onclick="location.href='/study/studyboard/studyboardList'">스터디 게시판</h1>		
		<br/><br/><br/><br/>
		<div id='studyboard_top01'><span class='white_border'>&nbsp;(&nbsp;${total_study_board}&nbsp;) 개의 글&nbsp;</span></div>
		<div id='studyboard_top02' onclick="location.href='/study/studyboard/studyboardWrite?study_num=${study_num}'"><span class='gray_box'>&nbsp;글쓰기&nbsp;</span></div>
		<hr/>
		<c:forEach var="vo" items="${studyboardList}">
			<ul class='studyboard_ul' onclick="location.href='/study/studyboard/studyboardView?board_num=${vo.board_num}'">
				<li><span class='gray_border'>&nbsp;Q&nbsp;</span>&nbsp;&nbsp;
					&nbsp;&nbsp;${vo.title}
				</li>
			</ul>
			<ul class='studyboard_ul2'>
				<li>&nbsp;<span class='gray_border'>&nbsp;A&nbsp;</span>&nbsp;&nbsp;&nbsp;${vo.count_reply}</li>
				<li><img src='/upload/user/${vo.profile_img}' id='studyboard_profile' />&nbsp;&nbsp;&nbsp;&nbsp;${vo.user_nick}-</li>
			</ul>
				<hr/>
		</c:forEach>
	</div>
	<div class="pagingContainer">
		<ul class="pagination justify-content-center" id="paging">
			<c:if test="${pvo.pageNum==1}">
				<li class="page-item disabled"><a class="page-link"
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum>1}">
				<li class="page-item"><a class="page-link"
					href="/study/studyboard/studyboardList?pageNum=${pvo.pageNum-1}" 
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
				<c:if test="${p<=pvo.totalPage}">
					<c:choose>
						<c:when test="${p==pvo.pageNum}">
							<li class="page-item disabled"><a class="page-link">${p}</a></li>
						</c:when>
						<c:when test="${p!=pvo.pageNum}">
							<li class="page-item"><a class="page-link"
								href="/study/studyboard/studyboardList?pageNum=${p}">${p}</a></li>
						</c:when>
					</c:choose>
				</c:if>
			</c:forEach>
			<c:if test="${pvo.pageNum==pvo.totalPage}">
				<li class="page-item disabled"><a class="page-link"
					id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum<pvo.totalPage}">
				<li class="page-item"><a class="page-link"
					href="/study/studyboard/studyboardList?pageNum=${pvo.pageNum+1}" id="nextBtn"><i
						class="fa fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div> 
</div>

