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
            /* height: 1100px; */
            height: 100vh;
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
        	height: 660px;
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
        	height: 60px;
        	width: 100%;
        	line-height: 60px;
        	font-size: 16px;
        }
        .eachContentTitle{
        	height: 60px;
        	width: 100%;
        	line-height: 60px;
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
        .buttons{
        	width: 70%;
        	height: 50px;
        	float: left;
			margin-bottom: 20px;
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
        	width: 30%;
        	height: 50px;
        	float: right;       	
        }
        .search_form{
        	float: right:
        	width: 300px;
        	height: 40px;
        	margin: 0 auto;
        	
        }
        .search_form input[type=submit]{
        	width: 50px;
        	border-radius: 5px;
        	border: 1px solid #ddd;
        	height: 100%;
        	font-size: 16px;
        }
        #searchText{
        	width: 300px;
        	border-radius: 3px;
        	height: 100%;
        	font-size: 16px;
        }
        #searchText::-webkit-input-placeholder{
	        background-image: url(/images/admin_img/search.png);
        	background-size: contain;
	        background-position: 2px;
	        background-repeat: no-repeat;
	        text-indent: 2em;
	        font-size: 14px;
    	}       
       .button-click{
       		background-color: #f9f9f8;
        	box-shadow: 2px 2px 3px #c2c2bd;
       }
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
        
		.pagingContainer{
		    margin:0 auto;
		}
		.page-link{
		    border:none !important;
		    font-size:1.5em;
		    color:black !important;
		}
		.page-link:hover{
		    background-color:rgba(85, 76, 66, 70%) !important;
		    color:white !important;
		    border-radius:5px !important;
		}
		        
    </style>
    <script>
    
   $(function(){
	   $("#approve").click(function(){
			  
		   var cntApp = 0
		   
		   $(".check").each(function(i, chk){
			   
			   if(chk.checked){
				   cntApp++;
			   }			   
		   });		   
		   if(cntApp<=0){
			   alert("승인할 회원을 선택 후 승인 버튼을 누르세요.");
			   return false;
		   }		   
		   if(confirm("해당 회원을 멘토로 승인하시겠습니까?")){
			   
			  $(".contents").attr("action","/admin/approveUser");
			  
			  $(".contents").submit();			   
		   }		   			   
	   });
	   
	   $("#sendBack").click(function(){
		   
		   var cntSend = 0
		   
		   $(".check").each(function(i, chk){			   
			   if(chk.checked){
				   cntSend++;
			   }			   
		   });
		   
		   if(cntSend<=0){
			   alert("반려할 회원을 선택 후 반려 버튼을 누르세요.");
			   return false;
		   }		   
		   if(confirm("해당 일반 회원의 멘토 신청을 반려하시겠습니까?")){
			   
				  $(".contents").attr("action","/admin/sendBackUser");
				  
				  $(".contents").submit();				   
			}  
	   })
	   
	   $(".types").click(function(){
		   
		   var button = document.querySelectorAll(".types");
		   
		   for(var i=0; i<button.length; i++){
			   button[i].classList.remove("button-click");
		   }
		   
		   this.classList.add('button-click');
		   
	   });

   }); 

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
                    	  	<li><a href="/admin/adminUsers">회원관리</a></li>
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
            		<c:set var="total" value="${userCnt + mentorCnt + adminCnt }" />
            		<span class="userCount"> *전체 회원 :${total} , 일반: ${userCnt} , 멘토: ${mentorCnt} , 관리자: ${adminCnt} </span>
            	</div>
            	
            	<div class="buttons">
	            	<input type="button" class="types <c:if test="${param.permission=='user' && param.want!='T'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=user'" value="일반"/>
	            	<input type="button" class="types <c:if test="${param.permission=='mentor'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=mentor'" value="멘토"/>
	            	<input type="button" class="types <c:if test="${param.permission=='user' && param.want=='T'}">button-click</c:if>" onclick="location.href='/admin/adminUsers?permission=user&want=T'" value="멘토 신청"/>
	            </div>
	            <div class="search">
		            <form  class="search_form" method="get" action="/admin/adminUsers">
		            	<input type="text" id="searchText" placeholder="아이디, 이름, 닉네임, 연락처, 가입일, URL" name="searchWord" value="${word}"/>
		            	<input type="submit" value="검색"/>
		            </form>
            	</div>
            	<form class="contents" method="post"><hr/>
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
		            		<li class="eachContent" <c:if test="${vo.permission eq 'user' && vo.want eq 'T'}">style="color:blue;"</c:if>>
		            				<div class="userInfo">	  
		            					<div class="checkbox">
			            					<c:choose>
					            					<c:when test="${vo.permission eq 'user' && vo.want eq 'T'}">
					            						<input type="checkbox" name="userList" value="${vo.user_id}" class="check"/>
					            					</c:when>
					            					<c:otherwise>
					            						<input type="checkbox" disabled /> 
					            					</c:otherwise>
				            				</c:choose>
            							</div>    
		            					<div class="nicknames">
			            					<a href="/users/mypage/study?user_id=${vo.user_id}&admin=True" target="_blank" onclick="window.open(this.href,'_blank', 'width=1200, height=800, scrollbar=yes')">${vo.user_nick}</a>
			            				</div>
			            				<div class="id">
			            					<a href="#">${vo.user_id}</a>
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
			            						<a href="${vo.career}">${vo.career}</a>
			            					</c:if>
			            					<c:if test="${vo.career==null}">
			            						<span>-</span>
			            					</c:if>
			            				</div>    							            				
			            		</div><hr/>
		            		</li>
            			</c:forEach>
            		</ul>        		
            	</form>
		        <div class="pagingContainer">
			        <ul class="pagination justify-content-center" id="paging">
			            <c:if test="${pvo.pageNum==1}">
			                <li class="page-item disabled"><a class="page-link"
			                    id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			            </c:if>
			            <c:if test="${pvo.pageNum>1}">
			                <li class="page-item"><a class="page-link"
			                    href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                    <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
			                    <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum-1}" id="prevBtn"><i
			                        class="fa fa-angle-left"></i></a></li>
			            </c:if>
			            <c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
			                <c:if test="${p<=pvo.totalPage}">
			                    <c:choose>
			                        <c:when test="${p==pvo.pageNum}">
			                            <li class="page-item disabled"><a class="page-link">${p}</a></li>
			                        </c:when>
			                        <c:when test="${p!=pvo.pageNum}">
			                            <li class="page-item"><a class="page-link"
			                                href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                                <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
			                                <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${p}">${p}</a></li>
			                        </c:when>
			                    </c:choose>
			                </c:if>
			            </c:forEach>
			            <c:if test="${pvo.pageNum==pvo.totalPage}">
			                <li class="page-item disabled"><a class="page-link"
			                    id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
			            </c:if>
			            <c:if test="${pvo.pageNum<pvo.totalPage}">
			                <li class="page-item"><a class="page-link"
			                    href="/admin/adminUsers?<c:if test='${param.permission=="user" && param.want!="T"}'>permission=user&</c:if>
			                    <c:if test='${param.permission=="mentor"}'>permission=mentor&</c:if><c:if test='${param.permission=="user" && param.want=="T"}'>permission=user&want=T&</c:if>
			                    <c:if test='${pvo.searchWord!=null}'>searchWord=${pvo.searchWord}&</c:if>pageNum=${pvo.pageNum+1}" id="nextBtn"><i class="fa fa-angle-right"></i></a></li>
			            </c:if>
			        </ul>
			    </div>
		        <div class="choose">
		        	<input type="button" id="approve" value="승인"/>
	            	<input type="button" id="sendBack" value="반려"/>
		        </div>
            </div>  
        </div>
   </div>
   <div style="clear:both"></div>
   