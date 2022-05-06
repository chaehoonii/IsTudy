$(document).ready(function() {

	   var strData = "/";

	    var arrStep = strData.split(',');

	   

	    $('.check').prop('checked', false); // 일단 모두 uncheck

	   

	    for (var nArrCnt in arrStep) {

	                    $("input[name=s_check][value="+arrStep[nArrCnt]+"]").prop("checked",true);

	    }    

	});