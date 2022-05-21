<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/mypage/viewComment.css" type="text/css">  
<script src="${url}/js/mypage/mypage.js"></script>
    
    <div id="mypage">
        <div class="profilePage">
            <div class="userProfile">
                <div class="userPhoto">
                	<img src="/upload/user/${logImg}" id="mypage_profile_img" />
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
            	<input type="button"  onclick="location.href='${url}/users/mypage/viewWrite<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>'" value="작성한 글"/>          	
            	<input type="button" id="comment_click" onclick="location.href='${url}/users/mypage/viewComment<c:if test="${logPermission=='admin'}">&user_id=${id}&admin=True</c:if>'" value="댓글단 글"/>
            </div>
            
          
            <div class="contentBox">
            	<div class="title">댓글단 글 &nbsp; <span class="numColor">${cntComment}</span></div>
            	<div class="search">
	            	<input type="text" id="searchText" placeholder="검색"/>
	        	</div>   
	        	<div style="clear:both"></div> 
            	
            	<div class="contents"><hr/>           		
            		<div class="eachContentTitle">
            				<div class="articleInfo">
	            				<div class="commentTitle">
	            					<a>제목</a>
	            				</div>
	            				<div class="comment">
	            					<span>댓글</span>
	            				</div>
	            				<div class="commentCategory">
	            					<span>분류</span>
	            				</div>
	            				<div class="commentDate">
	            					<span>작성일</span>
	            				</div>
	            				<div class="commentDelete">
	            					<span>댓글 삭제</span>
	            				</div>
	            			</div><hr/>
            		</div>
            		<ul>
            		<c:forEach var="vo" items="${comment}">
            			<li class="eachContent">
	            				<div class="articleInfo">
		            				
		            				<div class="commentTitle">
		            					<c:if test="${vo.board_type_num==2}">
			            					<a href='${url}/qna/qnaView?board_num=${vo.board_num}'>${vo.title}</a>
			            				</c:if>
			            				<c:if test="${vo.board_type_num==1}">
			            					<a href='#'>${vo.title}</a>
			            				</c:if>
		            				</div>
		            				<div class="comment">
		            					<c:if test="${vo.board_type_num==2}">
			            					<a href='${url}/qna/qnaView?board_num=${vo.board_num}'>${vo.reply_coment}</a>
			            				</c:if>
			            				<c:if test="${vo.board_type_num==1}">
			            					<a href='#'>${vo.title}</a>
			            				</c:if>
		            				</div>
		            				<div class="commentCategory" >
		            					<span>${vo.board_type_name}</span>
		            				</div>
		            				<div class="commentDate">
		            					<span>${vo.reply_date}</span>
		            				</div>
		            				<div class="commentDelete">
	            						<a href="javascript:ReplyDel(${vo.reply_num})">삭제하기</a>
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