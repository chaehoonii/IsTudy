<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 정보 페이지</title>'


<!-- DatePicker File import -->
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/studyhome/studyhome.css" type="text/css" />
<script src="/js/studyhome/studyhome.js"></script>


<div id="category_box">
	<form id="frm">
		<div id="category_top">
			<p>카테고리</p>
			<input type="search" name="SEARCH" placeholder="SEARCH"> 
			<button type="submit">검색</button>
		</div>
		
		<div id="first_menu"> 
			<h1>스터디 종류</h1>
			<ul id="second_menu">
				<li><label for="stype1"><input type="checkbox" name="stype" id="stype1" value="T" onclick="getTypeValue()" style="margin-right:10px;">멘토</label></li>
				<li><label for="stype2"><input type="checkbox" name="stype" id="stype2" value="F" onclick="getTypeValue()">일반</label></li>
			</ul>
		</div>
		<div id="first_menu"> 
			<h1>스터디 분류</h1>
			<ul id="second_menu">
				<li><label for="sclass1"><input type="checkbox" name="sclass" id="sclass1" value="Frontend" onclick="getClassValue()">프론트엔드</label></li>
				<li><label for="sclass2"><input type="checkbox" name="sclass" id="sclass2" value="Backend" onclick="getClassValue()">백엔드</label></li>
				<li><label for="sclass3"><input type="checkbox" name="sclass" id="sclass3" value="Algorithm" onclick="getClassValue()">알고리즘</label></li>
				<li><label for="sclass4"><input type="checkbox" name="sclass" id="sclass4" value="Project" onclick="getClassValue()">프로젝트</label></li>
				<li><label for="sclass5"><input type="checkbox" name="sclass" id="sclass5" value="English" onclick="getClassValue()">영어</label></li>
			</ul>
		</div>
		<div id="first_menu"> 
			<h1>스터디 상태</h1>
			<ul id="second_menu">
				<li id="sstatus"><label for=sstatus1><input type="checkbox" name="status" id="sstatus1" value="1" onclick="getStatusValue()">모집</label></li>
				<li><label for=sstatus2><input type="checkbox" name="status" id="sstatus2" value="0" onclick="getStatusValue()">마감</label></li>
			</ul>
		</div>
		<div id="first_menu"> 
			<h1>스터디 언어</h1>
			<select id="langList">
				<c:forEach var="vo" items="${langList}">
						<option value="${vo.lang_type_num}" selected onclick="getLangValue()">${vo.lang_type_name}</option>
					<%-- <input type="checkbox" name="lang" id="lang" value="${vo.lang_type_num}"><label>${vo.lang_type_name}</label></span> --%>
				</c:forEach>
			</select>
		</div>
		<div id="first_menu"> 
			<h1>스터디 기간</h1>
				<%-- <p><input type="date" id="s_date" min="${start_date}" ></p>
		      	<input type="hidden" value="apply" name="status">
		      	<p><input type="date" id="f_date" min="${finish_date}" ></p>
		      	<input type="hidden" value="apply" name="status"> --%>
		      	<p>조회기간을 선택해주세요 <br/>
				  <input type="text" id="datepicker1" onclick="getDateValue()"> ~
				  <input type="text" id="datepicker2" onclick="getDateValue()">
				</p>
		</div>
		<!-- 스터디 등록 버튼 -->
		<div id="study_register">
			<input type="button" id="rbutton" onclick="location.href='http://localhost:8060/studyregister';" value="스터디 등록하기">
		</div>
	</form>
</div>
<div id="study_list">
	<c:forEach var="vo" items="${studyhome}">
	<!-- 반복문 안에서는 id x class o -->
		<div class="info">
			<div class="simg">
				<img src="/images/study_info/${vo.study_img}" class="img img-thumbnail">
			</div>
			<div class="sinfo">
				<span class="sname">${vo.study_name}</span><br/>
				
				<span class="sid">${vo.host_id}</span>
				<span class="smentor">
					<c:if test="${vo.is_mentor=='T'}">멘토</c:if>
					<c:if test="${vo.is_mentor=='F'}">일반</c:if>
				</span>
				<span class="smax">${vo.in_people}/${vo.max}</span>
				<span class="sname">${vo.study_type_name}</span><br/>
				<span class="sdate">${vo.start_date} ~ ${vo.finish_date}</span>
				<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
					<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
				</c:forEach> 
				<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
					<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
				</c:forEach>
				<!-- 스터디 자세히 보기 버튼 -->
				<div class="study_more">
					<a href="/study/study_home/${vo.study_num}">
						<input type="button" class="mbutton" value="스터디 자세히 보기">
					</a>
				</div>
			</div>
		</div>	
		<hr>
	</c:forEach>
</div>
<div class="pagingContainer">
	<ul class="pagination justify-content-center" id="paging">
    	<c:if test="${pvo.pageNum==1}">
        	<li class="page-item disabled"><a class="page-link" id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
        </c:if>
        <c:if test="${pvo.pageNum>1}">
            <li class="page-item">
            	<a class="page-link" href="/study/studyHome?pageNum=${pvo.pageNum-1}" id="prevBtn">
            		<i class="fa fa-angle-left"></i>
            	</a>
            </li>
        </c:if>
        <c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
            <c:if test="${p<=pvo.totalPage}">
            	<c:choose>
            		<c:when test="${p==pvo.pageNum}">
            			<li class="page-item disabled"><a class="page-link">${p}</a></li>
                    </c:when>
                    <c:when test="${p!=pvo.pageNum}">
                        <li class="page-item"><a class="page-link" href="/study/studyHome?pageNum=${p}">${p}</a></li>
                    </c:when>
                </c:choose>
            </c:if>
       </c:forEach>
       <c:if test="${pvo.pageNum==pvo.totalPage}">
            <li class="page-item disabled">
            	<a class="page-link" id="nextBtn">
            		<i class="fa fa-angle-right"></i>
            	</a>
           	</li>
      	</c:if>
        <c:if test="${pvo.pageNum<pvo.totalPage}">
            <li class="page-item">
            	<a class="page-link" href="/study/studyHome?pageNum=${pvo.pageNum+1}" id="nextBtn">
            		<i class="fa fa-angle-right"></i>
            	</a>
            </li>
       	</c:if>
    </ul>
</div>
<div style="clear:both"></div>