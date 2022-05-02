
<link href='../lib/main.css' rel='stylesheet' />
<script src='../lib/main.js'></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
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
		 	alert(info.dateStr);
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
