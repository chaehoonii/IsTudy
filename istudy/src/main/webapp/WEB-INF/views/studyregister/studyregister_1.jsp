<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<!-- ////////////////////스터디 종류, 분류//////////////////////////////// -->
<div id="sub_register_content">
	<div class="register_title">
		<h2>스터디 정보 등록</h2>
	<hr/>
	</div>
	<div class="register_page1">
		<div class="study_title">
			<h3>▶스터디 제목</h3>
			<input type="text" name="study_name" id="s_title" placeholder="20자 이내로 입력해주세요." maxlength="20">
			<input type="submit" id="register_title_btn" value="확인"/>
		</div>
		<div class="study_kinds">
			<h3>▶스터디 분류</h3><br/>
			<div class="kinds_grid">
			<div id="kinds_box">
				<p>프론트엔드</p>
				<img src="/images/studyregister/frontend.png"/>
				<input type="radio" name="study_type_num" value="1"/>
			</div>
			<div id="kinds_box">
				<p>백엔드</p>
				<img src="/images/studyregister/backend.png"/>
				<input type="radio" name="study_type_num" value="2"/>
			</div>
			<div id="kinds_box">
				<p>알고리즘</p>
				<img src="../../images/studyregister/algorithm.png"/>
				<input type="radio" name="study_type_num" value="3"/>
			</div>
			<div id="kinds_box">
				<p>프로젝트</p>
				<img src="/images/studyregister/project.png"/>
				<input type="radio" name="study_type_num" value="4"/>
			</div>
			<div id="kinds_box">
				<p>영어</p>
				<img src="/images/studyregister/english.png"/>
				<input type="radio" name="study_type_num" value="5"/>
			</div>
			</div>
		</div>
		<input type="submit" value="확인" id="register_page1_btn" />
		<hr/>
	</div>
	<input type="button" value="NEXT" id="next_button1" onclick="asyncMovePage('studyregister_2')">
</div>