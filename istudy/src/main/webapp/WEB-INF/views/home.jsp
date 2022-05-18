<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home/home.css" type="text/css" />
<link rel="stylesheet" href="/css/home/owl.carousel.css">

<script src="/js/home/home.js"></script>
<script src="/js/home/owl.carousel.js"></script>
<script src="https://unpkg.com/scroll-out/dist/scroll-out.min.js"></script>

<!-- 서비스 이미지 -->
<div class="mainImageWrap" data-scroll>
	<div id="mainImage">
		<img src="/images/main.jpg">
	</div>
	<div id="mainText">
		<p>IT 개발자를 위한 스터디</p>
	</div>
</div>
<!-- 스터디추천 영역 -->
<c:if test="${logStatus == 'Y'}">
	<div class="studyRecommend" data-scroll>
		<h1 class="studyTitle">스터디 추천</h1>
		<div id="study_rec_list">
			<c:forEach var="vo" items="${StudyList}">
				<ul class="studyInfo">
                    <li><a href="/study_home/study_info?study_num=${vo.study_num}"><img
                            src="/upload/study_room/${vo.study_img}" width="100px" /></a></li>
                    <c:if test="${vo.is_mentor == 'T'}">
                        <li class="studyInfoText sort">멘토</li>
                    </c:if>
                    <c:if test="${vo.is_mentor == 'F'}">
                        <li class="studyInfoText sort">자율</li>
                    </c:if>
                    <hr/>
                    <li class="studyInfoText studyInfotitle">${vo.study_name}</li>
                    <li class="studyInfoText">${vo.start_date}&nbsp;~&nbsp;${vo.finish_date}</li>
                    <li class="studyInfoText">${vo.in_people} / ${vo.max}</li>
                    <br/>
                    <li class="studyCategory"><c:forEach var="lang_list" items="${vo.lang_list}" end="2">
                        <span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
                    </c:forEach> 
                    <br/>
                    <br/>
                    <c:forEach var="tag_list" items="${vo.tag_list}" end="2">
                        <span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
                    </c:forEach></li>
                </ul>
			</c:forEach>
		</div>
	</div>
</c:if>
<!-- 멘토추천 영역 -->
<div class="mentoRecommend" data-scroll>
		<h1 id="mentoTitle">멘토추천</h1>
		<div class="slideBtnArea col-lg-1">
			<button class="customPrevBtn"><</button>
		</div>
		<div class="owl-carousel owl-theme owl-loaded col-lg-10">
			<c:forEach var="vo" items="${MentorList}">
				<div class="card item">
					<img src="/upload/user/${vo.profile_img}" />
					<div class="card-body">
						<img src='${vo.level_icon}' style='width:30px; margin:0;display:inline;'><h4 class="card-title">${vo.user_nick}</h4>
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
<div class="recruit" data-scroll>
	<h1 class="recruitTitle">채용정보</h1>
	<div class="recruitArea">
		<c:forEach var="vo" items="${JobList}">
			<table class="recruitInfo">
				<tr>

					<td rowspan="4" class="recruitImg"><a href="${vo.info_link}"><img
							src="/upload/job_info/${vo.info_img}" /></a></td>
					<td colspan="2" class="recruitText">${vo.info_com}</td>
				</tr>
				<tr>
					<td class="recruitCategory">지역</td>
					<td class="recruitText1">${vo.info_region}</td>
				</tr>
				<tr>
					<td class="recruitCategory">연봉</td>
					<td class="recruitText2">${vo.info_sal}</td>
				</tr>
				<tr>
					<td class="recruitCategory">분야</td>
					<td class="recruitText3">${vo.info_job}</td>

				</tr>
			</table>
		</c:forEach>
	</div>
</div>


<script>
	ScrollOut({ });
</script>
