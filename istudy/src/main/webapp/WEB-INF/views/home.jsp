<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home/home.css" type="text/css" />
<link rel="stylesheet" href="/css/home/owl.carousel.css">
<script src="/js/home/home.js"></script>
<script src="/js/home/owl.carousel.js"></script>

<!-- 서비스 이미지 -->
<div class="mainWrap section">
	<div id="mainImage">
		<img src="/images/mainImg.jpg">
	</div>
	<div id="mainText">
		<p>웹 개발자를 위한 스터디</p>
	</div>
</div>
<!-- 멘토추천 영역 -->
<div class="mentoRecommend section">
	<h1 id="mentoTitle">멘토추천</h1>
	<div class="slideBtnArea col-lg-1">
		<button class="customPrevBtn"><</button>
	</div>
	<div class="owl-carousel owl-theme owl-loaded col-lg-10">
		<c:forEach var="vo" items="${MentorList}">
			<div class="card item">
				<img src="/upload/user/${vo.profile_img}" />
				<div class="card-body">
					<h4 class="card-title">${vo.user_nick}</h4>
					<p class="card-text">${vo.career}</p>
					<a href="#" class="btn profile">프로필 보기</a>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="slideBtnArea col-lg-1">
		<button class="customNextBtn">></button>
	</div>
</div>
<!-- 기업추천 영역 -->
<div class="recruit section">
	<h1 class="recruitTitle">채용정보</h1>
	<div class="recruitArea">
 	<c:forEach var="vo" items="${JobList}">
		<table class="recruitInfo">
		  <tr>
		    <td rowspan="3" class="recruitImg"><a href="${vo.info_link}"><img src="/upload/job_info/${vo.info_img}"/></a></dh>
		    <td class="recruitText">[ ${vo.info_com} ]</td>
		  </tr>
		  <tr>
		    <td class="recruitText2">연봉: ${vo.info_sal}</td>
		  </tr>
		  <tr>
		    <td class="recruitText2">${vo.info_job}</td>
		  </tr>
		</table>
	</c:forEach>
	</div>
</div>

