	$(".adminNoticeList").click(function() {
		
		var board_num = $(this).children().first().text();
		var param = {
			"board_num" : board_num
		} 
		console.log(param);
		$.ajax({
			type: 'GET',
			url: '/notice/noticeListModal',
			data: param,
			success: function(data) {
				$('#modalTitle').text(data.title);
				$('#modalContent').text(data.content);
			},
			error: function(e) {
			}
		})
	});
