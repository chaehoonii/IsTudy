<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<link rel="stylesheet" href="/css/mypage/viewWrite.css" type="text/css">  
<script src="${url}/js/mypage/mypage.js"></script>

    
    <div id="mypage">
        <div class="profilePage">
            <div class="userProfile">
                <div class="userPhoto">
                	<img src="/upload/user/${logImg}" id="mypage_profile_img" />
                </div>
                <c:if test="${logPermission=='mentor'}">
                	<div class="userNickname">
	                	<img src='${level_icon}' width="40px;" id="icon_hover"/>&nbsp;&nbsp;${nickName} 
	                </div>
                </c:if>
                <c:if test="${logPermission!='mentor'}">
	                <div class="userNickname">
	                	${nickName} 
	                </div>
                </c:if>
                <div id="level_info">
					<ul>
						<li>[ 레벨 ]</li>
						<li>level 1 &nbsp;&nbsp;:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0 ~ 100</li>
						<li>level 2 &nbsp;&nbsp;:&nbsp;&nbsp; 101 ~ 200</li>
						<li>level 3 &nbsp;&nbsp;:&nbsp;&nbsp; 201 ~ 300</li>
						<li>level 4 &nbsp;&nbsp;:&nbsp;&nbsp; 301 ~ </li>
						<li><br/>[ 점수 기준 ]</li>
						<li>게시글</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;+ 3점</li>
						<li>댓글</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;+ 1점</li>
						<li>내댓글 좋아요</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;+ 1점</li>
						<li>내댓글 채택</li>
						<li>&nbsp;&nbsp;&nbsp;&nbsp;+ 5점</li>
					</ul>
				</div>
                <div class="userid">
                	(${id})
                </div>
                <div class="userDesc">
                    <div class="category">
                        <ul>
	                    	<li><a href="${url}/users/mypage/viewWrite<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>">글관리</a></li>
                    	  	<li><a href="${url}/users/mypage/study<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>">스터디관리</a></li>
                          	<li><a href="${url}/users/userEdit">회원 수정</a></li>
	                    </ul>  
                    </div>
                </div>
            </div>
        </div>
        <div class="contentPage">
        	<div class="buttons">
            	<input type="button" id="article_click" onclick="location.href='${url}/users/mypage/viewWrite<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>'" value="작성한 글"/>          	
            	<input type="button" onclick="location.href='${url}/users/mypage/viewComment<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>'" value="댓글단 글"/>
            </div>         
            <div class="contentBox">
            	<div class="title">작성한 글 &nbsp; <span class="numColor">${cntArticle}</span></div>
            	<div class="search">
	            	<input type="text" id="searchText" placeholder="검색"/>
	        	</div>
	        	<div style="clear:both"></div>           	
            	
            	<div class="contents"><hr/>           		
            		<div class="eachContentTitle">
            				<div class="articleInfo">
	            				
	            				<div class="articleTitle">
	            					<a>제목</a>
	            				</div>
	            				<div class="articleCategory">
	            					<span>분류</span>
	            				</div>
	            				<div class="writeDate">
	            					<span>작성일</span>
	            				</div>
	            				<div class="articleDelete">
	            					<span>글 삭제</span>
	            				</div>
	            			</div><hr/>
            		</div>
            		<ul>
            			<c:forEach var="vo" items="${article}">
		            		<li class="eachContent">
		            				<div class="articleInfo">		            				
			            				<div class="articleTitle">
			            					<c:if test="${vo.board_type_num==2}">
			            						<c:if test="${logPermission=='admin'}"><a href="javascript:window.open('${url}/qna/qnaView?board_num=${vo.board_num}','_blank', 'width=1200, height=700, scrollbar=yes')" >${vo.title}</a></c:if>
			            						<c:if test="${logPermission!='admin'}"><a href='${url}/qna/qnaView?board_num=${vo.board_num}'>${vo.title}</a></c:if>			            						
			            					</c:if>
			            					<c:if test="${vo.board_type_num==1}">
			            						<c:if test="${logPermission=='admin'}"><a href='#'>${vo.title}</a></c:if>
			            						<c:if test="${logPermission!='admin'}"><a href='#'>${vo.title}</a></c:if>
			            					</c:if>
			            				</div>
			            				<div class="articleCategory">
			            					<span>${vo.board_type_name}</span>
			            				</div>
			            				<div class="writeDate">
			            					<span>${vo.write_date}</span>
			            				</div>
			            				<div class="articleDelete">
		            						<a href="javascript:BoardDel(${vo.board_num})">삭제하기</a>
		            					</div>
			            			</div><hr/>
		            		</li>
            			</c:forEach>
            		</ul>           		
            	</div>            	 
            </div>            
        </div>
   </div>
   <div style="clear:both"></div>