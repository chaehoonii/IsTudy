<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home.css" type="text/css" />
<script defer src="/js/home.js"></script>
<div id="mainWrap">
	<div id="mainImage">
		<img src="/images/mainImg.jpg">
	</div>
	<div id="mainText">
		<p>웹 개발자를 위한 스터디</p>
	</div>
</div>
<h1 id="mentoRec">멘토추천</h1>
<!-- https://velog.io/@aaabbb12/Swiper-%EC%9D%91%EC%9A%A9-%EC%97%AC%EB%9F%AC-%EA%B0%9C-%EB%85%B8%EC%B6%9C-%EB%B0%8F-%EB%AF%B8%EB%A6%AC%EB%B3%B4%EA%B8%B0 -->
<div class="swiper-container">
	<div class="swiper-wrapper">
		<c:forEach var="vo" items="${MentorList}">
			<div class="card swiper-slide" style="width: 400px">
				<img src="/upload/user/${vo.profile_img}"/>
				<div class="card-body">
					<h4 class="card-title">${vo.user_nick}</h4>
					<p class="card-text">${vo.career}</p>
					<a href="#" class="btn profile">프로필 보기</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="swiper-button-next"></div>
	<div class="swiper-button-prev"></div>
</div>


<%-- <div>
	<ul id="job_rec_list">
		<c:forEach var="vo" items="${JobList}">
			<li>
				<ul>
					<li><a href="${vo.info_link}"><img
							src="/upload/job_info/${vo.info_img}" width="100px" /></a></li>
					<li>[ ${vo.info_com} ]</li>
					<li>${vo.info_job}</li>
					<li>연봉: ${vo.info_sal}</li>
				</ul>
			</li>
		</c:forEach>
	</ul>
</div> --%>
