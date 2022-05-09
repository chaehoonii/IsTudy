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
					<c:if test="${vo.selected==0}">
					<span class="not_selected">&nbsp;?&nbsp;</span>
					</c:if>
					<c:if test="${vo.selected==1}">
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
			    <li><input type="text" name="searchWord" class="searchWord"  id='searchWord_box'/></li>
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