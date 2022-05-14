<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="/css/admin/notice/adminNoticeWrite.css"
	type="text/css">
<script src="/js/admin/notice/adminNotice.js"></script>
<script src="/js/ckeditor/ckeditor.js"></script>
<div class="noticeWriteContainer">
	<h1 class="noticeTitle">공지사항 등록</h1>
	<form method="post" action="/admin/notice/noticeWriteOk">
		<div class="noticeWriteTitleContainer">
			<div class="col-lg-4 noticeWriteTitle">글 제목&nbsp;</div>
			<div class="col-lg-8"><input type="text" class="noticeWriteTitleBox" name="title"/></div>
		</div>
		<textarea id="noticeWrite" name="content"></textarea>
		<br/>
		<input type="button" class="btn registBtn" value="등록하기">
	</form>
</div>
<script>
	$(document).ready(function() {
		CKEDITOR.replace('noticeWrite');
	});
	
</script>

