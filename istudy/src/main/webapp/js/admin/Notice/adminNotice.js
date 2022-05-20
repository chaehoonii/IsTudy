$(".adminNoticeList").click(function() {

	var board_num = $(this).children().first().text();
	var param = {
		"board_num": board_num
	}
	$.ajax({
		type: 'GET',
		url: '/notice/noticeListModal',
		data: param,
		success: function(data) {
			$('#modalTitle').text(data.title);
			$('#modalContent').html(data.content);
		},
		error: function(e) {
		}
	})
});
