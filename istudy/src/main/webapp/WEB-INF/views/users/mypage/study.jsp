<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="url" value="<%=request.getContextPath()%>"/>

<link rel="stylesheet" href="/css/mypage/study.css" type="text/css">  
<script src="/js/mypage/mypage.js"></script>
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
            	<input type="button" class="<c:if test="${param.type!='end' && param.type!='like'}">button-click</c:if>" onclick="location.href='${url}/users/mypage/study<c:if test="${logPermission=='admin'}">?user_id=${id}&admin=True</c:if>'" value="진행 스터디"/>          	
            	<input type="button" class="<c:if test="${param.type=='end'}">button-click</c:if>" onclick="location.href='${url}/users/mypage/study?type=end<c:if test="${logPermission=='admin'}">&user_id=${id}&admin=True</c:if>'" value="완료 스터디"/>
            	<input type="button" class="<c:if test="${param.type=='like'}">button-click</c:if>" onclick="location.href='${url}/users/mypage/study?type=like<c:if test="${logPermission=='admin'}">&user_id=${id}&admin=True</c:if>'" value="찜한 스터디"/>
            </div>
            
            <div class="contentBox"> 
            	<div class="title">
            		<c:choose>
					  	<c:when test="${param.type!='end' && param.type!='like'}">
					         진행 스터디
					    </c:when>
					    <c:when test="${param.type=='end'}">
					         완료 스터디
					    </c:when>
					    <c:otherwise>
					         찜한 스터디
					    </c:otherwise>
				  </c:choose>&nbsp; 
            	
            	<span class="numColor">${cnt_study}</span>         	
            	</div>
            	<div class="search">
	            	<input type="text" id="searchText" placeholder="검색"/>
	        	</div>
	        	<div style="clear:both"></div>
            	<div class="contents"><hr/>
            		
            		<div class="eachContentTitle">
            				<div class="studyInfo">
	            				<div class="studyImg">
	            					
	            				</div>
	            				<div class="studyName">
	            					<a>스터디명</a>
	            				</div>
	            				<div class="studyStart">
	            					<span>시작일</span>
	            				</div>
	            				<div class="studyEnd">
	            					<span>종료일</span>
	            				</div>
	            				<div class="studyCategory">
	            					<span>분류</span>
	            				</div>
	            				<div class="studyLeader">
	            					<span>스터디장</span>
	            				</div>
	            			</div><hr/>
            		</div>
            		<ul>
            		<c:forEach var="vo" items="${study}">
	            		<li class="eachContent">
	            				<div class="studyInfo">
		            				<div class="studyImg">
		            					<div class="photo">
		            						<img src="/upload/study_room/${vo.study_img}"/>
		            					</div>
		            				</div>
		            				<div class="studyName">
		            					<a href='${url}/study_home/study_room/${vo.study_num}'>${vo.study_name}</a>
		            				</div>
		            				<div class="studyStart">
		            					<span>${vo.start_date}</span>
		            				</div>
		            				<div class="studyEnd">
		            					<span>${vo.finish_date}</span>
		            				</div>
		            				<div class="studyCategory">
		            					<span>${vo.study_type_name}</span>
		            				</div>
		            				<div class="studyLeader">
		            					<span>${vo.host_id}</span>
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