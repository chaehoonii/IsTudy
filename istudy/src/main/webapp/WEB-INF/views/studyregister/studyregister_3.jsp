<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<div id="sub_register_content">
	<div class="register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<div class="people_status_grid">
		<div class="study_people">
			<h3>▶스터디 모집 인원</h3>
			<input type="number" id="people_set" name="max" /> 
			<input type="submit" value="확인" id="people_set_btn" />
		</div>
		<div class="register_page3">
			<div class="study_status">
				<h3>▶스터디 상태</h3>
				<div id="status_box">
					<input type="text" id="status_txt" value="신규 모집" /> 
					<input type="radio" id="status_radio "name="status_radio" />
				</div>
				<div id="status_box">
					<input type="text" id="status_txt" value="추가 모집" /> 
					<input type="radio" id="status_radio" name="status_radio" />
				</div>
			</div>
		</div>
	</div>	
		<div class="study_caution">
			<h3>▶스터디 주의사항</h3>
			<textarea id="caution_text" placeholder="스터디 주의 사항을 500자 이내로 입력하세요."></textarea>
		</div>
		<div class="moving_button">
			<input type="button" value="PREVIOUS" id="previous_button" onclick="asyncMovePage('studyregister_2')"> 
			<input type="button" value="NEXT" id="next_button" onclick="asyncMovePage('studyregister_4')">
		</div>
		<input type="submit" id="register_page3_btn" />
	</div>
</div>