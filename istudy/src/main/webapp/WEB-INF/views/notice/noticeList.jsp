<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">
<script src="/js/notice/noticeList.js"></script>
<div class="noticeContainer">
	<h1 class="noticeTitle">공지사항</h1>
	<div class="noticeBoard">
		<ul class="noticeListTop">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			<c:forEach var="vo" items="${noticeList}">
				<ul class="noticeList">
					<li>${vo.board_num}</li>
					<li><a class="noticeModal" href="/notice/noticeList?board_num=${vo.board_num}" data-toggle="modal"
						data-target="#noticeModal">${vo.title}</a></li>
					<li>${vo.write_date}</li>
					<li>${vo.hit}</li>
				</ul>
			</c:forEach>
			<div class="modal" id="noticeModal">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h3 class="modal-title">${vo.title}</h3>
						</div>
						<div class="modal-body">${vo.content}</div>
						<div class="modal-footer">
							<button type="button" class="btn" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>
		</ul>
	</div>
	<!-- <div class="paging">
		<ul>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div> -->
</div>