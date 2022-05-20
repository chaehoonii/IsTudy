<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	$("#calendar_box2").on("click",function(e){
	
		//console.log(e.currentTarget)
		//$(e.currentTarget).children().off('dateClick');
		//e.preventDefault();
		//e.stopPropagation();
		//e.stopImmediatePropagation();
		
		//if(e.target!==e.currentTarget) {
			location.href='/study/calendar/calendarList?study_num='+${study_num};
		//	return;
		//}
	});
	
});
</script>
<style>
#calendar_box{
	width:30vw;
	position:absolute;
	top:0;
	left:10vw;
}
#calendar_box2{
	width:30vw;
	height:40vw;
	position:absolute;
	top:0;
	left:10vh;
	z-index:10;
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
	top:62vh;
	left:25vh;
	cursor:pointer;
}
</style>
<div style='height:87vh; position:relative;'>
	<div id='calendar_box'>
		<%@include file="calendar/calendarList.jsp"%>
	</div>
	<div id='calendar_box2'></div>
	<div>
		<img src='/images/study_room/screen01.png' id='screen_img'/>
	</div>
</div>
<div style="clear:both"></div>
