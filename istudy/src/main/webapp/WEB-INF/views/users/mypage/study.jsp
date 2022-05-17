<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');
        ul, li, body{
            padding: 0;
            margin: 0;
            list-style-type: none;
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            color: gray;
        }
        body{
        	scrollbar-width: none;
        }
        body * {
    		font-family: "NanumSquare";
    		transform: skew(-0.03deg);
    	}
        #mypage{
            width: 100%;
            height: 95vh;
            margin-top:60px;
        }
        body::-webkit-scrollbar{
        	display: none;
        }
        .profilePage{
            width: 20%;
            float: left;
            height: 100%;
            background-color:rgba(85, 76, 66, 80%);
            color:white;
        }
        .userProfile{
            width: 100%;
            height:100%;
            position: relative;
        }
        .userPhoto{
            width: 200px;
            height: 200px;
            border-radius: 50%;
            background-color: blue;
            position: absolute;
            top: 110px;
            left: 50%;
            transform: translate(-50%, 0%);
            background-color: white;
            border: 1px solid #ddd;
        }
        .userNickname{
        	position: absolute;
            top : 340px;
            left: 50%;
            transform: translate(-50%,0%); 
            font-size: 20px;
        }
        .userid{
            position: absolute;
            top : 390px;
            left: 50%;
            transform: translate(-50%,0%); 
            font-size: 20px;
        }
        .studyDesc{
            position: absolute;
            top : 480px;
            left: 50%;
            transform: translate(-50%,0%); 
        }
        .studyDesc li{
            margin: 30px 0px;
            font-size: 18px;
        }
        .category{
            font-size: 16px;
            position: absolute;
            top : 470px;
            left: 50%;
            transform: translate(-50%,0%);
            color:white;
            width: 100%;
        }
        .category ul{
        	text-align:center;
        }
        .category li{
        	margin: 60px;
        	text-align:center;
        	font-size: 18px;
        }
        .category a{
        	color:white;
        }
        .category a:hover{
        	color: rgb(160,160,160);
        }
        .contentPage{
            width: 80%;
            float: right;
            height: 100%; 
        }
        .buttons{
        	width: 90%;
        	height: 50px;
			margin: 0 auto;
			margin-top: 60px;
        }
        .buttons input[type=button]{
        	width: 110px;
        	height: 35px;
        	font-size: 16px;
        	border-radius:15px;
        	border: 1px solid #ddd;
        	margin-right:15px;
        	line-height: 35px;
        	
        }
        .search{
        	width: 50%;
        	height: 60px;
        	float: right;
        }
        #searchText{
        	float: right;
        	height: 35px;
        	width: 250px;
        	margin-right: 50px;
        	border-radius: 3px;
        	margin-top: 10px;
        	font-size: 16px;
        }
        #searchText::-webkit-input-placeholder{
	        background-image: url(/images/admin_img/search.png);
        	background-size: contain;
	        background-position: 2px;
	        background-repeat: no-repeat;
	        text-indent: 2em;
    	}
        .contentBox{
        	width: 90%;
        	margin: 0 auto;
        	margin-top: 30px;
        }
        .title{
        	font-size: 20px;
        	height: 60px;
        	line-height: 60px;
        	width: 50%;
        	float: left;
        }
        hr{
        	margin:0;
        }
        .contents{
        	width: 100%;
        	height: 660px;
        	/*overflow: scroll;*/
        	/* overflow: hidden; */
        	margin-bottom: 30px;
        	border-bottom: 1px solid #ddd;    	
        }
        .contents::-webkit-scrollbar{
        	display: none;
        }
        .contents ul{
        	width: 100%;
        	height: 600px;
        	overflow: scroll;
        }
        .contents ul::-webkit-scrollbar{
        	display: none;
        }
        .eachContentTitle{
        	height: 60px;
        	width: 100%;
        	line-height: 60px;
        	font-size: 17px;
        	color: grey;        	
        }       
        .eachContent{
        	height: 60px;
        	line-height: 60px;
        	font-size: 16px;
        }
        .studyInfo{
        	display: flex;
        }
        .studyImg{
        	width: 80px;
        	position: relative;
        }
        .photo{
        	width: 40px;
        	height: 40px;
        	border-radius: 50%;
        	border: 1px solid gray;
        	position: absolute;
        	top: 5px;
        	left: 50%;
        	transform: translate(-50%,0%); 
        	overflow: hidden;
        }
        .photo img{
        	object-fit: cover;
        	width: 100%;
        	height: 100%;
        	background-position: center;
        	position: absolute;
        	top: 0px;
        }
        .studyName{
        	flex:2;
        }
        .studyStart{
        	flex:1.2;
        }
        .studyEnd{
        	flex:1.2;
        }
        .studyCategory{
        	flex:1.2;
        }
        .studyLeader{
        	flex : 0.5;	
        }
        .numColor{
        	color:#392f31;
        	font-size: 22px;
        }
        .button-click{
       		background-color: #f9f9f8;
        	box-shadow: 2px 2px 3px #c2c2bd;
       }
    </style>
     <script>
    
   $(function(){
	   
	   $("#searchText").keyup(function(){
		   
		   var val = $(this).val();
		   
		   if(val==""){
			   $(".eachContent").show();
			   
		   }else{			   
			   $(".eachContent").hide();
			   $(".eachContent:contains('"+val+"')").show();			   
		   }
		   
	   })
	   
   }); 

   </script>

    <div id="mypage">
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