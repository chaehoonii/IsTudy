<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<title>스터디 정보 페이지</title>'


<!-- DatePicker File import -->
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>

<link rel="stylesheet" href="/css/studyhome/studyhome.css" type="text/css" />
<script src="/js/studyhome/studyhome.js"></script>

<!-- 카테고리 스터디 기간에 사용 -->
<style>
.person_img{
	width:30px;
}
</style>
<script>
	// datepicker 한글 설정
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	    dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	    dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	    showMonthAfterYear: true,
	  	yearSuffix: '년'
	});
	$( function() {
		$( "#datepicker1" ).datepicker({
		});
	});
	$( function() {
		$( "#datepicker2" ).datepicker({
		});
	});
	// 스터디 종류
	let result = [];
	function getTypeValue(){
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
	  	ajaxSend('smentor', result)
		//document.getElementById('study_list').innerText= result;
	}
	// 스터디 분류
	function getClassValue(){
		console.log("gggg")
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
		//document.getElementById('study_list').innerText= result;
	}
	// 스터디 상태
	let result2=[]
	function getStatusValue(){
		//alert(event.target.checked)
		if(event.target.checked){
			result2.push(event.target.value);
		}else{
			for(let i=0; i<result.length; i++){
				if(result[i]==event.target.value){
					result2.splice(i,1);
					break;
				}
			}
		}
		//alert(result)
		console.log(typeof result2)
		ajaxSend('sstatus',result2)
		//document.getElementById('study_list').innerText= result;
	}
	// 스터디 언어
	let result3=[]
	function getLangValue(){
		//alert(event.target.checked)
		if(event.target.checked){
			result2.push(event.target.id);
		}else{
			for(let i=0; i<result.length; i++){
				if(result[i]==event.target.id){
					result3.splice(i,1);
					break;
				}
			}
		}
		//alert(result)
		console.log(typeof result3)
		ajaxSend('#langlist',result3)
		//document.getElementById('study_list').innerText= result;
	}
	function ajaxSend(param, value){
		data=$('#frm').serialize();
		$.ajax({
			type: 'POST',
			url: '/study/study_home2',
			data:data,
			success: function(value){
				if(value.length==0){
					var tag="검색한 데이터는 없습니다.";
					$('#study_list').html(tag)
					
				}else{
					//alert(JSON.stringify(value))
					var tag='';
					//alert(value.length)
					//console.log(JSON.stringify(value))
					$(value).each(function(idx, vo){
						tag+="<div class='info' onclick=\"location.href='/study/study_home/"+vo.study_num+"'\">"
						tag+=	"<div class='simg'>"
						tag+=		"<img src='/upload/study_room/"+vo.study_img+"' class='img img-thumbnail'>"
						tag+=	"</div>"
						tag+=	"<div class='sinfo'>"
						tag+=		"<span class='smentor'>"
						if(vo.is_mentor=='T'){
							tag+= "[멘토]";
						} else{
							tag+= "[일반]";
						}
						tag+=		"</span>&emsp;";
						tag+=		"<span class='sname'>"+vo.study_name+"</span>";	
						tag+=		"&emsp;/&emsp;<span class='sname'>"+vo.study_type_name+"</span><br/>"	;
						tag+=		"&emsp;&emsp;<span class='sid'>"+vo.user_nick+"</span>"	;
						tag+=		"<span class='smax'>";
						for(var i=1;i<=vo.in_people;i++){
							tag+=			"<img src='/images/study_info/person_1.png' class='person_img'/>";
						}
						for(var i=1;i<=vo.in_people;i++){
							tag+=			"<img src='/images/study_info/person_0.png' class='person_img'/>";
						}
							tag+=		"</span><br/>";
							tag+=		"<span class='sdate'>"+vo.start_date+"~"+vo.finish_date+"</span>";
						$(vo.lang_list).each(function(i, lang){
							tag+=	"<span class='lang_list'>&nbsp;"+lang+"&nbsp;</span>&nbsp;";
						})
						$(vo.tag_list).each(function(t, tg){
							tag+=	"<span class='tag_list'>&nbsp;"+tg+"&nbsp;</span>&nbsp;";
						})
						
						tag+=	"</div>";
						tag+="</div>";
						tag+="<hr style='width:90%; float:left;'>";
						
					})
					$('#study_list').html(tag);
					$("#pagingContainer").remove();
				}
			},
			error:function(e){
				console.log(e.responseText)
			}		
		})
	}

</script>
<h1 id="studyTitle">스터디 목록</h1>
<div id="category_box">
	<form id="frm">
		<div class="first_menu"> 
			<h2>스터디 종류</h2>
			<ul class="second_menu">
				<li><label for="stype1"><input type="checkbox" name="stype" id="stype1" value="T" onclick="getTypeValue()" style="margin-right:10px;">멘토</label></li>
				<li><label for="stype2"><input type="checkbox" name="stype" id="stype2" value="F" onclick="getTypeValue()">일반</label></li>
			</ul>
		</div>
		<div class="first_menu"> 
			<h2>스터디 분류</h2>
			<ul class="second_menu01">
				<li><label for="sclass1"><input type="checkbox" name="sclass" id="sclass1" value="Frontend" onclick="getClassValue()">프론트엔드</label></li>
				<li><label for="sclass2"><input type="checkbox" name="sclass" id="sclass2" value="Backend" onclick="getClassValue()">백엔드</label></li>
				<li><label for="sclass3"><input type="checkbox" name="sclass" id="sclass3" value="Algorithm" onclick="getClassValue()">알고리즘</label></li>
				<li><label for="sclass4"><input type="checkbox" name="sclass" id="sclass4" value="Project" onclick="getClassValue()">프로젝트</label></li>
				<li><label for="sclass5"><input type="checkbox" name="sclass" id="sclass5" value="English" onclick="getClassValue()">영어</label></li>
			</ul>
		</div>
		<div class="first_menu"> 
			<h2>스터디 상태</h2>
			<ul class="second_menu">
				<li id="sstatus"><label for=sstatus1><input type="checkbox" name="status" id="sstatus1" value="1" onclick="getStatusValue()">모집</label></li>
				<li><label for=sstatus2><input type="checkbox" name="status" id="sstatus2" value="0" onclick="getStatusValue()">마감</label></li>
			</ul>
		</div>
		<div class="first_menu"> 
			<h2>스터디 기간</h2>
		    <p style="font-weight:1.5em;">조회기간을 선택해주세요 </p>
			<input type="text" id="datepicker1" onclick="getDateValue()"> ~
			<input type="text" id="datepicker2" onclick="getDateValue()">
		</div>
		<div class="first_menu"> 
			<h2>스터디 언어</h2>
			<select id="langList">
				<c:forEach var="vo" items="${langList}">
						<option value="${vo.lang_type_num}" selected onclick="getLangValue()">${vo.lang_type_name}</option>
				</c:forEach>
			</select>
		</div>
		<div id="category_top">
			<h2>스터디 검색</h2>
			<c:choose>
				<c:when test="${param.user_nick !=null || param.user_nick != ''}">
					<input type="text" name="searchWord"  id='searchWord' placeholder="SEARCH" value="${user_nick}"> 
				</c:when>
				<c:otherwise>
					<input type="text" name="searchWord"  id='searchWord' placeholder="SEARCH"> 
				</c:otherwise>				
			</c:choose>
			<button type="submit" id="studySearchBtn">검색</button>
		</div>
	</form>
</div>
<div id="study_list">
	<!-- 스터디 등록 버튼 -->
	<div id="study_register">
		<input type="button" id="rbutton" onclick="location.href='http://localhost:8060/studyregister/registerform';" value="스터디 등록">
	</div>
	<c:forEach var="vo" items="${studyhome}">
	<!-- 반복문 안에서는 id x class o -->
		<div class="info" onclick="location.href='/study/study_home/${vo.study_num}'">
			<div class="simg">
				<img src="/upload/study_room/${vo.study_img}" class="img img-thumbnail">
			</div>
			<div class="sinfo">
				<span class="smentor">
					<c:if test="${vo.is_mentor=='T'}">[멘토]</c:if>
					<c:if test="${vo.is_mentor=='F'}">[일반]</c:if>
				</span>&emsp;
				<span class="sname">${vo.study_name}</span>
				&emsp;/&emsp;<span class="sname">${vo.study_type_name}</span>
				<br/>
				<span class="sid">${vo.user_nick}</span>
				<span class="smax">
				
				<c:forEach var ="i" begin="${1}" end="${vo.in_people}">
					<img src='/images/study_info/person_1.png' class='person_img'/>
				</c:forEach>
				<c:forEach var ="i" begin="${1}" end="${vo.remain}">
					<img src='/images/study_info/person_0.png' class='person_img'/>
				</c:forEach>
				
				
				</span>
				<span class='like_span'>
					<img src='/images/like_1_sky.png' class='qna_like' />&nbsp;
					${vo.like_num}
				</span>
				<br/>
				<span class="sdate">${vo.start_date} ~ ${vo.finish_date}</span>
				<c:forEach var="lang_list" items="${vo.lang_list}" end="2">
					<span class="lang_list">&nbsp;${lang_list}&nbsp;</span>&nbsp;
				</c:forEach> 
				<c:forEach var="tag_list" items="${vo.tag_list}" end="2">
					<span class="tag_list">&nbsp;${tag_list}&nbsp;</span>&nbsp;
				</c:forEach>
				<!-- 스터디 자세히 보기 버튼 -->
			</div>
		</div>	
		<hr style="width:90%; float:left;">
	</c:forEach>
<div class="pagingContainer">
	<ul class="pagination justify-content-center" id="paging">
    	<c:if test="${pvo.pageNum==1}">
        	<li class="page-item disabled"><a class="page-link" id="prevBtn"><i class="fa fa-angle-left"></i></a></li>
        </c:if>
        <c:if test="${pvo.pageNum>1}">
            <li class="page-item">
            	<a class="page-link" href="/study/study_home?pageNum=${pvo.pageNum-1}${searchUrl}" id="prevBtn">
            		<i class="fa fa-angle-left"></i>
            	</a>
            </li>
        </c:if>
        <c:forEach var="p" begin="${pvo.startPage}" end="${pvo.totalPage}">
            <c:if test="${p<=pvo.totalPage}">
            	<c:choose>
            		<c:when test="${p==pvo.pageNum}">
            			<li class="page-item disabled"><a class="page-link">${p}</a></li>
                    </c:when>
                    <c:when test="${p!=pvo.pageNum}">
                        <li class="page-item"><a class="page-link" href="/study/study_home?pageNum=${p}${searchUrl}">${p}</a></li>
                    </c:when>
                </c:choose>
            </c:if>
       </c:forEach>
       <c:if test="${pvo.pageNum==pvo.totalPage}">
            <li class="page-item disabled">
            	<a class="page-link" id="nextBtn">
            		<i class="fa fa-angle-right"></i>
            	</a>
           	</li>
      	</c:if>
        <c:if test="${pvo.pageNum<pvo.totalPage}">
            <li class="page-item">
            	<a class="page-link" href="/study/study_home?pageNum=${pvo.pageNum+1}${searchUrl}" id="nextBtn">
            		<i class="fa fa-angle-right"></i>
            	</a>
            </li>
       	</c:if>
    </ul>
    </div>
</div>