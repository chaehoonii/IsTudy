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
            height: 1100px;
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
        .contentBox{
        	width: 90%;
        	margin: 0 auto;
        	margin-top: 80px;
        }
        .title{
        	font-size: 20px;
        	height: 60px;
        	line-height: 60px;
        }
        hr{
        	margin:0;
        }
        .contents{
        	width: 100%;
        	height: 350px;
        	/* overflow: scroll; */
        	overflow: hidden;
        	margin-bottom: 30px;
        	border-bottom: 1px solid #ddd;    	
        }
        .contents::-webkit-scrollbar{
        	display: none;
        }
        .contents ul{
        	width: 100%;
        	height: 100%;
        }
        .contents ul li:first-child{
        	color: grey;
        	font-size: 17px;
        }       
        .eachContent{
        	height: 50px;
        	/* width: 100%; */
        	line-height: 50px;
        	font-size: 16px;
        	/* padding-right: 30px; */
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
        .paging{
            width: 100%;
            height: 30px;
            margin: 0 auto;
            font-size: 16px;
            margin-bottom: 20px;
        }
        
        .paging ul{
            width: 250px;
            height: 100%;
            margin: 30px auto;
        }
        .paging ul li{
            float: left;
            width: 20%;
            text-align: center;
        }
        .numColor{
        	color:#392f31;
        	/*font-weight: bold;*/
        	font-size: 22px;
        }
    </style>

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
	                    	<li><a href="${url}/users/mypage/viewWrite">글관리</a></li>
                    	  	<li><a href="${url}/users/mypage/study">스터디관리</a></li>
                          	<li><a href="${url}/users/userEdit">회원 수정</a></li>
	                    </ul>  
                    </div>
                </div>
            </div>
        </div>
        <div class="contentPage">
            <div class="contentBox">
            	<div class="title">진행 스터디&nbsp; <span class="numColor">${cntJstudy}</span></div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
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
            		</li>
            		<c:forEach var="vo" items="${Jstudy}">
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
            	<div class="paging">
		                <ul>
		                    <li><a href="#">1</a></li>
		                    <li><a href="#">2</a></li>
		                    <li><a href="#">3</a></li>
		                    <li><a href="#">4</a></li>
		                    <li><a href="#">5</a></li>
		                </ul>
		        </div>
            	<div class="title">완료 스터디&nbsp; <span class="numColor">${cntFstudy}</span></div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
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
            			</li>
            			<c:forEach var="vo" items="${Fstudy}">
	            		<li class="eachContent">
	            				<div class="studyInfo">
		            				<div class="studyImg">
		            					<div class="photo">
		            						<img src="${url}/images/mypage_img/exstudy1.jpg"/>
		            					</div>
		            				</div>
		            				<div class="studyName">
		            					<a>${vo.study_name}</a>
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
            	<div class="paging">
	                <ul>
	                    <li><a href="#">1</a></li>
	                    <li><a href="#">2</a></li>
	                    <li><a href="#">3</a></li>
	                    <li><a href="#">4</a></li>
	                    <li><a href="#">5</a></li>
	                </ul>
	            </div>     
            </div>
            
        </div>
    </div>