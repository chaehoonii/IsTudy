<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='/lib/main.css' rel='stylesheet' />
<script src='/lib/main.js'></script>
<link rel="stylesheet" href="/css/study/studyCalendar.css" type="text/css" />

<script>
	$(document).ready(function(){
		var calendar;
		function setCalendar(){
		  	var url = "/study/calendar/calendarLists";
		  	var pathname = decodeURIComponent(location.href);
			var study_num = pathname.substring( pathname.indexOf('=')+1);
			$('#study_num').val(study_num);
			var param = {"study_num" : study_num};
			console.log(param);
		
		  	$.ajax({
				url : url,
				type : 'GET',
				dataType : 'json',
				data :param,
				success : function(data){
					//JsonArray에 일정 세팅
					var aJsonArray = new Array();
					console.log('length', data.length)
					for (var i = 0; i < data.length; i++) {  
						var events = new Object();
						events.title = data[i].plan_name;
						events.start = data[i].plan_start+"T"+data[i].start_time;
						events.end = data[i].plan_finish+"T"+data[i].finish_time;
						events.color = data[i].color_name;
						events.groupId = data[i].plan_num;	//event.groupId 로 일정넘버 설정
						events.id = data[i].study_num;
						  
						 aJsonArray.push(events);		
						 console.log(events);
					}
					console.log(aJsonArray);
					let today = new Date();
					console.log("today: "+today);
				    var calendarEl = document.getElementById('calendar');
				   	calendar = new FullCalendar.Calendar(calendarEl, {
					      headerToolbar: {
					        left: 'prev,next today',
					        center: 'title',
					        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
					      },
					      initialDate: today,
					      navLinks: true, // can click day/week names to navigate views
					      businessHours: true, // display business hours
					      editable: true,
					      selectable: true,
					      events: aJsonArray	//JsonArray 불러오기
				    });
				   	
			  		calendar.render();
							
			  	   
			 		//날짜 클릭 시 플랜입력 모달 띄우기 
				  	calendar.on('dateClick', function(info) {
					 	$('#addPlanModal').modal();
					 	$('#select_plan_start').val(info.dateStr);
					 	$('#select_plan_finish').val(info.dateStr);
					 	
					}); 
			 		//일정 클릭 시 일정상세 모달 띄우기------------------------------------------------------------------------------------------------------
				  	calendar.on('eventClick', function(info) {
					 	$('#viewPlanModal').modal();	//모달 열기
		
					 	var param1 = {"plan_num":info.event.groupId}	//일정넘버 ajax로 보내기
					 	
					 	$.ajax({
							url : '/study/calendar/calendarDetail',
							type : 'GET',
							dataType : 'json',
							data :param1,
							success : function(r){
								console.log("start detail");
								$("#study_num02").val(r.study_num);
								$("#plan_num02").val(r.plan_num);
								$("#plan_name02").val(r.plan_name);
								$("#color_num02").val(r.color_num);
								$("#color_num02").css('background-color',r.color_name);
								$("#color_name02").val(r.color_name);
								$("#start_time02").val(r.start_time);
								$("#plan_start02").val(r.plan_start);
								$("#plan_finish02").val(r.plan_finish);
								$("#finish_time02").val(r.finish_time);
								$("#plan_detail02").val(r.plan_detail);
							}
						});//디테일
					 	
					 	//일정 삭제------------------------------------------------------------------------------------------------------
					 	$("#delPlanbtn").off("click").on("click",function(){
					 		if(confirm('일정을 삭제하시겠습니까?')){
							 	var param2 = {
							 		"plan_num": info.event.groupId,
							 		"study_num": info.event.id
							 	} 	//ajax로 보내기
								console.log(param2);
							 	$.ajax({
									url : '/study/calendar/calendarDel',
									type : 'GET',
									data :param2,
									success : function(r){
										console.log("delete ok");
										$('#viewPlanModal').modal('hide');	//모달 종료	
										setCalendar();
									},
									error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								    }
							 	});
					 		}
						}); 
					 //일정 수정-----------------------------------------------------------------------------------------------------
					 	$("#editPlanForm").off("submit").on("submit",function(){ 		
					 		if(confirm('바꾼 내용으로 일정을 수정하시겠습니까?')){
					 			 var param3 = $(this).serialize(); 	//ajax로 폼 내용 보내기
								console.log(param3);
							 	$.ajax({
									url : '/study/calendar/calendarEdit',
									type : 'POST',
									data :param3,
									success : function(){
										console.log("edit ok");
										$('#viewPlanModal').modal('hide');	//모달 종료		
										setCalendar();
									},
									error:function(request,status,error){
								        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
								    }
							 	});
					 		}
					 	    
						}); //일정 수정	
					}); //일정 상세
					
				  //일정등록------------------------------------------------------------------------------------------------------
					$("#addPlanForm").off("submit").on("submit",function(){
						if(confirm('일정을 등록하시겠습니까?')){
							var param4 = $(this).serialize();
							console.log(param4);
							
						 	$.ajax({
								url : '/study/calendar/calendarWrite',
								type : 'POST',
								data :param4,
								success : function(){
									console.log("add ok");
									$('#addPlanModal').modal('hide');	//모달 종료	
									setCalendar();
								},
								error:function(request,status,error){
							        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
							    }
						 	});
						}
						return false;
					});//일정 등록
	 			}//end.달력success
		  	})//ajax
		//-----------------------------------------------------------------
		
		}//setCalendar
 		setCalendar();
		
 		//취소 버튼
 		$('.Dismissbtns').click(function(){
 			$('#addPlanModal').modal('hide');	//모달 종료
 			$('#viewPlanModal').modal('hide');	//모달 종료
 		});
	});//jQuery
		
	//-------
	
	// 모달 종료 시, 폼의 전체 값 초기화 처리 
	$('#addPlanModal').on('hidden.bs.modal', function (e) {  
		document.forms['addPlanForm'].reset();
	});
	
	
	//등록폼 색상 select
	function changeSelection() {
		console.log("01");
		$('.select_color').css('background-color', $('.select_color option:selected').css('background-color'));	//색 변경
		$('.select_color').val($('.select_color option:selected').val());	//value 변경
	}
	//수정폼 색상 select
	function changeSelection02() {
		console.log("02");
		$('.select_color02').val($('.select_color02 option:selected').val());	//value 변경
		$('.select_color02').css('background-color', $('.select_color02 option:selected').css('background-color'));	//색 변경
	}
</script>
<style>

</style>
<div id="calendar_container">
	<div id='calendar'></div>
</div>

<!-- 입력 모달 -->
<div id="addPlanModal" class="modal">
	<!-- modal -->
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h2 class="modal-title w-100">&emsp;스터디 일정 등록</h2>
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" id="addPlanModalBody">
				<form method="post" id="addPlanForm">
					<input type="hidden" name="study_num" id="study_num" />
					<ul>
						<li><br />일정 제목 &emsp; <input type="text" name="plan_name"
							class="input_plan_name"/>&emsp;&emsp; <select
							name="color_num" onchange="changeSelection()"
							class="select_color">
								<option value="1" class="option_color"
									style="background-color: #B97687"></option>
								<option value="2" class="option_color"
									style="background-color: #B57FB3"></option>
								<option value="3" class="option_color"
									style="background-color: #EACACB" selected></option>
								<option value="4" class="option_color"
									style="background-color: #F6B99D"></option>
								<option value="5" class="option_color"
									style="background-color: #F5DDAD"></option>
								<option value="6" class="option_color"
									style="background-color: #C6D2BE"></option>
								<option value="7" class="option_color"
									style="background-color: #C3E2DD"></option>
								<option value="8" class="option_color"
									style="background-color: #83B1C9"></option>
								<option value="9" class="option_color"
									style="background-color: #838BB2"></option>
						</select></li>
						<li><br />시작일: &emsp;<input type="date" name="plan_start"
							id="select_plan_start" class="time_selector">&emsp;&emsp;<input
							type="time" value="12:00" name="start_time" class="time_selector"></li>
						<li>종료일: &emsp;<input type="date" name="plan_finish"
							id="select_plan_finish" class="time_selector">&emsp;&emsp;<input
							type="time" value="12:00" name="finish_time"
							class="time_selector"></li>

						<hr />
						<li class="nocenter"><br />&emsp;&emsp;&emsp;일정 내용</li>
						<li><br /> <textarea name="plan_detail" rows="5" cols="40"
								class="graySquare"></textarea><br /></li>
						<li><br /> <input type='submit' value='일정 등록'
							id="addPlanbtn" class="Planbtns" /> &emsp;<input type='button'
							value='취소' class="Planbtns Dismissbtns" /><br /> <br /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 일정 상세, 수정 모달 -->
<div id="viewPlanModal" class="modal">
	<!-- modal -->
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header text-center">
				<h2 class="modal-title w-100">&emsp;스터디 일정 상세</h2>
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body" id="viewPlanModalBody">


				<form method='post' id='editPlanForm'>
					<input type="hidden" name="study_num" id="study_num02" /> <input
						type='hidden' name='plan_num' value='' id='plan_num02' />
					<ul id='viewPlan'>
						<li><br />일정 제목 &emsp; <input type='text' name='plan_name'
							class='input_plan_name yescenter' id='plan_name02' value='' />&emsp;&emsp;
							<select name='color_num' onchange='changeSelection02()'
							class='select_color02' id="color_num02">
								<option value='1' class='option_color'
									style='background-color: #B97687'></option>
								<option value='2' class='option_color'
									style='background-color: #B57FB3'></option>
								<option value='3' class='option_color'
									style='background-color: #EACACB'></option>
								<option value='4' class='option_color'
									style='background-color: #F6B99D'></option>
								<option value='5' class='option_color'
									style='background-color: #F5DDAD'></option>
								<option value='6' class='option_color'
									style='background-color: #C6D2BE'></option>
								<option value='7' class='option_color'
									style='background-color: #C3E2DD'></option>
								<option value='8' class='option_color'
									style='background-color: #83B1C9'></option>
								<option value='9' class='option_color'
									style='background-color: #838BB2'></option>
						</select></li>
						<li><br />시작일: &emsp;<input type='date' value=''
							name='plan_start' id='plan_start02' class='time_selector'>&emsp;&emsp;<input
							type='time' value='' name='start_time' class='time_selector'
							id='start_time02'></li>
						<li>종료일: &emsp;<input type='date' value='' name='plan_finish'
							id='plan_finish02' class='time_selector'>&emsp;&emsp;<input
							type='time' value='' name='finish_time' class='time_selector'
							id='finish_time02'></li>
						<hr />
						<li class='nocenter'><br />&emsp;&emsp;&emsp;일정 내용</li>
						<li><br /> <textarea name='plan_detail' rows='5' cols='40'
								class='graySquare' id='plan_detail02'></textarea><br /></li>
					</ul>
					<ul>
						<li><br /> 
						<input type='submit' value='수정' id='editPlanbtn' class='Planbtns' /> &emsp;
							<input type='button' value='삭제'id='delPlanbtn' class='Planbtns' /> &emsp;
							<input type='button'value='취소' class='Planbtns Dismissbtns'/>
							<br /> <br /></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
</div>