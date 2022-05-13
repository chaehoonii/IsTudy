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
        	flex: 0.5;
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
        	flex:0.5;
        }
        .commentDelete a{
        	color: #7f7f75;
        }
        .commmentDelete a:hover{
        	color: #080807;
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
    <script>   
    	 function BoardDel(board_num){
    	     if(confirm("글을 삭제하시겠습니까?")){
    	          location.href = "/board/boardDelete?board_num="+board_num;
    	        }
    	     return false;
    	  }
    	 
    	 function ReplyDel(reply_num){
    		 if(confirm("댓글을 삭제하시겠습니까?")){
    			 location.href = '/board/replyDel?reply_num='+reply_num;
    		 }
    		 return false;
    	 } 
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
            	<div class="title">작성한 글&nbsp; <span class="numColor">${cntArticle}</span></div><hr/>
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
            			<c:forEach var="vo" items="${article}">
		            		<li class="eachContent">
		            				<div class="articleInfo">		            				
			            				<div class="articleTitle">
			            					<c:if test="${vo.board_type_num==2}">
			            						<a href='${url}/qna/qnaView?board_num=${vo.board_num}'>${vo.title}</a>
			            					</c:if>
			            					<c:if test="${vo.board_type_num==1}">
			            						<a href='#'>${vo.title}</a>
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
            	<div class="paging">
		                <ul>
		                    <li><a href="#">1</a></li>
		                    <li><a href="#">2</a></li>
		                    <li><a href="#">3</a></li>
		                    <li><a href="#">4</a></li>
		                    <li><a href="#">5</a></li>
		                </ul>
		        </div>
            	<div class="title">댓글단 글&nbsp; <span class="numColor">${cntComment}</span></div><hr/>
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