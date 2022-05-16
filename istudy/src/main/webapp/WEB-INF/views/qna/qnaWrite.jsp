<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaWrite.css" type="text/css">
<!-- TOAST UI Editor CDN URL(CSS)-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

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
				<input type='hidden' name='content' id='content_hidden'/>
				<ul>
					<li>
						<ul id="qna_title">
							<li>제목 : <textarea rows='1' class='noresize round' name='title' id='title_box'></textarea></li>
						</ul>
					</li>
					<li>
						<ul id="qna_content">
							<!-- TOAST UI Editor가 들어갈 div태그 -->
							<li><div id="editor"></div></li>
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
									<li>태그 : <input type="text" name="tag_list" class='tag_box'/></li>
								</ul>
							</li>
							<li><img src='/images/plus.jpg' id='plus' onclick='PlusTag()'/></li>
							<li><br/><br/><input type='button' id='submit_btn' value='글 등록'/></li>
						</ul>						
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>

<!-- TOAST UI Editor CDN URL(JS) -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<!-- TOAST UI Editor 생성 JavaScript 코드 -->
<script>
const editor = new toastui.Editor({
	el : document.querySelector('#editor'),
	previewStyle : 'vertical',
	height : '1000px',
	initialEditType: 'wysiwyg'
	
});
//글 등록
$("#submit_btn").click(function(){
	/* if($("#title_box").text().trim()==""){
		alert('제목을 입력해주세요');
		$("#title_box").focus();
		return false;
	}else{
		if($("#content_box").text().trim()==""){
			alert('글 내용을 입력해주세요');
			$("#content_box").focus();
			return false;
		}else{ */

				if(confirm('글을 등록하시겠습니까?')){
					
					// editor.getHtml()을 사용해서 에디터 내용 받아오기
					$("#content_hidden").val(editor.getHTML());
					$("#qnaWriteForm").submit();
				}
				return false;
	/* 	}
	} */
});//submit
	
</script>