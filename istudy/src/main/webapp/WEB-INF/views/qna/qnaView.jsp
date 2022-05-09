<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.qna_back00 {
	text-align:center;
	margin-top:100px; 
	margin-bottom:100px; 
}
#back_btn{
	display:inline-block;
	width:50px;
	height:50px;
	border: 4px solid #ddd;
	border-radius: 50%;
	padding:5px;
	position:absolute;
	left:350px;
	top:200px;
	cursor:pointer;
}
.qna_back01 {
	text-align:center;
	width:1000px;
	margin:0 auto;
	display:inline-block;
}
.qna_back02 {
	border: 2px solid #ddd;
	border-radius:10px;
}
#qna_title{
	margin-top:50px;
	margin-bottom:50px;
	line-height:30px;
}
#qna_content{
	margin-top:50px;
	margin-bottom:50px;
}
#qna_title li, #qna_content li{
	text-overflow:ellipsis;
	white-space: nowrap;
  	overflow: hidden;
  	font-size:13px;
}
#qna_title li:nth-child(1){
	font-size:16px;
}
#qna_title li:nth-child(2){
	width:20%;
	float:right;
}
#qna_title li:nth-child(3){
	width:10%;
	float:right;
}
#qna_profile {
	width: 60px;
	border-radius: 50%;
}
.lang_list {
	background-color: #FEF5D4;
	border-radius: 5px;
	padding: 5px;
	font-size:11px;
}

.tag_list {
	background-color: rgb(232,244,232);
	border-radius: 5px;
	padding: 5px;
	font-size:11px;
}

</style>
<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<ul>
				<li>
					<ul id="qna_title">
						<li>${vo.title}</li>
						<li>작성일&nbsp;: &nbsp;${vo.write_date}</li>
						<li>조회수&nbsp;: &nbsp;${vo.hit}</li>
					</ul>
				</li>
				<hr/>
				<li>
					<ul id="qna_content">
						<li>${vo.content}</li>
						<li>
							<c:if test="${vo.file1 != null && vo.file1 != ''}">
								<img src='/upload/qna/${vo.file1}'/>
							</c:if>
							<c:if test="${vo.file2 != null && vo.file2 != ''}">
								<img src='/upload/qna/${vo.file2}'/>
							</c:if>
							<c:if test="${vo.file3 != null && vo.file3 != ''}">
								<img src='/upload/qna/${vo.file3}'/>
							</c:if>
							<c:if test="${vo.file4 != null && vo.file4 != ''}">
								<img src='/upload/qna/${vo.file4}'/>
							</c:if>
							<c:if test="${vo.file5 != null && vo.file5 != ''}">
								<img src='/upload/qna/${vo.file5}'/>
							</c:if>
						</li>
						<li><c:forEach var="lang_list" items="${vo.lang_list}">
								<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
							</c:forEach> 
							<c:forEach var="tag_list" items="${vo.tag_list}">
								<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
							</c:forEach>
						</li>
						<li><img src='/upload/user/${vo.profile_img}' id='qna_profile' />&nbsp;&nbsp;&nbsp;&nbsp;${vo.user_nick}</li>
					</ul>
				</li>
			</ul>
		</div>
		<div class='qna_back02'>
		댓글댓글
		</div>
	</div>
</div>