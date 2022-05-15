<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin/notice/adminNoticeWrite.css"
	type="text/css">
<script src="/js/admin/notice/adminNotice.js"></script>
<script src="//cdn.ckeditor.com/4.17.2/full/ckeditor.js"></script>
<div class="noticeWriteContainer">
	<h1 class="noticeTitle">공지사항 등록</h1>
	<form method="post" action="/board/boardWriteOk" enctype="multipart/form-data">
		<input type="hidden" name="board_type_num" value="3">
		<!-- 글 제목 -->
		<div class="noticeWriteTitleContainer">
			<div class="col-lg-4 noticeWriteTitle">글 제목&nbsp;</div>
			<div class="col-lg-8"><input type="text" class="noticeWriteTitleBox" name="title"/></div>
		</div>
		<!-- ck에디터 -->
		<div class="noticeTextArea">
			<textarea id="noticeWrite" name="content" placehohlder="공지사항을 입력해주세요"></textarea>
		</div>
		<br/>
		<input type="file" name="filename">
		<input type="submit" class="btn registBtn" value="등록하기">
	</form>
</div>
<script>
	$(document).ready(function() {
		CKEDITOR.replace('noticeWrite');
		
		CKEDITOR.editorConfig = function(config) {
			  config.removePlugins = 'Image';
			  config.extraPlugins = 'inserthtml';
			  config.toolbar = 'Basic';
			  config.allowedContent = true;
			}
		var editorContent = CKEDITOR.instance.editor.getData();
		var convertContent = editorContent.replace(/(<([^>]+)>)/ig,"");
	
	});
</script>

