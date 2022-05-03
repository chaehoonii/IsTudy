<link href='/lib/main.css' rel='stylesheet' />
<script src='/lib/main.js'></script>

<script>

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
					events.start = data[i].plan_start;
					events.end = data[i].plan_finish;
					events.color = data[i].color_name;
					  
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
	  	
 		}//end.success
	});
});
	//일정 색상 select
	function changeSelection() {
		$('#select_color').css('background-color', $('#select_color option:selected').css('background-color'));
		$('#select_color').val($('#select_color option:selected').val());
	}
	
	$(document).ready(function(){
		//일정등록 버튼
		$('#addPlanbtn').click(function(){
			if(confirm('일정을 등록하시겠습니까?')){
				$('#addPlanForm').submit();	//일정 등록
				$('#addPlanModal').modal('hide');	//모달 종료
			}
		});
		//취소 버튼
		$('#dismissPlan').click(function(){
			$('#addPlanModal').modal('hide');	//모달 종료
		});
		// 모달 종료 시, 폼의 전체 값 초기화 처리 
		$('#addPlanModal').on('hidden.bs.modal', function (e) {  
			document.forms['addPlanForm'].reset();
		});
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
  #select_color{
	  appearance:none; 
	  background-color:#EACACB; 
	  width:50px; 
	  font-size:30px; 
	  border: none;
	  
  }
  #addPlanModal{
  	text-align: center;
  }
  #select_color:hover option {
		background: white;
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
	#textarea_plan_detail{
		resize:none;
		border: 2px solid #bbb;
		border-radius:5px;
	}
	.nocenter{
		text-align:left;
	}
	.yescenter{
		text-align:center;
	}
	.addPlanbtns{
		background:none;
		border:  2px solid #bbb;
		border-radius:5px;
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
				<h3 class="modal-title w-100">&emsp;스터디 일정 등록</h3>
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
					<form method="post" id="addPlanForm" action="/study/calendar/calendarWrite">
					<input type="hidden" name="study_num" id="study_num"/> 
						<ul>
							<li>일정 제목 &emsp; <input type="text" name="plan_name" id="input_plan_name"/>&emsp;&emsp;
							<select name="color_num" onchange="changeSelection()" id="select_color">
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
							<li class="nocenter">&emsp;&emsp;일정 내용</li>
							<li><br/><textarea name="plan_detail" rows="5" cols="40" id="textarea_plan_detail"></textarea><br/></li>
							<li>
								<br/><input type='button' value='일정 등록' id="addPlanbtn" class="addPlanbtns"/>
								&emsp;<input type='button' value='취소' id="dismissPlan"class="addPlanbtns" />
							</li>
						</ul>
					</form>
			</div>
		</div>
	</div>
</div>