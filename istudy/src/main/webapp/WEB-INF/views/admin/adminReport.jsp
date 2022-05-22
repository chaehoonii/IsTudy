<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>" />

<link rel="stylesheet" href="/css/admin/adminReport.css" type="text/css">
<script src="${url}/js/admin/adminReport.js"></script>
<div class="modal">
	<div class="modal_content">
		<h1 class="modal_header"></h1>
		<br />
		<div class="modal_body"></div>
	</div>
</div>
<div class="adminReportPage">
	<div class="profilePage">
		<div class="userProfile">
			<div class="userPhoto"></div>
			<div class="userNickname">${nickName}</div>
			<div class="userid">(${id})</div>
			<div class="userDesc">
				<div class="category">
					<ul>
						<li><a href="/admin/adminReport">신고관리</a></li>
						<li><a href="/admin/adminUsers">회원관리</a></li>
						<li><a href="/admin/adminData">데이터 랩</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<div class="contentPage">

		<div class="contentBox">
			<div class="title">
				신고 관리 <span class="userCount"> *총 신고수 :${allReportCnt} , 대기:
					${standbyReportCnt} , 확인: ${confirmReportCnt}</span>
			</div>

			<div class="buttons">
				<input type="button"
					class="types <c:if test="${param.confirm == '0'}">button-click</c:if>"
					onclick="location.href='/admin/adminReport?confirm=0'" value="대기" />
				<input type="button"
					class="types <c:if test="${param.confirm == '1'}">button-click</c:if>"
					onclick="location.href='/admin/adminReport?confirm=1'" value="확인" />
			</div>
			<div class="search">
				<form class="search_form" method="get" action="/admin/adminReport">
					<input type="text" id="searchText"
						placeholder="신고분류, 신고자, 신고내용, 신고글, 신고일, 작성자, 처리상태"
						name="searchWord" value="${word}" /> <input type="submit"
						value="검색" />
				</form>
			</div>

			<div class="contents">
				<hr />
				<ul>
					<li class="eachContentTitle">
						<div class="userInfo">
							<div class="checkbox"></div>
							<div class="classify">
								<span>신고 분류</span>
							</div>
							<div class="reporter">
								<span>신고자</span>
							</div>
							<div class="reportContent">
								<span>신고 내용</span>
							</div>
							<div class="reportWriting">
								<span>신고글</span>
							</div>
							<div class="reportTime">
								<span>신고일</span>
							</div>
							<div class="writer">
								<span>작성자</span>
							</div>
							<div class="processStatus">
								<span>처리상태</span>
							</div>
						</div>
						<hr />
					</li>
					<c:forEach var="vo" items="${adminReport}">
						<li <c:if test="${vo.confirm eq '0'}">style="color:red;"</c:if>
							class="eachContent">
							<div class="userInfo">
								<div class="checkbox">
									<input type="checkbox" name="check" class="chk"
										value="${vo.report_num}" />
								</div>
								<div class="classify">
									<c:if test="${vo.report_type_num eq '1'}">
										<span>광고</span>
									</c:if>
									<c:if test="${vo.report_type_num eq '2'}">
										<span>타인 사칭</span>
									</c:if>
									<c:if test="${vo.report_type_num eq '3'}">
										<span>경력 위조</span>
									</c:if>
									<c:if test="${vo.report_type_num eq '4'}">
										<span>욕설/비방</span>
									</c:if>
									<c:if test="${vo.report_type_num eq '5'}">
										<span>불건전한 콘텐츠</span>
									</c:if>
									<c:if test="${vo.report_type_num eq '6'}">
										<span>기타</span>
									</c:if>
								</div>
								<div class="reporter">
									<span>${vo.user_id}</span>
								</div>
								<div class="reportContent">
									<span style="cursor: pointer;" class="modal_content_button">
										<div class="report_num" style="display: none">${vo.report_num }</div>
										${vo.report_content}
									</span>
								</div>
								<div class="reportWriting">
									<span style="cursor: pointer;" class="modal_writing_button">
										<div class="board_num" style="display: none">${vo.board_num }</div>
										${vo.report_writing }
									</span>
								</div>
								<div class="reportTime">
									<span>${vo.report_time}</span>
								</div>
								<div class="writer">
									<span>${vo.writer }</span>
								</div>
								<div class="processStatus">
									<span> <c:if test="${vo.confirm eq '0'}">대기</c:if> <c:if
											test="${vo.confirm eq '1'}">확인</c:if>
									</span>
								</div>
							</div>
							<hr />
						</li>
					</c:forEach>
				</ul>
				<!--  board_num, user_id, report_content, report_time, report_type_num, confirm  -->
			</div>
			            <div class="pagingContainer">
               <ul class="pagination justify-content-center" id="paging">
                  <c:if test="${pvo.pageNum==1}">
                     <li class="page-item disabled"><a class="page-link"
                        id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
                  </c:if>
                  <c:if test="${pvo.pageNum>1}">
                     <li class="page-item"><a class="page-link"
                        href="/admin/adminReport?<c:if test='${param.confirm=="0"}'>confirm=0&</c:if>
                             <c:if test='${param.confirm=="1"}'>confirm=1&</c:if>
                             <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum-1}"
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
                                 href="/admin/adminReport?<c:if test='${param.confirm=="0"}'>confirm=0&</c:if>
                                         <c:if test='${param.confirm=="1"}'>confirm=1&</c:if>
                                         <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${p}">${p}</a></li>
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
                        href="/admin/adminReport?<c:if test='${param.confirm=="0"}'>confirm=0&</c:if>
                             <c:if test='${param.confirm=="1"}'>confirm=1&</c:if>
                             <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum+1}"
                        id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
                  </c:if>
               </ul>
            </div>
			<div class="choose">
				<input type="button" class="ok" value="확인" /> 
				<input type="button" class="admindelete" value="탈퇴" />
			</div>
		</div>
	</div>
</div>