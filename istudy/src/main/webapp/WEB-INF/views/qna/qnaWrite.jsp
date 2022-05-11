<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
#tag_div{
	margin-top: 200px;
	margin-bottom: 200px;
	height:500px;
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
#tag_ul li{
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

<div id='tag_div'>
	<ul id='tag_ul_big'>
		<li>
			<ul id='tag_ul'>
				<li>태그 : <input type="text" name="tag" class='tag_box'/></li>
			</ul>
		</li>
		<li><img src='/images/plus.jpg' id='plus' onclick='PlusTag()'/></li>
	</ul>		
</div>
<script>
	var cnt=1;
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
</script>