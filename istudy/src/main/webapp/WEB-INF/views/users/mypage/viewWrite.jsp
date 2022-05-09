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
            width: 25%;
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
        .articleInfo{
        	display: flex;
        }
        
        .articleTitle{
        	flex:2;
        	margin-left:20px;
        	overflow:hidden;
	        text-overflow:ellipsis;
	        white-space:nowrap;
	        margin-right: 20px;
        }
        .commentTitle{
        	flex:1.3;
        	margin-left:20px;
        	overflow:hidden;
	        text-overflow:ellipsis;
	        white-space:nowrap;
	        margin-right: 20px;
        
        }
        .comment{
        	flex:1.5;
        	overflow:hidden;
	        text-overflow:ellipsis;
	        white-space:nowrap;
	        margin-right: 50px;
	        padding: 0 10px;
	        
        }
        .articleCategory{
        	flex: 1;
        }
        .commentCategory{
        	margin-left:35px;
        	flex: 0.7;
        	padding: 0 20px;
        }
        .writeDate{
        	flex : 1;	
        }
        .articleDelete{
        	flex: 1;
        }
        .articleDelete a{
        	color: #7f7f75;
        }
        .articleDelete a:hover{
        	color: #080807;
        }
        .commentDate{
        	flex:0.7;
        }
        .commentDelete{
        	flex:0.7;
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
                    <div class="category">
                          <a href="#">회원 수정</a>
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
            	<div class="title">작성한 글</div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
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
            		</li>
            		
	            		<li class="eachContent">
	            				<div class="articleInfo">
		            				
		            				<div class="articleTitle">
		            					<a href='${url}/study_home/study_room/${vo.study_num}'>Spring 에러 해결 도와주세요 ㅠㅠ</a>
		            				</div>
		            				<div class="articleCategory">
		            					<span>QnA</span>
		            				</div>
		            				<div class="writeDate">
		            					<span>2022.03.10</span>
		            				</div>
		            				<div class="articleDelete">
	            						<a href="#">삭제하기</a>
	            					</div>
		            			</div><hr/>
	            		</li>
            		
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
            	<div class="title">댓글 단 글</div><hr/>
            	<div class="contents">
            		<ul>
            		<li class="eachContent">
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
            		</li>
            			<li class="eachContent">
	            				<div class="articleInfo">
		            				
		            				<div class="commentTitle">
		            					<a href='${url}/study_home/study_room/${vo.study_num}'>img 영역 밖에 튀어나와요..어떻게 해야할까요</a>
		            				</div>
		            				<div class="comment">
		            					<a href='${url}/study_home/study_room/${vo.study_num}'>혹시 img가 담겨있는 영역에 overflow : hidden 써보셨나요?? 적용이 안되어서 그럴수도</a>
		            				</div>
		            				<div class="commentCategory" >
		            					<span>자유게시판</span>
		            				</div>
		            				<div class="commentDate">
		            					<span>2022.02.12</span>
		            				</div>
		            				<div class="commentDelete">
	            						<a href="#">삭제하기</a>
	            					</div>
		            			</div><hr/>
	            		</li>
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