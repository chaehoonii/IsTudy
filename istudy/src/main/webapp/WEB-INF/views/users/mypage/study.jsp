<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>

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
        #mypage{
            width: 100%;
            height: 1200px;
            
        }
        body::-webkit-scrollbar{
        	display: none;
        }
        .profilePage{
            width: 20%;
            float: left;
            height: 100%;
            background-color: rgb(230, 220, 215); 
        }
        .userProfile{
            width: 100%;
            height:100%;
            position: relative;
        }
        .userPhoto{
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background-color: blue;
            position: absolute;
            top: 110px;
            left: 50%;
            transform: translate(-50%, 0%);
            background-color: white;
            border: 1px solid #ddd;
        }
        .userid{
            position: absolute;
            top : 370px;
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
        .category>a{
            font-size: 16px;
            position: absolute;
            top : 700px;
            left: 50%;
            transform: translate(-50%,0%);
        }
        .contentPage{
            width: 75%;
            float: right;
            height: 100%; 
        }
        .buttons{
        	width: 100%;
        	height: 80px;
			margin-top: 60px;
        }
        .buttons input[type=button]{
        	width: 100px;
        	height: 35px;
        	font-size: 16px;
        	border-radius:15px;
        	border: 1px solid #ddd;
        	margin: 15px;
        }
        .buttons input[type=button]:first-child{
        	margin-left:50px;
        }
        .buttons input[type=button]:nth-child(2){
        	background-color: #f9f9f8;
        	box-shadow: 2px 2px 3px #c2c2bd;
        }
        .contentBox{
        	width: 100%;
        	margin-left: 50px;
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
        	/* background-color: rgb(230, 220, 215);
        	height: 50px;
        	width: 100%; */
        }
        
        .eachContent{
        	height: 50px;
        	width: 100%;
        	line-height: 50px;
        	font-size: 16px;
        }
        .studyInfo{
        	display: flex;
        }
        .studyImg{
        	flex:0.8;
        	position: relative;
        }
        .photo{
        	width: 40px;
        	height: 40px;
        	border-radius: 50%;
        	border: 1px solid gray;
        	position: absolute;
        	top: 5px;
        	left: 30%;
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
        	flex:3;
        }
        .studyCategory{
        	flex:1;
        }
        .studyLeader{
        	flex : 0.7;	
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
        
    </style>

    <div id="mypage">
        <div class="profilePage">
            <div class="userProfile">
                <div class="userPhoto">
                </div>
                <div class="userid">
                    Istudy님
                </div>
                <div class="userDesc">
                    <div>  
                        <ul class="studyDesc">
                            <li class="joinStudy">진행 스터디 : 10개</li>
                            <li class="finishStudy">완료 스터디 : 10개</li>
                        </ul>
                    </div>
                    <div id="category">
                          <a href="${url}/users/userEdit">회원 수정</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="contentPage">
            <div class="buttons">
            	<input type="button" onclick="location.href='${url}/users/mypage/viewWrite'" value="글관리"/>
            	<input type="button" onclick="location.href='${url}/users/mypage/study'" value="스터디"/>
            </div>
            <div class="contentBox">
            	<div class="title">진행 스터디</div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
            				<div class="studyInfo">
	            				<div class="studyImg">
	            					
	            				</div>
	            				<div class="studyName">
	            					<a>스터디명</a>
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
            	<div class="title">완료 스터디</div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
            				<div class="studyInfo">
	            				<div class="studyImg">
	            					
	            				</div>
	            				<div class="studyName">
	            					<a>스터디명</a>
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