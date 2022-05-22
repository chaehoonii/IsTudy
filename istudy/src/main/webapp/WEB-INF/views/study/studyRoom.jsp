<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/studyhome/studyRoom.css" type="text/css" />

<script>
$(document).ready(function(){
	$("#calendar_box2").on("click",function(e){
			location.href='/study/calendar/calendarList?study_num='+${study_num};
	});
	
});
</script>

<div style='height:92vh; position:relative;'>
	<div id='name_div'>
		<span id='name_span'>${vo.study_name}</span>
	</div>
	<div id='calendar_box_parent'>
		<div id='calendar_box'>
			<%@include file="calendar/calendarList.jsp"%>
		</div>
		<div id='calendar_box2'></div>
	</div>
	<div>
		<img src='/images/study_room/screen01.png' id='screen_img' onclick="location.href='/study/webSocket/studyPage?study_num=${study_num}'" title='화면공유'/>
	</div>
	<div>
		<table id='mate_table'>
			<thead>
				<tr>
					<td>스터디원</td>
					<td>게시글 수</td>
				</tr>
			</thead>
			<c:forEach var='vo' items='${mateList}'>
				<tr>					
					<td>${vo.user_nick}</td>
					<td>${vo.contribute}</td>
				</tr>
			</c:forEach>		
		</table>
	</div>
</div>
<div style="clear:both"></div>
