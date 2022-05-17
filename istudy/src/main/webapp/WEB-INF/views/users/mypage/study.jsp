<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/css/mypage/study.css" type="text/css">  
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
		            						<img src="${url}/images/mypage_img/exstudy1.jpg"/>
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