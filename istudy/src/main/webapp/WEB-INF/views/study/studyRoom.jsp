<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$("#calendar_box2").on("click",function(e){
			location.href='/study/calendar/calendarList?study_num='+${study_num};
	});
	
});
</script>
<style>
#name_div{
	text-align:center;
}
#name_span{
	margin:0 auto;
	border-radius:5px;
	padding:10px;
	font-size:20px;
	background-color:#eee;
	width: auto;
	position:relative;
	top:100px;
	text-align:center;
}
#calendar_box{
	width:30vw;
	height:60vh;
	position:absolute;
	top:5vh;
	left:10vw;
}
#calendar_box2{
	width:30vw;
	height:60vh;
	position:absolute;
	top:5vh;
	left:10vw;
	z-index:10;
	cursor:pointer;
}
}
.fc-button-group, .fc-toolbar-chunk button[type=button], #room_img{
	display:none;
}
.fc-view table, tbody{
	border-radius:10px;
}
#screen_img{
	width:10vw;
	position:absolute;
	top:67vh;
	left:12vw;
	cursor:pointer;
}
#mate_table{
	position:absolute;
	top:70vh;
	left:25vw;
	width:12vw;
	line-height:30px;
	font-size:15px;
	border-radius:5px;
	text-align:center;
	padding:10px;
}
#mate_table thead{
	font-size:18px;
	background-color:#eee;
}
#mate_table tr, td{
	border:1px solid #ddd;
}
</style>
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
					<td>순위</td>
					<td>스터디원</td>
				</tr>
			</thead>
			<c:forEach var='vo' items='${mateList}' varStatus="status">
				<tr>					
					<td>${status.count}</td>
					<td>${vo.user_nick}</td>
				</tr>
			</c:forEach>		
		</table>
	</div>
</div>
<div style="clear:both"></div>
