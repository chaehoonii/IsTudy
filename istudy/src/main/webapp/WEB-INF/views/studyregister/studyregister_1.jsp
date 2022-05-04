<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<!-- ////////////////////스터디 종류, 분류//////////////////////////////// -->
<div id="sub_register_content">
	<h2>스터디 정보 등록</h2>
	<hr/>
	<div class="study_host">
		<h3>스터디 종류</h3>
		<div id="host_box">
			<p>멘토 스터디</p>
			<img src="#"/>
			<input type="radio" name="is_mentor" value="T"/>
		</div>
		<div id="host_box">
			<p>일반 스터디</p>
			<img src="#"/>
			<input type="radio" name="is_mentor" value="F"/> <!-- 클래스 이름 공통으로 주고, 클래스.value! --> 
		</div>
	</div>
	<div class="study_kinds">
		<h3>스터디 분류</h3>
		<div id="kinds_box">
			<p>프론트엔드</p>
			<img src="#"/>
			<input type="radio" name="study_type_num" value="1"/>
		</div>
		<div id="kinds_box">
			<p>백엔드</p>
			<img src="#"/>
			<input type="radio" name="study_type_num" value="2"/>
		</div>
		<div id="kinds_box">
			<p>알고리즘</p>
			<img src="#"/>
			<input type="radio" name="study_type_num" value="3"/>
		</div>
		<div id="kinds_box">
			<p>프로젝트</p>
			<img src="#"/>
			<input type="radio" name="study_type_num" value="4"/>
		</div>
		<div id="kinds_box">
			<p>영어</p>
			<img src="#"/>
			<input type="radio" name="study_type_num" value="5"/>
		</div>
	</div>
	<input type="button" value="다음" id="next_button" onclick="asyncMovePage('studyregister_2')">
</div>