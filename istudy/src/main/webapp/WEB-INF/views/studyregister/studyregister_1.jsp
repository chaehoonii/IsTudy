<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<!-- ////////////////////스터디 종류, 분류//////////////////////////////// -->
<div id="sub_register_content">
	<div class="register_title">
		<h2>스터디 정보 등록</h2>
	<hr/>
	</div>
	<div class="register_page1">
		<div class="study_host">
			<h3>▶스터디 종류</h3><br/>
			<div class="host_grid">
				<div id="host_box">
					<p>멘토 스터디</p>
					<img src="/images/studyregister/mentor.png"/>
					<input type="radio" name="is_mentor" value="T"/>
			</div>
			<div id="host_box">
				<p>일반 스터디</p>
				<img src="/images/studyregister/user.png"/>
				<input type="radio" name="is_mentor" value="F"/> <!-- 클래스 이름 공통으로 주고, 클래스.value! --> 
			</div>
			</div>
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