<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaList.css" type="text/css" />

<div id='qna_back'>
	<div id='qna_list'>
		<h1>Q & A</h1>
		<br/><br/>
		<span class='gray_border'>&nbsp;${totalQna} 개의 질문&nbsp;</span>
		<hr/>
		<c:forEach var="vo" items="${qnaList}">
			<ul class='qna_ul'>
				<li><span class='gray_border'>&nbsp;Q&nbsp;</span>&nbsp;&nbsp;&nbsp;${vo.title}</li>

				<li><c:forEach var="lang_list" items="${vo.lang_list}">
						<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
					</c:forEach> 
					<c:forEach var="tag_list" items="${vo.tag_list}">
						<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
					</c:forEach></li>
			</ul>
			<ul class='qna_ul2'>
				<li style="font-size:14px">&nbsp;<span class='gray_border'>&nbsp;A&nbsp;</span>&nbsp;&nbsp;&nbsp;${vo.count_reply}</li>
				<li><img src='/upload/user/${vo.profile_img}' id='qna_profile' />&nbsp;&nbsp;${vo.user_nick}</li>
			</ul>
				<hr/>
		</c:forEach>
	</div>
</div>