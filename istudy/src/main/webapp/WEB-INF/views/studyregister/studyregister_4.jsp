<link rel="stylesheet" href="/css/studyregister/studyregister.css"
	type="text/css" />
<div id="sub_register_content">
	<div class="register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<form class="register_page4">
		<div class="study_period">
			<h3>▶스터디 기간</h3><br/>
			From.&nbsp;&nbsp;<input type="date" id="todayDate" name="start_date">&nbsp;&nbsp;&nbsp;&nbsp;
			To.&nbsp;&nbsp;<input type="date" name="final_date">
		</div>
		<script src="/js/studyregister/currentDate.js"></script>
		<div class="study_language">
			<h3>▶스터디 사용 언어</h3>
			<div class="ox_container">
			<div class="o_container">
				<p>사용하는 언어<p>		
			</div>
			<div class="x_container">
			<p>사용하지 않는 언어<p>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="1">HTML</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="2">CSS</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="3">JavaScript</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="4">Python</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="5">Java</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="6">C++</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="7">Kotlin</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="8">Swift</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="9">PHP</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="10">Go</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="11">C#</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="12">SQL</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="13">Scala</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="14">R</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="15">Bash</div>
				</div>
				<div class="draggable" draggable="true">
					<span class="ico-drag"></span>
					<div class="el" name="lang_type_name" value="16">Shell</div>
				</div>
	
				
			</div>
			<script src="/js/studyregister/dragDrop.js"></script>
			</div>
		</div>
		<div class="tag_select">
			<h3>▶스터디룸 TAG</h3>
			<div id='tag_div'>
				<ul id='tag_ul_big'>
					<li>
						<ul id='tag_ul'>
							<li># : <input type="text" name="tag" class='tag_box' /></li>
						</ul>
					</li>
					<li><img src='/images/studyregister/plus.png' id='plus'
						onclick='PlusTag()' /></li>
				</ul>
			</div>
			<script src="/js/studyregister/tagSelect.js"></script>
		</div>
		<input type="submit" value="확인" id="register_page4_btn" />
	</form>
	<input type="button" value="PREVIOUS" id="previous_button1"
		onclick="asyncMovePage('studyregister_3')">
</div>