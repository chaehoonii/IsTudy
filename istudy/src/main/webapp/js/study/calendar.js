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
					 		return false;
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
					 	    return false;
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