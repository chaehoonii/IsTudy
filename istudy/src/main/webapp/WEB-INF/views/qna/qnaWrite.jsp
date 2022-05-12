<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- 파일 업로드 -->
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.7/css/fileinput.css" media="all" rel="stylesheet" type="text/css"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="all" rel="stylesheet" type="text/css"/>
	<script src="js/bootstrap-fileinput/plugins/sortable.js" type="text/javascript"></script>
	<script src="js/bootstrap-fileinput/fileinput.js" type="text/javascript"></script>
	<script src="js/bootstrap-fileinput/themes/explorer/theme.js" type="text/javascript"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" type="text/javascript"></script>
	<link rel="stylesheet" href="/css/board/uploadfile.css" type="text/css" />
	<script src="/js/board/uploadfile.js"></script>
<style>
.qna_back00 {
	text-align:center;
	margin-top:150px; 
	margin-bottom:100px; 
}
#back_btn{
	display:inline-block;
	width:50px;
	height:50px;
	border: 4px solid #ddd;
	border-radius: 50%;
	padding:5px;
	position:absolute;
	left:15vw;
	top:23vh;
	cursor:pointer;
}
.qna_back01 {
	text-align:center;
	width:60vw;
	margin:0 auto;
	display:inline-block;
}
.qna_back02 {
	border: 2px solid #ddd;
	border-radius:10px;
	
}
#qna_title{
	margin-top:50px;
	margin-bottom:50px;
	line-height:50px;
	padding-left:40px;
	padding-right:40px;
}
#title_box, #content_box{
	width:80%;
}
#qna_content{
	margin-top:50px;
	margin-bottom:50px;
	border-top:1px solid #ddd;
	padding:40px;
	padding-bottom:10px;
}
#qna_title li, #qna_content li{
  	font-size:14px;
}
#qna_title li:nth-child(1){
	display:inline-block;
	font-size:18px;
	width:100%;
}
#qna_content li{
	margin-bottom:30px;
}
#qna_content li:nth-child(3){
	margin-bottom:0;
	float:left;
}
#qna_content li:nth-child(4){
	float:left;
}
#plus{	
	display:inline-block;
	width:30px;
	height:30px;
	border: 4px solid #ddd;
	border-radius: 50%;
	padding:5px;
	font-size:20px;
	cursor:pointer;
	top:0;
}
#ul_big li{
	float:left;
	margin-left:5px;
	margin-right:5px;
}
/*언어타입*/
#lang_ul{
	background-color:#eee;
	border-radius:10px;
}
#lang_ul li{
	display:inline-block;
	padding:10px;
	font-size: 15px;
	width:12%;
}
/*태그*/
#tag_ul{
	margin:30px;
}
#tag_ul li{
	display:inline-block;
	margin-left:5px;
	margin-right:5px;
	font-size: 15px;
	float:left;	
}
.tag_box{
	width:100px;
	height:30px;
	border-radius:5px;
	border:1px solid #aaa;
}
.noresize{
	resize:none;
}
.round{
	border-radius:10px;
}
#img_files{
	width:100%;
}
</style>

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
	
	$(document).ready(function(){
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
					//파일 개수 제한
					var fileUpload = $("input[type='file']");
					
			        if (parseInt(fileUpload.get(0).files.length)>4){
			         	alert("이미지는 4개 이하만 업로드 가능합니다."); 
			         	return false;
			        }else{
						if(confirm('글을 등록하시겠습니까?')){
							$("#qnaWriteForm").submit();
						}
						return false;
					}
			/* 	}
			} */
		});//submit
		
		//파일업로드
		$("#file-upload-demo").fileinput({
            'theme': 'explorer',
            'uploadUrl': '#',
            overwriteInitial: false,
            initialPreviewAsData: true,
            initialPreview: [],
            initialPreviewConfig: []
        });
	});//document
</script>

<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<form method='post' action='/board/boardWriteOk' id='qnaWriteForm' enctype="multipart/form-data">
				<input type='hidden' value='2' name='board_type_num'/>
				<ul>
					<li>
						<ul id="qna_title">
							<li><textarea rows='1' class='noresize round' name='title' id='title_box'></textarea></li>
						</ul>
					</li>
					<li>
						<ul id="qna_content">
							<li><textarea rows='25' class='noresize round' name='content' id='content_box'></textarea></li>
							<li>
								<div id="img_files">
			                        <div class="container kv-main">
									        <input id="file-upload-demo" type="file" name="filename" multiple><br />
									</div>
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
									<li>태그 : <input type="text" name="tag_list" class='tag_box'/></li>
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