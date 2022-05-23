<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<link rel="stylesheet" href="/css/admin/adminUsers.css" type="text/css">  
<script src="${url}/js/admin/adminUsers.js"></script>
    
    <div class="adminUserPage">
        <div class="profilePage">
            <div class="userProfile">
                <div class="userPhoto">
                </div>
                <div class="userNickname">
                	${nickName} 
                </div>
                <div class="userid">
                	(${id})
                </div>
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
            		회원 목록 
            		<c:set var="total" value="${userCnt + mentorCnt + adminCnt }" />
            		<span class="userCount"> *전체 회원 :${total} , 일반: ${userCnt} , 멘토: ${mentorCnt} , 관리자: ${adminCnt} </span>
            	</div>
            	
            	<div class="buttons">
	            	<input type="button" class="types <c:if test="${param.permission=='user' && param.want!='T'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=user'" value="일반"/>
	            	<input type="button" class="types <c:if test="${param.permission=='mentor'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=mentor'" value="멘토"/>
	            	<input type="button" class="types <c:if test="${param.permission=='user' && param.want=='T'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=user&want=T'" value="멘토 신청"/>
	            </div>
	            <div class="search">
		            <form  class="search_form" method="get" action="/admin/adminUsers">
		            	<input type="text" id="searchText" placeholder="아이디, 이름, 닉네임, 연락처, 가입일, URL" name="searchWord" value="${word}"/>
		            	<input type="submit" value="검색"/>
		            </form>
            	</div>
            	<form class="contents" method="post"><hr/>
            		<ul>
            		<li class="eachContentTitle">
            				<div class="userInfo">	     
            					<div class="checkbox">
            					
            					</div>       				
	            				<div class="nicknames">
	            					<span>닉네임</span>
	            				</div>
	            				<div class="id">
	            					<span>아이디</span>
	            				</div>
	            				<div class="name">
	            					<span>이름</span>
	            				</div>
	            				<div class="tel">
	            					<span>연락처</span>
	            				</div>
	            				<div class="email">
	            					<span>이메일</span>
	            				</div>
	            				<div class="registerDate">
	            					<span>가입일</span>
	            				</div>
	            				<div class="classify">
	            					<span>분류</span>
	            				</div>
	            				<div class="apply">
	            					<span>멘토 신청</span>
	            				</div>
	            				<div class="career">
	            					<span>경력 사항</span>
	            				</div>
	            				<div class="careerURL">
	            					<span>URL</span>
	            				</div>
	            			</div><hr/>
            		</li>
            			<c:forEach var="vo" items="${users}">
		            		<li class="eachContent" <c:if test="${vo.permission eq 'user' && vo.want eq 'T'}">style="color:blue;"</c:if>>
		            				<div class="userInfo">	  
		            					<div class="checkbox">
			            					<c:choose>
					            					<c:when test="${vo.permission eq 'user' && vo.want eq 'T'}">
					            						<input type="checkbox" name="userList" value="${vo.user_id}" class="check"/>
					            					</c:when>
					            					<c:otherwise>
					            						<input type="checkbox" disabled /> 
					            					</c:otherwise>
				            				</c:choose>
            							</div>    
		            					<div class="nicknames">
			            					<a href="javascript:window.open('/users/mypage/study?user_id=${vo.user_id}&admin=True','_blank', 'width=1200, height=700, scrollbar=yes')" <c:if test="${vo.permission eq 'user' && vo.want eq 'T'}">style="color:blue;"</c:if>>${vo.user_nick}</a>
			            				</div>
			            				<div class="id">
			            					<a href="javascript:window.open('/users/mypage/study?user_id=${vo.user_id}&admin=True','_blank', 'width=1200, height=700, scrollbar=yes')" <c:if test="${vo.permission eq 'user' && vo.want eq 'T'}">style="color:blue;"</c:if>>${vo.user_id}</a>
			            				</div>
			            				<div class="name">
			            					<span>${vo.user_name}</span>
			            				</div>
			            				<div class="tel">
			            					<span>${vo.tel}</span>
			            				</div>
			            				<div class="email">
			            					<span>${vo.email}</span>
			            				</div>
			            				<div class="registerDate">
			            					<span>${vo.register_date}</span>
			            				</div>
			            				<div class="classify">
			            					<c:if test="${vo.permission eq 'user'}">
			            						<span>일반</span>
			            					</c:if>
			            					<c:if test="${vo.permission eq 'mentor'}">
			            						<span>멘토</span>
			            					</c:if>
			            					<c:if test="${vo.permission eq 'admin'}">
			            						<span>관리자</span>
			            					</c:if>
			            				</div>
			            				<div class="apply">
			            					<c:choose>
				            					<c:when test="${vo.permission eq 'user' && vo.want eq 'T'}">
				            						<span>O</span> 
				            					</c:when>
				            					<c:otherwise>
				            						<span>-</span> 
				            					</c:otherwise>
			            					</c:choose>
			            				</div>
			            				<div class="career">
			            					<span>${vo.career_year}</span>
			            				</div>
			            				<div class="careerURL">
			            					<c:if test="${vo.career!=null}">
			            						<a href="${vo.career}">${vo.career}</a>
			            					</c:if>
			            					<c:if test="${vo.career==null}">
			            						<span>-</span>
			            					</c:if>
			            				</div>    							            				
			            		</div><hr/>
		            		</li>
            			</c:forEach>
            		</ul>        		
            	</form>
		        <div class="pagingContainer">
			        <ul class="pagination justify-content-center" id="paging">
			            <c:if test="${pvo.pageNum==1}">
			                <li class="page-item disabled"><a class="page-link"
			                    id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			            </c:if>
			            <c:if test="${pvo.pageNum>1}">
			                <li class="page-item"><a class="page-link"
			                    href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                    <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
			                    <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum-1}" id="prevBtn"><i
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
			                                href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                                <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
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
			                    href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                    <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
			                    <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum+1}" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
			            </c:if>
			        </ul>
			    </div>
		        <div class="choose">
		        	<input type="button" id="approve" value="승인"/>
	            	<input type="button" id="sendBack" value="반려"/>
		        </div>
            </div>  
        </div>
   </div>
   <div style="clear:both"></div>

