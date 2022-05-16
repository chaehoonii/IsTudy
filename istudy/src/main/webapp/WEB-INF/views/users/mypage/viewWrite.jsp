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
            height: 1000px;
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
        #article_click{
        	background-color: #f9f9f8;
        	box-shadow: 2px 2px 3px #c2c2bd;
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
        }
        #searchText::-webkit-input-placeholder{
	        background-image: url(/images/admin_img/search.png);
        	background-size: contain;
	        background-position: 2px;
	        background-repeat: no-repeat;
	        text-indent: 2em;
	        font-size: 14px;
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
        	width: 100%;
        	line-height: 60px;
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
        .numColor{
        	color:#392f31;
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
            	 
            </div>
            
        </div>
        </div>