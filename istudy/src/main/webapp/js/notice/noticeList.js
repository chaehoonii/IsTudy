	$(".noticeList").click(function() {
		
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
				$('#modalContent').html(data.content);
				console.log(data.board_num);
			let EditBtn = document.querySelector('#modalNoticeEdit');
			EditBtn.addEventListener("click", ()=>{
				location.href='/admin/notice/noticeEdit?board_num='+data.board_num;
			});
			let DelBtn = document.querySelector('#modalNoticeDel');
			DelBtn.addEventListener("click", ()=>{
				window.location.href='/board/boardDelete?board_num='+data.board_num;
			})
			},
			error: function(e) {
			}
		})
	});
