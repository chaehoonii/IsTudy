<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/studyboard/studyboardWrite.css" type="text/css">
<script src="/js/ckeditor/ckeditor.js"></script>
<div class='studyboard_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.='/study/studyboard/studyboardList'"/>
	<div class='studyboard_back01'>
		<div class='studyboard_back02'>
			<form method='post' action='/board/boardEditOk' id='studyboardEditForm' enctype="multipart/form-data">
				<input type='hidden' value='1' name='board_type_num'/>
				<input type='hidden' name='board_num' value='${vo.board_num}'/>
				<input type='hidden' value="${study_num}" name="study_num"/>
				<input type='hidden' name='content' id='content_hidden'/>
				<h1>수정</h1>
				<br/>
				<br/>
				<div class="studyboard_title">
					<div class="col-lg-4 studyboard_titlespan">제목&nbsp;</div>
					<div class="col-lg-8">
						<input type="text" class="studyboard_titlebox" name="title" value="${vo.title}"/>
					</div>
				</div>
				<div>
				<ul id="studyboard_content">
					<li>
						<div class="studyboard_text_area" id="studyboard_text_area" name="content">
							<!--CKEDITOR 4 -->
							<textarea class="studyboard_editor" id="studyboard_editor" name="content" 
							placeholder="코드블럭(markdown)이용 시 백틱(`)을 사용하세요">${vo.content}</textarea>
						</div>
					</li>
				</ul>		
				</div>				
				<div style="clear:both"></div>
				<br/>
				<div><input type='submit' id='submit_btn' value='수정'/></div>
			</form>
		</div>
	</div>
</div>

<!-- CKEDITOR4 소스 -->
<script>
$(document).ready(function() {
	CKEDITOR.replace("studyboard_editor", {
		height : '400px',
		filebrowserUploadUrl : '/board/imageUpload', // 이미지 업로드
		//filebrowserUploadMethod:'form',
		extraPlugin : 'autograw',
		extraPlugin : 'markdown',
		extraPlugin : 'confighelper',
	});

	CKEDITOR.on('dialogDefinition', function(ev) {
		let dialogName = ev.data.name;
		let dialog = ev.data.definition.dialog;
		let dialogDefinition = ev.data.definition;

		if (dialogName == 'image') {
			dialog.on('show', function() {
				this.selectPage('Upload'); // 이미지 클릭시 업로드탭으로 시작
			});
			dialogDefinition.removeContents('advanced'); // 자세히 탭 제거
			dialogDefinition.removeContents('Link'); // 링크탭 제거 
		}
	});
	$('#studyboardForm').submit(function() {
		if ($(".studyboardWriteTitleBox").val() == '') {
			alert("제목을 입력해주세요");
			$(".studyboardWriteTitleBox").focus();
			return false;
		}
		if (CKEDITOR.instances.studyboardWrite.getData() == '') {
			alert("내용을 입력해주세요");
			$('.studyboard_text_area').focus();
			return false;
		}
		location.href = "/study/studyboard/studyboardList";
	});
	//submit=========================================================================================================
	$("#submit_btn").click(function(){
		if(confirm('수정하시겠습니까?')){
			$("#studyboardEditForm").submit();
		}
	})	
});
</script>