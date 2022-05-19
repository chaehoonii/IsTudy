<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaList.css" type="text/css" />

<div class='qna_back'>
	<div id='qna_list'>
		<h1 id='qna_logo' onclick="location.href='/qna/qnaList'">Q & A</h1>		
		<br/><br/><br/><br/>
		<div id='qna_top01'><span class='white_border'>&nbsp;(&nbsp;${totalQna}&nbsp;) 개의 질문&nbsp;</span></div>
		<div id='qna_top02' onclick="location.href='/qna/qnaWrite'"><span class='gray_box'>&nbsp;질 문 하 기&nbsp;</span></div>
		<hr/>
		<c:forEach var="vo" items="${qnaList}">
			<ul class='qna_ul' onclick="location.href='/qna/qnaView?board_num=${vo.board_num}'">
				<li><span class='gray_border'>&nbsp;Q&nbsp;</span>&nbsp;&nbsp;
					<c:if test="${vo.solved==0}">
					<span class="not_selected">&nbsp;?&nbsp;</span>
					</c:if>
					<c:if test="${vo.solved==1}">
					<span class="is_selected">&nbsp;✔&nbsp;</span>
					</c:if>
					&nbsp;&nbsp;${vo.title}
				</li>
				<li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<c:forEach var="lang_list" items="${vo.lang_list}">
						<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
					</c:forEach> 
					<c:forEach var="tag_list" items="${vo.tag_list}">
						<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
					</c:forEach>
				</li>
			</ul>
			<ul class='qna_ul2'>
				<li style="font-size:14px">&nbsp;<span class='gray_border'>&nbsp;A&nbsp;</span>&nbsp;&nbsp;&nbsp;${vo.count_reply}</li>
				<li><img src='/upload/user/${vo.profile_img}' id='qna_profile' />&nbsp;&nbsp;&nbsp;&nbsp;${vo.user_nick}</li>
			</ul>
				<hr/>
		</c:forEach>
		<div class="pagingContainer">
		<ul class="pagination justify-content-center" id="paging">
			<c:if test="${pvo.pageNum==1}">
				<li class="page-item disabled"><a class="page-link"
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:if test="${pvo.pageNum>1}">
				<li class="page-item"><a class="page-link"
					href="/qna/qnaList?pageNum=${pvo.pageNum-1}" 
					id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
			</c:if>
			<c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
				<c:if test="${p<=pvo.totalPage}">
					<c:choose>
						<c:when test="${p==pvo.pageNum}">
							<li class="page-item disabled"><a class="page-link">${p}</a></li>
						</c:when>
						<c:when test="${p!=pvo.pageNum}">
							<li class="page-item"><a class="page-link"
								href="/qna/qnaList?pageNum=${p}">${p}</a></li>
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
					href="/qna/qnaList?pageNum=${pvo.pageNum+1}" id="nextBtn"><i
						class="fa fa-angle-right"></i></a></li>
			</c:if>
		</ul>
	</div>
	</div>
	<div class='search_div'>
		<br/>
		<form method="get" action="/qna/search" class="searchFrm">
			<ul class='searchbox'>
			    <li>
				    <select name="searchKey" class='searchKey' id='searchKey_box'>
				        <option value="title">제목</option>
				        <option value="content">내용</option>
				        <option value="user_nick">닉네임</option>
				        <option value="lang_type_name">언어</option>
				        <option value="tag">태그</option>
				    </select>
			    </li>
			    <li>&nbsp;<input type="text" name="searchWord" class="searchWord"  id='searchWord_box'/></li>
			    <li>&nbsp;<img src='/images/search.png' class='search_icon'/></li>
			</ul>
		</form>
	</div>
</div>
<script>
	window.onload = function(){
		if('${searchKey}'!=null && '${searchKey}'!=""){
			document.getElementById("searchKey_box").value = '${searchKey}';
		}
		if('${searchWord}'!=null && '${searchWord}'!=""){
			document.getElementById("searchWord_box").value = '${searchWord}';
		}
	}
	   $(".search_icon").click(function() {
	      if ($(".searchWord").val() == "") {
	         alert("검색어를 입력하세요");
	         return false;
	      }else{
	    	  $(".searchFrm").submit();
	      } 
	   });
</script>