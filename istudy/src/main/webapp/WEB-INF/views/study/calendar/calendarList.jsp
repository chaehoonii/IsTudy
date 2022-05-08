<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href='/lib/main.css' rel='stylesheet' />
<script src='/lib/main.js'></script>
<script src='/js/study/calendar.js'></script>
<link rel="stylesheet" href="/css/study/studyCalendar.css" type="text/css" />

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