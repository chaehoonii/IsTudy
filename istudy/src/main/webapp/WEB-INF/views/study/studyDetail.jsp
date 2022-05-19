<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 상세 페이지</title>

<link rel="stylesheet" href="/css/studyhome/studydetail.css" type="text/css" />

<script>
</script>

<div id="contents">
	<c:forEach var="vo" items="${studydetail}">
		<div class="sdetail">
			<img src="/images/study_info/${vo.study_img}" class="img img-thumbnail"><br/>
			<span class="scontent">${vo.study_name}<br/>${vo.study_rule}</span><br/>
			<span class="shost">${vo.host_id}</span><br/>
		</div>	
	</c:forEach>
	<c:forEach var="vo" items="${studyuser}">
		<div class="sdetailuser">
			<span class="suser">${vo.user_id}</span><br/>
			<span class="">${vo.want_ok}</span><br/>
			<span class="scoment">${vo.want_coment}</span>
		</div>
	</c:forEach>
</div>
<div id="slist_page">
	<input type="button" id="button" onclick="http://localhost:8060/study/study_home;" value="스터디 목록">
</div>
<div style="clear:both"></div>