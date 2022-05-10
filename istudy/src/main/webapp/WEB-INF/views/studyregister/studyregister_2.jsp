<link rel="stylesheet" href="/css/studyregister/studyregister.css" type="text/css" />
<div id="sub_register_content">
	<div class="register_title">
		<h2>기본 정보</h2>
		<hr/>
	</div>
	<div class="study_title">
		<h3>▶스터디 제목</h3>
		<input type="text" name="study_name" id="s_title" placeholder="20자 이내로 입력해주세요." maxlength="20">
		<input type="submit" id="register_title_btn" value="확인"/>
	</div>
	<div class="register_page2">
		<div class="study_image">
			<h3>▶스터디 대표 이미지</h3>
			<div class="file-wrapper flie-wrapper-area">
  				<div class="float-left">
   				<input type="file" name="file" id="file" class="upload-box upload-plus" accept="image/*">
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
				<textarea id="info_1"></textarea>
				<textarea id="info_2"></textarea><br/>
			</div>
		</div>
		<input type="submit" value="확인" id="register_page2_btn" />
	</div>
	<div class="moving_button">
		<input type="button" value="PREVIOUS" id="previous_button" onclick="asyncMovePage('studyregister_1')">
		<input type="button" value="NEXT" id="next_button" onclick="asyncMovePage('studyregister_3')">
	</div>
</div>