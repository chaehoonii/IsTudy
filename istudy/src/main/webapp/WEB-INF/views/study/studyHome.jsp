<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 정보 페이지</title>

<style>
	body, ul, li{
		margin:0px;
		padding:0px;
		font-family: 'paybooc-Bold';
		list-style-type:none;
	}
	a, a:visited, a:hover, a:active{
		text-decoration: none;
		color: black;
	}
	#category_box{
		float:left;
		width:20%;
		height:100%;
		
		padding: 10px;
		background-color: rgb(230,223,215);
	}
	#h1{
		padding-bottom:10px;
	}
	#first_menu{
		padding-top: 1px;
		margin-top: 15px;
	}
	
	#contents{
		width: 77%;
		float:right;
	}
	.info{
		display:flex;
		flex-flow: row nowrap;
		justify-content:space-around;
		width:100%;
		height: 210px;
		line-height: 35px;
	}
	.simg{
		height: 200px;
		width:25%;
		padding: 10px;
	  	margin-top:15px;
	  	margin-right: 30px;
	}
	.sinfo{
		width: 73%;
	}
</style>

<script>
	function getLang(){
		$("#langselect option:selected");
	}
</script>

<div id="category_box">
	<h1>카테고리</h1>
	<input type="search" name="SEARCH" placeholder="SEARCH"> <button type="submit">검색</button>

	<div id="first_menu"> 
		<h2>스터디 종류</h2>
		<ul id="second_menu">
			<li style="float:left;"><input type="checkbox" name="stype" id="stype1" value="멘토"><label>멘토</label></li>
			<li><input type="checkbox" name="stype" id="stype2" value="일반"><label>일반</label></li>
		</ul>
	</div>
	<div id="first_menu"> 
		<h2>스터디 분류</h2>
		<ul id="second_menu">
			<li><input type="checkbox" name="sclass" id="sclass1" value="프론트엔드"><label>프론트엔드</label></li>
			<li><input type="checkbox" name="sclass" id="sclass2" value="백엔드"><label>백엔드</label></li>
			<li><input type="checkbox" name="sclass" id="sclass3" value="알고리즘"><label>알고리즘</label></li>
			<li><input type="checkbox" name="sclass" id="sclass4" value="프로젝트"><label>프로젝트</label></li>
			<li><input type="checkbox" name="sclass" id="sclass5" value="영어"><label>영어</label></li>
		</ul>
	</div>
	<div id="first_menu"> 
		<h2>스터디 상태</h2>
		<ul id="second_menu">
			<li style="float:left;"><input type="checkbox" name="sstatus" id="sstatus1" value="모집"><label>모집</label></li>
			<li><input type="checkbox" name="sstatus" id="sstatus2" value="마감"><label>마감</label></li>
		</ul>
	</div>
	<div id="first_menu"> 
		<h2>스터디 언어</h2>
		<select size="3" id="langlist" multiple>
			<option value="기본값">스터디 언어 선택</option>
			<c:forEach var="vo" items="${langList}">
					<option value="${vo.lang_type_num}" selected>${vo.lang_type_name}</option>
				<%-- <input type="checkbox" name="lang" id="lang" value="${vo.lang_type_num}"><label>${vo.lang_type_name}</label></span> --%>
			</c:forEach>
		</select>
	</div>
	<div id="first_menu"> 
		<h2>스터디 기간</h2>
		<form>
			<p><input type="date" value="2022-05-09" min="2022-05-09" ></p>
	      	<p><input type="hidden" value="Submit"></p>
	      	<p><input type="date" value="2022-05-10" min="2022-05-10" ></p>
	      	<p><input type="hidden" value="Submit"></p>
	    </form>
	</div>
</div>
<div id="contents">
	<c:forEach var="vo" items="${studyhome}">
		<div class="info">
			<div class="simg">
				<img src="/images/${vo.study_img}" style="width:100%; object-fit:cover; height:200px;" class="img img-thumbnail">
			</div>
			<div class="sinfo">
			<span id="sname">${vo.study_name}</span><br/>
			<span id="sid">${vo.host_id}</span>
			<span id="smentor">${vo.is_mentor}</span><br/>
			<c:forEach var="lang" items="${vo.lang_type_name_list}">
				<span id="slan">${lang} &nbsp;</span>
			</c:forEach>
			<span id="smax">${vo.max}</span><br/>
			<span id="sdate">${vo.start_date} ~ ${vo.finish_date}</span>
			<hr/>
			</div>
		</div>	
	</c:forEach>
</div>
<div style="clear:both"></div>