<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/css/qna/qnaEdit.css" type="text/css">  
<script src="/js/ckeditor/ckeditor.js"></script>

<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<form method='post' action='/board/boardEditOk' id='qnaEditForm' enctype="multipart/form-data">
			<input type='hidden' name='board_type_num' value='2'/>
			<input type='hidden' name='board_num' value='${vo.board_num}'/>
			<input type='hidden' name='content' id='content_hidden'/>
				<ul>
					<li>
						<ul id="qna_title">
							<li><textarea rows='1' class='noresize round' name='title' id='title_box'>${vo.title}</textarea></li>
						</ul>
					</li>
					<li>
						<ul id="qna_content">
							<li><!-- ck에디터 -->
								<div class="qnaTextArea" id="qnaTextArea" name="content">
									<textarea class="qna_editor" id="qna_editor" name="content">${vo.content}</textarea>
								</div>
							</li>
							
							<li>
								<ul id='lang_ul'>
									<li><input type='checkbox' name='lang_list' value='1' class='chk'><label >HTML</label></li>
									<li><input type='checkbox' name='lang_list' value='2' class='chk'><label >CSS</label></li>
									<li><input type='checkbox' name='lang_list' value='3' class='chk'><label >javascript</label></li>
									<li><input type='checkbox' name='lang_list' value='4' class='chk'><label >Python</label></li>
									<li><input type='checkbox' name='lang_list' value='5' class='chk'><label >Java</label></li>
									<li><input type='checkbox' name='lang_list' value='6' class='chk'><label >C++</label></li>
									<li><input type='checkbox' name='lang_list' value='7' class='chk'><label >Kotlin</label></li>
									<li><input type='checkbox' name='lang_list' value='8' class='chk'><label >Swift</label></li>
									<li><input type='checkbox' name='lang_list' value='9' class='chk'><label >PHP</label></li>
									<li><input type='checkbox' name='lang_list' value='10' class='chk'><label >Go</label></li>
									<li><input type='checkbox' name='lang_list' value='11' class='chk'><label >C#</label></li>
									<li><input type='checkbox' name='lang_list' value='12' class='chk'><label >SQL</label></li>
									<li><input type='checkbox' name='lang_list' value='13' class='chk'><label >Scala</label></li>
									<li><input type='checkbox' name='lang_list' value='14' class='chk'><label >R</label></li>
									<li><input type='checkbox' name='lang_list' value='15' class='chk'><label >Bash</label></li>
									<li><input type='checkbox' name='lang_list' value='16' class='chk'><label >Shell</label></li>
								</ul>
								<ul id='tag_ul'>
									<li>태그 :</li>
									<c:forEach var="tag" items="${vo.tag_list}">
									<li><input type="text" name="tag_list" class='tag_box' value='${tag}'/></li>
									</c:forEach>
								</ul>
							</li>
							<li><img src='/images/plus.jpg' id='plus' onclick='PlusTag()'/></li>
							<li><input type='button' id='submit_btn' value='글 등록'/></li>
						</ul>						
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>

<script>
	var cnt = ${tagcnt};
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
	$(document).ready(function(){ 
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
		//선택한 언어 불러오기==============================================================================================
		var lang_num_list = ${vo.lang_num_list};
		
		for(var num of lang_num_list){
			console.log(num);
			$("#lang_ul input").each(function(i, obj){
				if($(obj).attr("value")==num) $(obj).prop("checked", true);
			})
		}
		//submit=========================================================================================================
		$("#submit_btn").click(function(){
			if(confirm('수정하시겠습니까?')){
				$("#qnaEditForm").submit();
			}
		})	
	});//document

</script>