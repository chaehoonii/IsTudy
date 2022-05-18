<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/notice/noticeList.css" type="text/css">
<script src="/js/notice/noticeList.js"></script>
<div class="noticeContainer">
	<h1 class="noticeTitle">공지사항</h1>
	<c:if test="${logPermission=='admin'}">
		<button class="noticeBtn btn" onclick="window.location.href='/admin/notice/noticeWrite'">공지사항 등록</button>
		<br/>
	</c:if>
	<br />
	<div class="noticeBoard">
		<ul class="noticeListTop">
			<li>번호</li>
			<li>제목</li>
			<li>날짜</li>
			<li>조회수</li>
			<c:forEach var="vo" items="${noticeList}">
				<ul class="noticeList">
					<li>${vo.board_num}</li>
					<li data-toggle="modal" data-target="#noticeModal">${vo.title}</li>
					<li>${vo.write_date}</li>
					<li>${vo.hit}</li>
				</ul>
				<!-- 모달창 -->
				<div class="modal" id="noticeModal">
					<div class="modal-dialog">
						<div class="modal-content">
							<!-- 모달 헤더 -->
							<div class="modal-header">
								<h3 class="modal-title" id="modalTitle"></h3>
							</div>
							<!-- 모달 바디 -->
							<div class="modal-body" id="modalContent"></div>
								<div class="noticeBottonArea">
									<c:if test="${logPermission=='admin'}">
										<button class="noticeModalBtn btn" id="modalNoticeEdit" >공지사항 수정</button>
                                        &nbsp;&nbsp;&nbsp;
                                        <button class="noticeModalBtn btn" id="modalNoticeDel">공지사항 삭제</button>
									</c:if>
								</div>
							<!-- 모달 푸터 -->
							<div class="modal-footer">
								<button type="button" class="btn modalclose"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</ul>
	</div>
	<div class="pagingContainer">
		<ul class="pagination justify-content-center" id="paging">
			<c:if test="${pvo.pageNum==1}">
				<li class="page-item disabled"><a class="page-link"
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum>1}">
				<li class="page-item"><a class="page-link"
					href="/notice/noticeList?pageNum=${pvo.pageNum-1}" id="prevBtn"><i
						class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
				<c:if test="${p<=pvo.totalPage}">
					<c:choose>
						<c:when test="${p==pvo.pageNum}">
							<li class="page-item disabled"><a class="page-link">${p}</a></li>
						</c:when>
						<c:when test="${p!=pvo.pageNum}">
							<li class="page-item"><a class="page-link"
								href="/notice/noticeList?pageNum=${p}">${p}</a></li>
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
					href="/notice/noticeList?pageNum=${pvo.pageNum+1}" id="nextBtn"><i
						class="fa fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
</div>
<script src="/js/notice/noticeList.js"></script>