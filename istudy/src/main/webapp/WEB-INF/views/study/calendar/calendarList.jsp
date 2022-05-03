<link href='../lib/main.css' rel='stylesheet' />
<script src='../lib/main.js'></script>

<script>

  document.addEventListener('DOMContentLoaded', function() {
	  	var url = "/calendar/calendarLists";
	  	var pathname = decodeURIComponent(location.href);
		var study_num = pathname.substring( pathname.indexOf('=')+1);
		
		var param = {"study_num" : study_num};
		console.log(param);
		
	  	$.ajax({
			url : url,
			type : 'GET',
			dataType : 'json',
			data :param,
			success : function(data){
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
				      events: aJsonArray
			    });
	  	calendar.render();
	  	
    
 //날짜 클릭 시 플랜입력 모달 띄우기 
	  	calendar.on('dateClick', function(info) {
		 	console.log(info.dateStr);
		 	$('#addPlanModal').modal();
		 	
		}); 
 //일정 클릭 시 일정상세 모달 띄우기
 		}
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
	
</style>
<div id="calendar_container">
  <div id='calendar'></div>
</div>

<!-- 입력 모달 -->
<div id="addPlanModal" class="modal">
	<!-- modal -->
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h2>스터디 일정 등록</h2>
				<button class="close" data-dismiss="modal">&times;</button>
			</div>
			<div class="modal-body">
					<form method="post" id="addPlanForm">
						<ul>
							<li><select name="color_num" style="width:100px; font-size:22px; border: 1px solid black;" id="#select_color">
									<option value="1" style="background-color: #B97687"></option>
									<option value="2" style="background-color: #EACACB"></option>
									<option value="3" style="background-color: #F5DDAD"></option>
									<option value="4" style="background-color: #C3E2DD"></option>
									<option value="5" style="background-color: #F6B99D"></option>
									<option value="6" style="background-color: #C6D2BE"></option>
									<option value="7" style="background-color: #83B1C9"></option>
									<option value="8" style="background-color: #B57FB3"></option>
									<option value="9" style="background-color: #838BB2"></option>
								</select>
							</li>
							<li>시작일	</li>
							<li>종료일</li>
							<li>일정 제목 &emsp; <input type="text" name="plan_name"/></li>
							
							<hr />
							<li>일정 내용<br /> <textarea name="plan_detail" rows="5" cols="30"></textarea><br/></li>
							<li>
								<input type='submit' value='일정 등록' id="addPlanbtn" />
							</li>
						</ul>
					</form>
			</div>
		</div>
	</div>
</div>