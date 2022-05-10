<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 정보 페이지</title>

<style>
	#categoryBox{
		float:left;
		width:20%;
		height:100%;
		
		padding:20px;
		margin-top:60px;
		background-color:rgb(230,223,215);
	}
	#categoryTop{
		margin-bottom:20px;
	}
	#h1{
		margin-bottom:10px;
	}
	#firstMenu{
		margin-top:15px;
	}
	#slan{
		background-color:#FEF5D4;
	    border-radius:5px;
	    font-size:11px;
	    border: none;
		color: black;
		padding: 5px 5px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		cursor: pointer;
	}
	
	#contents{
		width:77%;
		float:right;
		margin-top:60px;
		margin-bottom:60px;
	}
	.info{
		display:flex;
		flex-flow:row nowrap;
		justify-content:space-around;
		width:100%;
		height:210px;
		line-height:50px;
	}
	.simg{
		height:200px;
		width:25%;
		padding:10px;
	  	margin-top:15px;
	  	margin-right:30px;
	}
	.sinfo{
		width:73%;
		height:200px;
		padding:10px;
	  	margin-top:20px;
	  	font-size:15px;
	}
	#secondMenu li{
		font-size:20px;
	}
	#sid{		
		margin-right:190px;
	}
	#smentor, smax{
		text-align:right;
	}
	#sdate{
		margin-right: 50px;
	}
	#studyRegister{
		position:absolute;
		bottom:0;
		right:0;
	}
	#button{
		background-color:rgb(230,223,215);
		border: none;
		color: white;
		padding: 15px 30px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 4px 2px;
		border-radius: 5px;
		cursor: pointer;
	}
	.lang_list {
	    background-color: #FEF5D4;
	    border-radius: 5px;
	    padding: 5px;
	    font-size:12px;
	}
	.tag_list{
	    overflow:hidden;
	    background-color: rgb(232,244,232);
	    border-radius: 5px;
	    padding: 5px;
	    font-size:12px;
	}
</style>

<script>
	let result = [];
	function getCheckboxValue(){
		//alert(event.target.checked)
		
	  	if(event.target.checked)  {
		    result.push(event.target.value);
		}else {
			for(let i=0;i<result.length;i++){
		    	if(result[i]==event.target.value){
		    		result.splice(i,1);
		    		break;
		    	}
			}
		}
	  	//alert(result)
	  	console.log(typeof result)
	  	ajaxSend('sclass', result)
		//document.getElementById('contents').innerText= result;
	}
	function ajaxSend(param, value){
		//alert(typeof value)
		data=$('#frm').serialize()
		
		$.ajax({
			type: 'POST',
			url: '/study/study_home',
			data:data,
			success: function(value){
				alert(JSON.stringify(value))
			},
			error:function(){
				
			}
		})
	}
	 // html dom 이 다 로딩된 후 실행된다.
/*     $(document).ready(function(){
        // memu 클래스 바로 하위에 있는 a 태그를 클릭했을때
        $("#langList>langClick").click(function(){
            // 현재 클릭한 태그가 a 이기 때문에
            // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
            $(this).next("ul").toggleClass("hide");
        });
    }); */

</script>

<div id="categoryBox">
	<form id="frm">
		<div id="categoryTop">
			<p style="padding-bottom: 20px; font-size: 20px;">카테고리</p>
			<input type="search" name="SEARCH" placeholder="SEARCH"> 
			<button type="submit">검색</button>
		</div>
		
		<div id="firstMenu"> 
			<h1>스터디 종류</h1>
			<ul id="secondMenu">
				<li style="float:left;"><input type="checkbox" name="stype" id="stype1" value="멘토"><label>멘토</label></li>
				<li><input type="checkbox" name="stype" id="stype2" value="일반"><label>일반</label></li>
			</ul>
		</div>
		<div id="firstMenu"> 
			<h1>스터디 분류</h1>
			<ul id="secondMenu">
				<li><input type="checkbox" name="sclass" id="sclass1" value="프론트엔드" onclick="getCheckboxValue()"><label>프론트엔드</label></li>
				<li><input type="checkbox" name="sclass" id="sclass2" value="백엔드" onclick="getCheckboxValue()"><label>백엔드</label></li>
				<li><input type="checkbox" name="sclass" id="sclass3" value="알고리즘" onclick="getCheckboxValue()"><label>알고리즘</label></li>
				<li><input type="checkbox" name="sclass" id="sclass4" value="프로젝트" onclick="getCheckboxValue()"><label>프로젝트</label></li>
				<li><input type="checkbox" name="sclass" id="sclass5" value="영어" onclick="getCheckboxValue()"><label>영어</label></li>
			</ul>
		</div>
		<div id="firstMenu"> 
			<h1>스터디 상태</h1>
			<ul id="secondMenu">
				<li style="float:left;"><input type="checkbox" name="sstatus" id="sstatus1" value="모집"><label>모집</label></li>
				<li><input type="checkbox" name="sstatus" id="sstatus2" value="마감"><label>마감</label></li>
			</ul>
		</div>
		<div id="firstMenu"> 
			<h1>스터디 언어</h1>
			<form>
				<select id="langList" multiple>
					<option id="langClick"value="기본값">스터디 언어 선택</option>
					<c:forEach var="vo" items="${langList}">
							<option value="${vo.lang_type_num}" selected>${vo.lang_type_name}</option>
						<%-- <input type="checkbox" name="lang" id="lang" value="${vo.lang_type_num}"><label>${vo.lang_type_name}</label></span> --%>
					</c:forEach>
				</select>
			</form>
			
		</div>
		<div id="firstMenu"> 
			<h1>스터디 기간</h1>
				<p style="float:left"><input type="date" value="2022-05-09" min="2022-05-09" ></p>
		      	<p><input type="hidden" value="Submit"></p>
		      	<p><input type="date" value="2022-05-10" min="2022-05-10" ></p>
		      	<p><input type="hidden" value="Submit"></p>
		</div>
	</form>
	
</div>
<div id="contents">
	<c:forEach var="vo" items="${studyhome}">
		<div class="info">
			<div class="simg">
				<img src="/images/study_info/${vo.study_img}" style="width:100%; object-fit:cover; height:200px;" class="img img-thumbnail">
			</div>
			<div class="sinfo">
				<span id="sname">${vo.study_name}</span><br/>
				<span id="sid">${vo.host_id}</span>
				<span id="smentor">${vo.is_mentor}</span>
				<span id="smax">${vo.max}/</span><br/>
				<span id="sdate">${vo.start_date} ~ ${vo.finish_date}</span>
				<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
					<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
				</c:forEach> 
				<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
					<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
				</c:forEach>
			</div>
		</div>	
	</c:forEach>
</div>
<div id="studyRegister">
	<input type="button" id="button" onclick="location.href='http://localhost:8060/studyregister/studyregister_0';" value="스터디 등록">
</div>
<div style="clear:both"></div>