<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/notice/adminNoticeEdit.css"
	type="text/css">
<script src="/js/admin/notice/adminNotice.js"></script>
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script> -->
<script src="/js/ckeditor/ckeditor.js"></script>
<div class="noticeEditContainer">
	<h1 class="noticeTitle">공지사항 수정</h1>
	<form id="noticeForm" method="post" action="/board/boardEditOk" enctype="multipart/form-data">
		<input type="hidden" name="board_type_num" value="3">
		<input type="hidden" name="board_num" value="${vo.board_num}">
		<!-- 글 제목 -->
		<div class="noticeEditTitleContainer">
			<div class="col-lg-4 noticeEditTitle">글 제목&nbsp;</div>
			<div class="col-lg-8">
				<input type="text" class="noticeEditTitleBox" name="title" value="${vo.title}"/>
			</div>
		</div>
		<!-- ck에디터 -->
		<div class="noticeTextArea" id="noticeTextArea">
			<textarea class="notice_editor" id="notice_editor" name="content">${vo.content}</textarea>
		</div>
		<br /> <br /> <input type="submit" class="btn registBtn" value="등록하기">
	</form>
</div>
<script>
	$(document).ready(function() {
		CKEDITOR.replace("notice_editor", {

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
		
		$('#noticeForm').submit(function() {
			if ($(".noticeEditTitleBox").val() == '') {
				alert("제목을 입력해주세요");
				$(".noticeEditTitleBox").focus();
				return false;
			}
			if (CKEDITOR.instances.noticeEdit.getData() == '') {
				alert("내용을 입력해주세요");
				$('.noticeTextArea').focus();
				return false;
			}
			location.href = "/notice/noticeList";
		});
	});
</script>

