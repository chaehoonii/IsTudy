<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>
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
        .adminUserPage{
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
            width: 100%;
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
        	width: 95%;
        	margin: 0 auto;
        	margin-top: 80px;
        }
        .title{
        	font-size: 20px;
        	height: 50px;
        	line-height: 50px;
        	font-weight: bold;
        	margin-bottom: 10px;
        }
        .userCount{
        	font-size: 14px;
        	margin-left: 40px;
        }
        hr{
        	margin:0;
        }
        .contents{
        	width: 100%;
        	height: 750px;
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
        .eachContentTitle{
        	height: 50px;
        	width: 100%;
        	line-height: 50px;
        	font-size: 16px;
        }
        .userInfo{
        	display: flex;
        	text-align: center;
        }
        .checkbox{
        	width: 40px;
			display: flex;
			flex-flow: row nowrap;
			align-items: center;
			justify-content: center;
        }
        .checkbox input[type=checkbox]{
        	display: inline-block;
        	width: 10px;
        	margin: auto;        	
        }
        .nicknames{
        	flex:1;
        }
        .id{
        	flex:0.8;
        }
        .name{
        	flex: 0.8;
        }
        .tel{
        	flex:1.2;
        }
        .email{
        	flex:1.5;
        }
        .registerDate{
        	flex:1;
        }
        .classify{
        	flex:0.5;
        }
        .apply{
        	flex:0.7;
        }
        .career{
        	flex:0.7;
        }
        .careerURL{
        	flex:1.5;
        	overflow:hidden;
	        text-overflow:ellipsis;
	        white-space:nowrap;
	        margin-right: 20px;
        }
        .paging{
            width: 100%;
            height: 30px;
            margin: 0 auto;
            font-size: 16px;
            
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
        
        .buttons{
        	width: 50%;
        	height: 50px;
        	float: left;
			/* margin-top: 10px; */
        }
        .buttons input[type=button]{
        	width: 70px;
        	height: 35px;
        	font-size: 14px;
        	border-radius:15px;
        	border: 1px solid #ddd;
        	margin-right: 15px;
        }
        .buttons input[type=button]:nth-child(3){
        	width: 80px;
        }
        .search{
        	width: 50%;
        	height: 50px;
        	float: right;
        }
        .searchText{
        	float: right;
        	height: 35px;
        	width: 250px;
        	margin-right: 50px;
        	border-radius: 3px;
        }
        .searchText::-webkit-input-placeholder{
	        background-image: url('/images/admin_img/search.png');
        	background-position: 10px;
        	background-repeat: no-repeat;
        	background-size: contain;
        	opacity: 0.5;
    	}
        
        /* .buttons input[type=button]:first-child{
        	margin-right:15px;
        } */
        /* .buttons input[type=button]:nth-child(2){
        	background-color: #f9f9f8;
        	box-shadow: 2px 2px 3px #c2c2bd;
        	
        } */
        .choose{
        	width: 100%;
        	height: 40px;
        }
        .choose input[type=button]{
        	width: 60px;
        	height: 35px;
        	font-size: 16px;
        	border-radius:5px;
        	border: 1px solid #ddd;
        	line-height: 35px;
        	float: right;
        	margin: 15px;
        }
    </style>
    <script>
    
   $(function(){
	   
	   $(".searchText").keyup(function(){
		   
		   var val = $(this).val();
		   
		   if(val==""){
			   $(".eachContent").show();
			   
		   }else{			   
			   $(".eachContent").hide();
			   $(".eachContent:contains('"+val+"')").show();			   
		   }
		   
	   })
	   
	   
   }); 
   
   function approve(){
	   
	   if(confirm('멘토 신청을 승인하겠습니까?')){
		   location.href="";
	   }
	   return false;
   }
   
   function sendBack(){
	   if(confirm('멘토 신청을 반려하겠습니까?')){
		   location.href="";
	   }
	   return false;
	   
	   
   }
    </script>
    
    <div class="adminUserPage">
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
	                    	<li><a href="#">신고관리</a></li>
                    	  	<li><a href="#">회원관리</a></li>
                          	<li><a href="#">공지사항 관리</a></li>
                          	<li><a href="#">데이터 랩</a></li>
	                    </ul>  
                    </div>
                </div>
            </div>
        </div>
        <div class="contentPage">
          
            <div class="contentBox">
            	<div class="title">
            		회원 목록 
            		<span class="userCount"> *전체 회원 :${allCnt} , 일반: ${userCnt} , 멘토: ${mentorCnt} , 관리자: ${adminCnt} </span>
            	</div>
            	
            	<div class="buttons">
	            	<input type="button" onclick="location.href='#'" value="일반"/>
	            	<input type="button" onclick="location.href='#'" value="멘토"/>
	            	<input type="button" onclick="location.href='#'" value="멘토 신청"/>
	            </div>
	            <div class="search">
	            	<input type="text" class="searchText"/>
	            </div>
            	
            	<div class="contents"><hr/>
            		<ul>
            		<li class="eachContentTitle">
            				<div class="userInfo">	     
            					<div class="checkbox">
            					
            					</div>       				
	            				<div class="nicknames">
	            					<span>닉네임</span>
	            				</div>
	            				<div class="id">
	            					<span>아이디</span>
	            				</div>
	            				<div class="name">
	            					<span>이름</span>
	            				</div>
	            				<div class="tel">
	            					<span>연락처</span>
	            				</div>
	            				<div class="email">
	            					<span>이메일</span>
	            				</div>
	            				<div class="registerDate">
	            					<span>가입일</span>
	            				</div>
	            				<div class="classify">
	            					<span>분류</span>
	            				</div>
	            				<div class="apply">
	            					<span>멘토 신청</span>
	            				</div>
	            				<div class="career">
	            					<span>경력 사항</span>
	            				</div>
	            				<div class="careerURL">
	            					<span>URL</span>
	            				</div>
	            			</div><hr/>
            		</li>
            			<c:forEach var="vo" items="${users}">
		            		<li class="eachContent">
		            				<div class="userInfo">	  
		            					<div class="checkbox">
            								<input type="checkbox" name="${vo.user_id}"/>
            							</div>    
		            					<div class="nicknames">
			            					<span>${vo.user_nick}</span>
			            				</div>
			            				<div class="id">
			            					<span>${vo.user_id}</span>
			            				</div>
			            				<div class="name">
			            					<span>${vo.user_name}</span>
			            				</div>
			            				<div class="tel">
			            					<span>${vo.tel}</span>
			            				</div>
			            				<div class="email">
			            					<span>${vo.email}</span>
			            				</div>
			            				<div class="registerDate">
			            					<span>${vo.register_date}</span>
			            				</div>
			            				<div class="classify">
			            					<c:if test="${vo.permission eq 'user'}">
			            						<span>일반</span>
			            					</c:if>
			            					<c:if test="${vo.permission eq 'mentor'}">
			            						<span>멘토</span>
			            					</c:if>
			            					<c:if test="${vo.permission eq 'admin'}">
			            						<span>관리자</span>
			            					</c:if>
			            				</div>
			            				<div class="apply">
			            					<c:choose>
				            					<c:when test="${vo.permission eq 'user' && vo.want eq 'T'}">
				            						<span>O</span> 
				            					</c:when>
				            					<c:otherwise>
				            						<span>-</span> 
				            					</c:otherwise>
			            					</c:choose>
			            				</div>
			            				<div class="career">
			            					<span>${vo.career_year}</span>
			            				</div>
			            				<div class="careerURL">
			            					<c:if test="${vo.career!=null}">
			            						<span>${vo.career}</span>
			            					</c:if>
			            					<c:if test="${vo.career==null}">
			            						<span>-</span>
			            					</c:if>
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
		        <div class="choose">
		        	<input type="button" onclick="approve()" value="승인"/>
	            	<input type="button" onclick="sendBack()" value="반려"/>
		        </div>
            </div>           
        </div>
   </div>