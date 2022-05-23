$(function() {
	$(".searchText").keyup(function() {

		var val = $(this).val();

		if (val == "") {
			$(".eachContent").show();

		} else {
			$(".eachContent").hide();
			$(".eachContent:contains('" + val + "')").show();
		}
	})

	$(".modal_writing_button").click(function() {
		var board_num = $(this).children().first().text();
		var param = {
			"board_num": board_num
		}
		console.log(param);
		$.ajax({
			type: 'GET',
			url: '/admin/report_writing_Modal',
			data: param,
			success: function(data) {
				$('.modal_header').text(data.title);
				$('.modal_body').text(data.content);
			},
			error: function(e) {
			}
		})
		$(".modal").fadeIn();
	})

	$(".modal_content_button").click(function() {
		var report_num = $(this).children().first().text();
		var param = {
			"report_num": report_num
		}
		console.log(param);
		$.ajax({
			type: 'GET',
			url: '/admin/report_content_Modal',
			data: param,
			success: function(data) {
				$('.modal_header').text("신고 내용");
				$('.modal_body').text(data.report_content);
			},
			error: function(e) {
			}
		})
		$(".modal").fadeIn();
	})

	$(".modal_content").click(function() {
		$(".modal").fadeOut();
	})
	$(".modal").click(function() {
		$(".modal").fadeOut();
	})

	$(".ok").click(function() {
		if (confirm('확인하시겠습니까?')) {
			var cb = document.getElementsByName("check");

			for (var i = 0; i < cb.length; i++) {
				if (cb[i].checked == true) {
					var param = {
						"report_num": cb[i].value
					}
					console.log(cb[i].value);
					$.ajax({
						url: '/admin/confirmUpdate',
						type: 'GET',
						data: param,
						success: function(data) {
							alert("확인되었습니다.")
							location.href = location.href;
						},
						error: function(e) {
						}
					})
				}
			}
		}
	});
	$(".admindelete").click(function() {
		if (confirm('탈퇴시키시겠습니까?')) {
			var cb = document.getElementsByName("check");
			for (var i = 0; i < cb.length; i++) {
				if (cb[i].checked == true) {
					var param = {
						"report_num": cb[i].value
					}
					confirm('ajax전')
					$.ajax({
						url: '/admin/adminDelete',
						type: 'GET',
						data: param,
						success: function(data) {
							alert("삭제되었습니다.")
							location.href = location.href;
						},
						error: function(e) {
						}
					})
				}
			}
		}
	})
	 $(".types").click(function(){
		   
		   var button = document.querySelectorAll(".types");
		   
		   for(var i=0; i<button.length; i++){
			   button[i].classList.remove("button-click");
		   }
		   
		   this.classList.add('button-click');
		   
	   });
});

