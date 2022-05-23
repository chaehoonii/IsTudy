<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaWrite.css" type="text/css">
<script src="/js/ckeditor/ckeditor.js"></script>
<script>
	var cnt=1;
	//태그 플러스
	function PlusTag(){
		if(cnt<5){
			var li ="<li><input type='text' name='tag_list' class='tag_box'/></li>";
			$("#tag_ul").append(li);
			cnt++;
			console.log(cnt);
			if(cnt==5){
				$("#plus").remove();
			}
		}
	}
</script>
<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<form method='post' action='/board/boardWriteOk' id='qnaWriteForm' enctype="multipart/form-data">
				<input type='hidden' value='2' name='board_type_num'/>
				<h1>Q & A 등록</h1>
				<br/>
				<br/>
				<!-- <div id="qna_title"><span id="titleSpan">제목</span>&nbsp;&nbsp;<input type="text" id="qna_titlebox" name='title'></textarea></div> -->						
				<div class="qna_title">
					<div class="col-lg-4 qna_titlespan">글 제목&nbsp;</div>
					<div class="col-lg-8">
						<input type="text" class="qna_titlebox" name="title" />
					</div>
				</div>
				<div>
				<ul id="qna_content">
					<li>
						<div class="qnaTextArea" id="qnaTextArea">
							<!--CKEDITOR 4 -->
							<textarea class="qna_editor" id="qna_editor" name="content" 
							placeholder="코드블럭(markdown)이용 시 백틱(```)을 사용하세요"></textarea>
						</div>
					</li>
					<li>
						<ul id='lang_ul'>
							<li><input type='checkbox' name='lang_list' value='1' class='chk'><label >&nbsp;&nbsp;HTML</label></li>
							<li><input type='checkbox' name='lang_list' value='2' class='chk'><label >&nbsp;&nbsp;CSS</label></li>
							<li><input type='checkbox' name='lang_list' value='3' class='chk'><label >&nbsp;&nbsp;javascript</label></li>
							<li><input type='checkbox' name='lang_list' value='4' class='chk'><label >&nbsp;&nbsp;Python</label></li>
							<li><input type='checkbox' name='lang_list' value='5' class='chk'><label >&nbsp;&nbsp;Java</label></li>
							<li><input type='checkbox' name='lang_list' value='6' class='chk'><label >&nbsp;&nbsp;C++</label></li>
							<li><input type='checkbox' name='lang_list' value='7' class='chk'><label >&nbsp;&nbsp;Kotlin</label></li>
							<li><input type='checkbox' name='lang_list' value='8' class='chk'><label >&nbsp;&nbsp;Swift</label></li>
							<li><input type='checkbox' name='lang_list' value='9' class='chk'><label >&nbsp;&nbsp;PHP</label></li>
							<li><input type='checkbox' name='lang_list' value='10' class='chk'><label >&nbsp;&nbsp;Go</label></li>
							<li><input type='checkbox' name='lang_list' value='11' class='chk'><label >&nbsp;&nbsp;C#</label></li>
							<li><input type='checkbox' name='lang_list' value='12' class='chk'><label >&nbsp;&nbsp;SQL</label></li>
							<li><input type='checkbox' name='lang_list' value='13' class='chk'><label >&nbsp;&nbsp;Scala</label></li>
							<li><input type='checkbox' name='lang_list' value='14' class='chk'><label >&nbsp;&nbsp;R</label></li>
							<li><input type='checkbox' name='lang_list' value='15' class='chk'><label >&nbsp;&nbsp;Bash</label></li>
							<li><input type='checkbox' name='lang_list' value='16' class='chk'><label >&nbsp;&nbsp;Shell</label></li>
						</ul>
						<ul id='tag_ul'>
							<li><img src='/images/plus.jpg' id='plus' onclick='PlusTag()'/>&nbsp;&nbsp;태그</li>
							<li><input type="text" name="tag_list" class='tag_box'/></li>
						</ul>
					</li>
				</ul>		
				</div>				
				<div style="clear:both"></div>
				<br/>
				<div><input type='submit' id='submit_btn' value='글 등록'/></div>
			</form>
		</div>
	</div>
</div>

<!-- CKEDITOR4 소스 -->
<script>
$(document).ready(function() {
	CKEDITOR.replace("qna_editor", {
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
	$('#qnaWriteForm').submit(function() {
		if ($(".qna_titlebox").val() == '') {
			alert("제목을 입력해주세요");
			$(".qna_titlebox").focus();
			return false;
		}
		if (CKEDITOR.instances.qnaWrite.getData() == '') {
			alert("내용을 입력해주세요");
			$('.qna_editor').focus();
			return false;
		}
		if(confirm('글을 등록하시겠습니까?')){
			$("#qnaWriteForm").submit();
		}
		return false;
	});
});
</script>