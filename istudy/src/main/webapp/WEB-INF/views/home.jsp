<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home.css" type="text/css"/>
<div id="mainWrap">
	<div id="mainImage"><img src="/images/mainImg.jpg"></div>
	<div id="mainText"><p>웹 개발자를 위한 스터디</p></div>
</div>
<div class="mentoContaier">
	<h1>멘토추천</h1>
	<ul>
		<c:forEach var="vo" items="${MentorList}">
			<li>
				<div class="card" style="width:400px">
					<img src="/upload/user/${vo.profile_img}"/>
					<div class="card-body">
					<h4 class="card-title">${vo.user_nick}</h4>
					<p class="card-text">${vo.career}</p>
					<a href="#" class="btn profile">See Profile</a>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>


<div>
<ul id="job_rec_list">
	<c:forEach var="vo" items="${JobList}">
		<li>
			<ul>
				<li><a href="${vo.info_link}"><img src="/upload/job_info/${vo.info_img}" width="100px"/></a></li>
				<li>[ ${vo.info_com} ]</li>
				<li>${vo.info_job}</li>
				<li>연봉: ${vo.info_sal}</li>
			</ul>
		</li>
	</c:forEach>
</ul>
</div>	
