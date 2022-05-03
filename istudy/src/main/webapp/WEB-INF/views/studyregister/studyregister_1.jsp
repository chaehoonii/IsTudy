<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<script>
$(document).ready(function() {

	   var strData = "s1";

	    var arrStep = strData.split(',');
	   
	    $('.check').prop('checked', false); // 일단 모두 uncheck	  
	    for (var nArrCnt in arrStep) {
	                    $("input[name=s_check][value="+arrStep[nArrCnt]+"]").prop("checked",true);
	    }    
	});
</script>
<!-- ///////////////////////////사이드 메뉴//////////////////////////////// -->
<div class="content">
	<div class="header">
		<div class="head">
			<div class="menu">
				<input type="checkbox" id="sideopen" checked="checked"> <label for="sideopen">
					<div class="res-menu">
						<span></span> <span></span> <span></span>
					</div>
				</label>
				<div class="sidebar">
					<div class="accordion">
						<div class="cate">
							<span class="menu"> <a href="studyregister_1" class="menulink">Step 1</a>
								<input type="checkbox" name="s_check" class="check" value="s1"/>
							</span>
							<ul>
								<li>스터디 종류</li>
								<li>스터디 분류</li>
							</ul>
						</div>
						<div class="cate">
							<span class="menu"> <a href="studyregister_2" class="menulink">Step 2</a>
								<input type="checkbox" name="s_check" class="check" value="s2"/>
							</span>
							<ul>
								<li>스터디 제목</li>
								<li>스터디 내용</li>
								<li>대표 이미지 등록</li>
							</ul>
						</div>
						<div class="cate">
							<span class="menu"> <a href="studyregister_3" class="menulink">Step 3</a>
								<input type="checkbox" name="s_check" class="check" value="s3"/>
							</span>
							<ul>
								<li>스터디 모집 인원</li>
								<li>스터디 상태</li>
								<li>스터디 주의사항</li>
							</ul>
						</div>
						<div class="cate">
							<span class="menu"> <a href="studyregister_4" class="menulink">Step 4</a>
								<input type="checkbox" name="s_check" class="check" value="s4" />
							</span>
							<ul>
								<li>스터디 기간</li>
								<li>사용 언어</li>
							</ul>
						</div>
					</div>
					<input type="submit" name="r_button" class="r_button" value="등록">
				</div>
				<!-- sidebar -->
			</div>
		</div>
		<!-- head -->
	</div>
	<!-- header -->
</div>
<!-- ////////////////////스터디 종류, 분류//////////////////////////////// -->
<div class="register_content">
	<div class="study_host">
		<h2>스터디 정보 등록</h2>
		<hr/>
		<h3>스터디 종류</h3>
		<div class="s_mentor">
			<p>멘토 스터디</p>
			<img src="#"/>
			<input type="radio" value="m"/>
		</div>
		<div class="s_user">
			<p>일반 스터디</p>
			<img src="#"/>
			<input type="radio" value="u"/>
		</div>
	</div>
	<div class="study_kinds">
		<h3>스터디 분류</h3>
		<div id="kinds_box">
			<p>프론트엔드</p>
			<img src="#"/>
			<input type="radio" value="k1"/>
		</div>
		<div id="kinds_box">
			<p>백엔드</p>
			<img src="#"/>
			<input type="radio" value="k2"/>
		</div>
		<div id="kinds_box">
			<p>알고리즘</p>
			<img src="#"/>
			<input type="radio" value="k3"/>
		</div>
		<div id="kinds_box">
			<p>프로젝트</p>
			<img src="#"/>
			<input type="radio" value="k4"/>
		</div>
		<div id="kinds_box">
			<p>영어</p>
			<img src="#"/>
			<input type="radio" value="k5"/>
		</div>
	</div>
</div>


