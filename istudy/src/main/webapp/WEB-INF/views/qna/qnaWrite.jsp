<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	width:55vw;
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
	padding-bottom:20px;
}
#qna_content{
	margin-top:50px;
	margin-bottom:50px;
	border-top:1px solid #ddd;
	padding:80px;
	padding-bottom:10px;
}
#qna_title li, #qna_content li{
  	font-size:14px;
}
#qna_title li:nth-child(1){
	display:inline-block;
	font-size:18px;
	width:90%;
}
#qna_content li:nth-child(4){
	text-align:right;
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
.tag_box{
	width:100px;
	height:30px;
	border-radius:5px;
	border:1px solid #aaa;
}
</style>

<script>
	var cnt=1;
	//태그 플러스
	function PlusTag(){
		if(cnt<5){
			var li ="<li><input type='text' name='tag' class='tag_box'/></li>";
			$("#tag_ul").append(li);
			cnt++;
			console.log(cnt);
			if(cnt==5){
				$("#plus").remove();
			}
		}
	}
	
	//글 등록
	$("#submit_btn").click(function(){
		if(confirm('글을 등록하시겠습니까?')){
			$("#qnaWriteForm").submit();
		}
		return false;
	});
</script>

<div class='qna_back00'>
	<img src='/images/back02.png' id="back_btn" onclick="location.href='/qna/qnaList'"/>
	<div class='qna_back01'>
		<div class='qna_back02'>
			<form method='post' action='/board/boardWriteOk' id='qnaWriteForm'>
				<input type='hidden' value='2' name='board_type_num'/>
				<ul>
					<li>
						<ul id="qna_title">
							<li><textarea cols='75' rows='1'></textarea></li>
						</ul>
					</li>
					<li>
						<ul id="qna_content">
							<li><textarea cols='100' rows='30'></textarea></li>
							<li>
								이미지
							</li>
							<li class='nocenter'>
								<ul id='tag_ul'>
									<li>태그 : <input type="text" name="tag_list" class='tag_box'/></li>
								</ul>
							</li>
							<li><img src='/images/plus.jpg' id='plus' onclick='PlusTag()'/></li>
							<li><input type='button' id='submit_btn'/></li>
						</ul>						
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>