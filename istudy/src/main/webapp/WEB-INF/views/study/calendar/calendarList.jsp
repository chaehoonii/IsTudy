<link href='/lib/main.css' rel='stylesheet' />
<script src='/lib/main.js'></script>

<script>
//수정폼 색상선택 에러
//수정폼 VO 값 못찾는 에러
  document.addEventListener('DOMContentLoaded', function() {
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
			    var calendar = new FullCalendar.Calendar(calendarEl, {
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
	 		//일정 클릭 시 일정상세 모달 띄우기
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
					
						var msg="";
						msg += "<form method='post' id='editPlanForm'>";
						msg += "<input type='hidden' name='plan_num' value='"+r.plan_num+"'/>";
						msg += "<li><br/>일정 제목 &emsp; <input type='text' name='plan_name' class='yescenter' id='input_plan_name' value='"+r.plan_name+"'/>&emsp;&emsp;";
						msg += "<select name='color_num' onchange='changeSelection02()' class='select_color02' value='"+r.color_num+"' style='background-color:"+r.color_name+"'>";
						msg += "<option value='1' class='option_color' style='background-color: #B97687'></option>";
						msg += "<option value='2' class='option_color' style='background-color: #B57FB3'></option>";
						msg += "<option value='3' class='option_color' style='background-color: #EACACB'></option>";
						msg += "<option value='4' class='option_color' style='background-color: #F6B99D'></option>";
						msg += "<option value='5' class='option_color' style='background-color: #F5DDAD'></option>";
						msg += "<option value='6' class='option_color' style='background-color: #C6D2BE'></option>";
						msg += "<option value='7' class='option_color' style='background-color: #C3E2DD'></option>";
						msg += "<option value='8' class='option_color' style='background-color: #83B1C9'></option>";
						msg += "<option value='9' class='option_color' style='background-color: #838BB2'></option></select></li>";
						msg += "<li><br/>시작일: &emsp;<input type='date' value='"+r.plan_start+"' name='plan_start' id='select_plan_start' class='time_selector'>&emsp;&emsp;<input type='time' value='"+r.start_time+"' name='start_time' class='time_selector'></li>";
						msg += "<li>종료일: &emsp;<input type='date' value='"+r.plan_finish+"' name='plan_finish' id='select_plan_finish' class='time_selector'>&emsp;&emsp;<input type='time' value='"+r.finish_time+"' name='finish_time' class='time_selector'></li>";
						msg += "<hr /><li class='nocenter'><br/>&emsp;&emsp;&emsp;일정 내용</li>";
						msg += "<li><br/><textarea name='plan_detail' rows='5' cols='40' class='graySquare'>"+r.plan_detail+"</textarea><br/></li></form>";

						$("#viewPlan").append(msg);
						$('#viewPlanModal').on('hidden.bs.modal', function (e) {  //모달 닫으면
							$("#viewPlan").text("");	//폼 초기화
						});
					}
				});
			 	
			 	//일정 삭제
			 	$(document).on("click","#delPlanbtn",function(){
			 		if(confirm('일정을 삭제하시겠습니까?')){
					 	var param2 = {
					 		"plan_num": info.event.groupId,
					 		"study_num": info.event.id
					 	} 	//ajax로 보내기
						console.log(param2);
					 	$.ajax({
							url : '/study/calendar/calendarDel',
							type : 'GET',
							dataType : 'text',
							data :param2,
							success : function(r){
								console.log("delete ok");
								location.reload();
							},
							error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
					 	});
			 		}
				}); 
			 	//일정 수정
			 	$(document).on("click","#editPlanbtn",function(){
			 		if(confirm('바꾼 내용으로 일정을 수정하시겠습니까?')){
			 			 var param3 = $("#editPlanForm").serialize(); 	//ajax로 폼 내용 보내기 //error!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
						console.log(param3);
					 	$.ajax({
							url : '/study/calendar/calendarEdit',
							type : 'POST',
							dataType : 'json',
							data :param3,
							success : function(r){
								console.log("edit ok");
								//수정된 내용 불러오기
								$("#viewPlan").text(""); //폼 초기화
								var msg="";
								msg += "<form method='post' id='editPlanForm'>";
								msg += "<input type='hidden' name='plan_num' value='"+r.plan_num+"'/>";
								msg += "<li><br/>일정 제목 &emsp; <input type='text' name='plan_name' class='yescenter' id='input_plan_name' value='"+r.plan_name+"'/>&emsp;&emsp;";
								msg += "<select name='color_num' onchange='changeSelection02()' class='select_color02' value='"+r.color_num+"' style='background-color:"+r.color_name+"'>";
								msg += "<option value='1' class='option_color' style='background-color: #B97687'></option>";
								msg += "<option value='2' class='option_color' style='background-color: #B57FB3'></option>";
								msg += "<option value='3' class='option_color' style='background-color: #EACACB'></option>";
								msg += "<option value='4' class='option_color' style='background-color: #F6B99D'></option>";
								msg += "<option value='5' class='option_color' style='background-color: #F5DDAD'></option>";
								msg += "<option value='6' class='option_color' style='background-color: #C6D2BE'></option>";
								msg += "<option value='7' class='option_color' style='background-color: #C3E2DD'></option>";
								msg += "<option value='8' class='option_color' style='background-color: #83B1C9'></option>";
								msg += "<option value='9' class='option_color' style='background-color: #838BB2'></option></select></li>";
								msg += "<li><br/>시작일: &emsp;<input type='date' value='"+r.plan_start+"' name='plan_start' id='select_plan_start' class='time_selector'>&emsp;&emsp;<input type='time' value='"+r.start_time+"' name='start_time' class='time_selector'></li>";
								msg += "<li>종료일: &emsp;<input type='date' value='"+r.plan_finish+"' name='plan_finish' id='select_plan_finish' class='time_selector'>&emsp;&emsp;<input type='time' value='"+r.finish_time+"' name='finish_time' class='time_selector'></li>";
								msg += "<hr /><li class='nocenter'><br/>&emsp;&emsp;&emsp;일정 내용</li>";
								msg += "<li><br/><textarea name='plan_detail' rows='5' cols='40' class='graySquare'>"+r.plan_detail+"</textarea><br/></li></form>";

								$("#viewPlan").append(msg);
								$('#viewPlanModal').on('hidden.bs.modal', function (e) {  //모달 닫으면
									$("#viewPlan").text("");	//폼 초기화
								});
							},
							error:function(request,status,error){
						        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
						    }
					 	});
			 		}
				}); 
			});
 		}//end.success
	});
});	
	$(document).ready(function(){
		//일정등록 버튼
		$('#addPlanbtn').click(function(){
			if(confirm('일정을 등록하시겠습니까?')){
				$('#addPlanForm').submit();	//일정 등록
				$('#addPlanModal').modal('hide');	//모달 종료
			}
		});
		//취소 버튼
		$('.Planbtns').click(function(){
			$('#addPlanModal').modal('hide');	//모달 종료
			$('#viewPlanModal').modal('hide');	//모달 종료
		});
		// 모달 종료 시, 폼의 전체 값 초기화 처리 
		$('#addPlanModal').on('hidden.bs.modal', function (e) {  
			document.forms['addPlanForm'].reset();
		});
		//등록폼 색상 select
		function changeSelection() {
			$('.select_color').css('background-color', $('.select_color option:selected').css('background-color'));	//색 변경
			$('.select_color').val($('.select_color option:selected').val());	//value 변경
		}
		//수정폼 색상 select
		function changeSelection02() {
			$('.select_color02').val($('.select_color02 option:selected').val());	//value 변경
			$('.select_color02').css('background-color', $('.select_color02 option:selected').css('background-color'));	//색 변경
		}
	});
</script>
<style>

  #calendar_container {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }
  .select_color{
	  appearance:none; 
	  background-color:#EACACB; 
	  width:40px; 
	  font-size:25px; 
	  border: none;  
  }
  .select_color02{
	  appearance:none; 
	  width:40px; 
	  font-size:25px; 
	  border: none;
  }
	#input_plan_name{
		border: 2px solid #bbb;
		border-right:0px; 
		border-top:0px; 
		border-left:0px; 
		
	}
	.time_selector{
		border-right:0px; 
		border-top:0px; 
		border-left:0px; 
		border-bottom:0px;
	}
	
	.nocenter{
		text-align:left;
	}
	.yescenter{
		text-align:center;
	}
	.Planbtns{
		background:none;
		border:  2px solid #bbb;
		border-radius:5px;
	}
	#addPlanModalBody{
		font-size:14px;
		text-align:center;
	}
	#viewPlanModalBody{
		font-size:14px;
		text-align:center;
	}
	.graySquare{
		resize:none;
		border: 2px solid #bbb;
		border-radius:5px;
		padding:20px;
	}
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
					<form method="post" id="addPlanForm" action="/study/calendar/calendarWrite">
					<input type="hidden" name="study_num" id="study_num"/> 
						<ul>
							<li><br/>일정 제목 &emsp; <input type="text" name="plan_name" id="input_plan_name" class='yescenter'/>&emsp;&emsp;
							<select name="color_num" onchange="changeSelection()" class="select_color">
									<option value="1" class="option_color" style="background-color: #B97687"></option>
									<option value="2" class="option_color" style="background-color: #B57FB3"></option>
									<option value="3" class="option_color" style="background-color: #EACACB" selected></option>
									<option value="4" class="option_color" style="background-color: #F6B99D"></option>
									<option value="5" class="option_color" style="background-color: #F5DDAD"></option>
									<option value="6" class="option_color" style="background-color: #C6D2BE"></option>
									<option value="7" class="option_color" style="background-color: #C3E2DD"></option>
									<option value="8" class="option_color" style="background-color: #83B1C9"></option>
									<option value="9" class="option_color" style="background-color: #838BB2"></option>
								</select>
							</li>
							<li><br/>시작일: &emsp;<input type="date" name="plan_start" id="select_plan_start" class="time_selector">&emsp;&emsp;<input type="time" value="12:00" name="start_time" class="time_selector"></li>
							<li>종료일: &emsp;<input type="date" name="plan_finish" id="select_plan_finish" class="time_selector">&emsp;&emsp;<input type="time" value="12:00" name="finish_time" class="time_selector"></li>
							
							<hr />
							<li class="nocenter"><br/>&emsp;&emsp;&emsp;일정 내용</li>
							<li><br/><textarea name="plan_detail" rows="5" cols="40" class="graySquare"></textarea><br/></li>
							<li>
								<br/><input type='button' value='일정 등록' id="addPlanbtn" class="Planbtns"/>
								&emsp;<input type='button' value='취소' class="Planbtns"/><br/><br/>
							</li>
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
				
				<ul id="viewPlan">				
				</ul>
					<ul>
						<li>
							<br/><input type='button' value='수정' id="editPlanbtn" class="Planbtns"/>
							&emsp;<input type='button' value='삭제' id="delPlanbtn" class="Planbtns"/>
							&emsp;<input type='button' value='취소' class="Planbtns"/><br/><br/>
						</li>
					</ul>
			</div>
		</div>
	</div>
</div>