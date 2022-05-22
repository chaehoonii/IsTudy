<link rel="stylesheet" href="/css/studyregister/studyregister.css"
	type="text/css" />

<script>
	$(function(){
		$("form>div").css("display","none");
		$("form>.sub_register_content").first().css("display","block");
		
		$(".next_button").click(function(){
			$("form>div").css("display","none");
			$(this).parent().parent().next().css("display","block");
		});
		$(".previous_button").click(function(){
			
			$("form>div").css("display","none");
			$(this).parent().parent().prev().css("display","block");
		});
	
	
	$(".r_button").on('click', function() {
		
		//필수 데이터 입력 여부
		let study_name = document.getElementById("study_name");
		let study_type_num = $("#register_form input[name='study_type_num']:checked").val();
		let study_img = $("#register_form input[name='study_img']").val();
		let study_rule = document.getElementById("caution_text");
		let start_date = document.getElementById("todayDate");
		let finish_date = document.getElementById("final_date");
		let lang_type_name = $("#register_form input[name='lang_type_name']").val();
		
		//스터디 이름 
		var regname = /^[가-힣a-zA-Z0-9]{1,20}$/;

		if (!regname.test(study_name.value)) {
			alert("스터디 이름을 20자리 이하로 만들어주세요.");
			study_name.focus();
			return false;
		}
		if (study_name.value == '') {
			alert("스터디 이름을 입력하세요.");
			study_name.focus();
			return false;
		}
		
		//스터디 종류
		if ( study_type_num == null) {
			alert("스터디 분류를 체크해주세요");
			return false;
		}
		
		//스터디 이미지
		//var study_img = $('#file').val();

		if($('#file').val() == "") {
			alert("대표이미지는 필수입니다!");
    		$("#file").focus();
    		return;
		}
		
		//스터디 내용
		var study_content1 = $('#info_1').val();

		if($('#info_1').val() == "") {
			alert("스터디 내용을 입력해주세요!");
    		$("#info_1").focus();
    		return;
		}
		
		var study_content2 = $('#info_2').val();

		if($('#info_2').val() == "") {
			alert("스터디 상세내용을 입력해주세요!");
    		$("#info_2").focus();
    		return;
		}
		//스터디 인원
	
		//스터디 규칙
		if (study_rule.value == '') {
			alert("스터디 규칙을 입력해주세요.");
			study_rule.focus();
			return false;
		}
		//스터디 기간
		if (finish_date.value == '') {
			alert("종료 날짜를 선택해주세요.");
			finish_date.focus();
			return false;
		}
		//스터디 사용 언어
		if($('#seleted_lang').val() == null) {
			alert("123!");
    		$("#seleted_lang").focus();
    		return;
		}
		

		if(confirm('글을 등록하시겠습니까?')){
			$("#sub_register_form").submit();
		}				
		
	})

	});
</script>

<!-- ///////////////////////////사이드 메뉴//////////////////////////////// -->
<div class="sidebar">
	<div class="header" role="banner">
  		<h1 class="logo">
    		<a href="#"><span>I </span>s<span>T</span>udy</a>
  		</h1>
  	<div class="nav-wrap">
    	<nav class="main-nav" role="navigation">
      		<ul class="unstyled list-hover-slide">
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_1')">Step 1</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_2')">Step 2</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_3')">Step 3</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_4')">Step 4</a></li>
      		</ul>
      	<input type="button" name="r_button" class="r_button" value="등록">
    	</nav>
    
  </div>
</div>
</div>   
<form id="register_form" action="/studyregister/studyRegisterOk" method="post" enctype="multipart/form-data">
<!-- --------------------Step 1--------------------------- -->
<div class="sub_register_content">
	<div class="sub_register_title">
		<h2>스터디 정보 등록</h2>
	<hr/>
	</div>
	<div class="register_page1">
		<div class="study_title">
			<h3>▶스터디 제목</h3>
			<input type="text" name="study_name" id="study_name" placeholder="20자 이내로 입력해주세요." maxlength="20">
		</div>
		<div class="study_kinds">
			<h3>▶스터디 분류</h3><br/>
			<div class="kinds_grid">
			<div class="kinds_box">
				<p>프론트엔드</p>
				<img src="/images/studyregister/frontend.png"/>
				<input type="radio" name="study_type_num" class="study_type_num" value="1"/>
			</div>
			<div class="kinds_box">
				<p>백엔드</p>
				<img src="/images/studyregister/backend.png"/>
				<input type="radio" name="study_type_num" class="study_type_num" value="2"/>
			</div>
			<div class="kinds_box">
				<p>알고리즘</p>
				<img src="../../images/studyregister/algorithm.png"/>
				<input type="radio" name="study_type_num" class="study_type_num" value="3"/>
			</div>
			<div class="kinds_box">
				<p>프로젝트</p>
				<img src="/images/studyregister/project.png"/>
				<input type="radio" name="study_type_num" class="study_type_num" value="4"/>
			</div>
			<div class="kinds_box">
				<p>영어</p>
				<img src="/images/studyregister/english.png"/>
				<input type="radio" name="study_type_num" class="study_type_num" value="5"/>
			</div>
			</div>
		</div>
		<hr/>
	</div>
	<div class="moving_button02">
		<input type="button" value="NEXT" class="next_button" id="next_button"/>
	</div>
</div>
<!-- --------------------Step 2--------------------------- -->
<div class="sub_register_content">
	<div class="sub_register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<div class="register_page2">
		<div class="study_image">
			<h3>▶스터디 대표 이미지</h3>
			<div class="file-wrapper flie-wrapper-area">
  				<div class="float-left">
   				<input type="file" name="study_img" id="file" class="upload-box upload-plus" accept="image/*">
  		  		<div id="preview"></div>
   		 		<div class="file-edit-icon">
	      			<a href="#" class="preview-edit">수정</a>
	      			<a href="#" class="preview-de">삭제</a>
    			</div>
  				</div>
			</div>
		</div>
		<script src="/js/studyregister/imageUpload.js"></script>
		<div class="study_info">
			<h3>▶스터디 내용</h3>
			<div class="info_box">
				<textarea id="info_1" placeholder="스터디 내용을 입력하세요"></textarea>
				<textarea id="info_2" placeholder="상세내용을 입력하세요"></textarea><br/>
			</div>
		</div>
	</div>
	<div class="moving_button">
		<input type="button" value="PREVIOUS" class="previous_button" id="previous_button">
		<input type="button" value="NEXT" class="next_button" id="next_button">
	</div>
</div>
<!-- --------------------Step 3--------------------------- -->
<div class="sub_register_content">
	<div class="sub_register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<div class="register_page3">		
		<div class="study_people">
			<h3>▶스터디 모집 인원</h3>
			<input type="number" id="people_set" name="max" value="2" min="2" /> 
		</div>
		
		<div class="study_caution">
			<h3>▶스터디 규칙</h3>			
			<textarea id="caution_text" placeholder="스터디 규칙을 500자 이내로 입력하세요."></textarea>
		</div>
	</div>
	<div class="moving_button">
		<input type="button" value="PREVIOUS" class="previous_button" id="previous_button">			
		<input type="button" value="NEXT" class="next_button" id="next_button">
	</div>	
</div>
<!-- --------------------Step 4--------------------------- -->
<div class="sub_register_content">
	<div class="sub_register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<div class="register_page3">
		<div class="study_period">
			<h3>▶스터디 기간</h3><br/>
			From.&nbsp;&nbsp;<input type="date" id="todayDate" name="start_date">&nbsp;&nbsp;&nbsp;&nbsp;
			To.&nbsp;&nbsp;<input type="date" id="final_date" name="final_date">
		</div>
		<script src="/js/studyregister/currentDate.js"></script>
		<div class="study_language">
			<h3>▶스터디 사용 언어</h3>
			<div class="ox_container">
			<div class="o_container" id="selected_lang" name="selected_lang">
				<p>사용하는 언어<p>		
			</div>
			<div class="x_container">
			<p>사용하지 않는 언어<p>
				<div class="draggable" draggable="true" >
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
				<li><img src='/images/studyregister/plus.png' id='plus' onclick='PlusTag()' /></li>
			</ul>
		</div>
		<script src="/js/studyregister/tagSelect.js"></script>
	</div>
	</div>
	<div class="moving_button02">
		<input type="button" value="PREVIOUS" class="previous_button" id="previous_button">
	</div>	
</div>
</form>
<div style="clear: both"></div>



