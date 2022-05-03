<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/home.css" type="text/css"/>
<div id="mainWrap">
	<div id="mainImage"><img src="/images/mainImg.jpg"></div>
	<div id="mainText"><p>웹 개발자를 위한 스터디</p></div>
</div>

<ul id="mentor_rec_list">
	<c:forEach var="vo" items="${MentorList}">
		<li>
			<ul>
				<li><img src="/upload/user/${vo.profile_img}"/></li>
				<li><img src="${vo.level_icon}" width="30px"/> ${vo.user_nick}</li>
				<li>${vo.career}</li>
			</ul>
		</li>
	</c:forEach>
</ul>
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
<ul id="study_rec_list">
<c:if test="${logStatus != 'Y'}">
	로그인 시 이용할 수 있는 서비스입니다.(스터디추천이미지 캡쳐 후 블러처리)
</c:if>
<c:if test="${logStatus == 'Y'}">
	<c:forEach var="vo" items="${StudyList}">
		<li>
			<ul>
				<li><a href="/study_home/study_info?study_num=${vo.study_num}"><img src="/upload/study_room/${vo.study_img}" width="100px"/></a></li>
				<li>[ ${vo.study_type_name} ]</li>
				<li>스터디명: ${vo.study_name}</li>
				<li>${vo.start_date} - ${vo.finish_date}</li>	
				<c:if test="${vo.is_mentor == 'T'}">
					<li>멘토</li>
				</c:if>
				<c:if test="${vo.is_mentor == 'F'}">
					<li>자율</li>
				</c:if>
				<li>${vo.lang01}&nbsp;${vo.lang02}&nbsp;${vo.lang03}&nbsp;${vo.tag01}&nbsp;${vo.tag02}</li>
			</ul>
		</li>
	</c:forEach>
</c:if>
</ul>