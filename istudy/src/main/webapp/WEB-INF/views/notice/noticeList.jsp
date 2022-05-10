<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">
<script src="/js/notice/noticeList.js"></script>
<div class="noticeContainer">
	<h1 class="noticeTitle">공지사항</h1>
	<div class="noticeBoard">
		<ul class="noticeList">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			<c:forEach var="vo" items="${noticeList}">
				<li>${vo.board_num}</li>
				<li>${vo.title}</li>
				<li>${vo.write_date}</li>
				<li>${vo.hit}</li>
			</c:forEach> 
		</ul>
	</div>
</div>