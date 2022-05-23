//datepicker 한글 설정
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
	$( "#datepicker1" ).datepicker({	});
});
$( function() {
	$( "#datepicker2" ).datepicker({	});
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
  	//console.log(typeof result)
  	//ajaxSend('smentor', result)
	//document.getElementById('study_list').innerText= result;
}
// 스터디 분류
function getClassValue(){
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
  	//console.log(typeof result)
  	//ajaxSend('sclass', result)
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
	//console.log(typeof result2)
	//ajaxSend('sstatus',result2)
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
	//console.log(typeof result3)
	//ajaxSend('#langlist',result3)
	//document.getElementById('study_list').innerText= result;
}
function ajaxSend(param, value){
	//alert(typeof value)
	data=$('#frm').serialize()
	alert(data)
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
				tag+='<div class="info">'
				tag+=	'<div class="simg">'
				tag+=		'<img src="/images/study_info/'+vo.study_img+ '" class="img img-thumbnail">'
				tag+=	'</div>'
				tag+=	'<div class="sinfo">'
				tag+=		'<span class="sname">'+vo.study_name+'</span><br/>'	
				tag+=		'<span class="sid">'+vo.host_id+'</span>'	
				tag+=		'<span class="smentor">'
				if(vo.is_mentor=='T'){
					tag+='멘토'
				}else if(vo.is_mentor=='F'){
					tag+='일반'
				}
				tag+=		'</span>'	
				tag+=		'<span class="smax">'+vo.in_people+'/'+vo.max+'</span>'	
				tag+=		'<span class="sname">'+vo.study_type_name+'</span><br/>'
				tag+=		'<span class="sdate">'+vo.start_date+ '~'+vo.finish_date+'</span>'
				$(vo.lang_list).each(function(i, lang){
					tag+=			'<span class="lang_list">&nbsp;'+lang+'&nbsp;</span>&nbsp;'
				})
				$(vo.tag_list).each(function(t, tg){
					tag+=	'<span class="tag_list">&nbsp;'+tg+'&nbsp;</span>&nbsp;'
					/* console.log("*************************")
					console.log(tag)
					console.log("*************************") */
				})
				
				tag+=	'</div>'
				tag+='</div>'
				//alert(tag)
				//console.log(tag)
				//console.log("*************************")
			})
			$('#study_list').html(tag)
			}
		},
		error:function(e){
			console.log(e.responseText)
		}		
	})
}