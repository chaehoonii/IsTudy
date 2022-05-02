<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<ul id="mentor_rec_list">
	<c:forEach var="vo" items="${MentorList}">
		<li>
			<ul>
				<li><img src="/upload/user/${vo.profile_img}"/></li>
				<li><img src="${vo.level_icon}"/> ${vo.user_nick}</li>
				<li>${vo.career}</li>
			</ul>
		</li>
	</c:forEach>
</ul>