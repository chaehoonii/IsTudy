<link rel="stylesheet" href="/css/studyregister/studyregister.css"
	type="text/css" />
<script>
	$(document).ready(
			function() {

				var strData = "s1, s2";

				var arrStep = strData.split(',');

				$('.check').prop('checked', false); // 일단 모두 uncheck	  
				for ( var nArrCnt in arrStep) {
					$("input[name=s_check][value=" + arrStep[nArrCnt] + "]")
							.prop("checked", true);
				}
				asyncMovePage("studyregister_1")
			});
</script>
<script>
	function asyncMovePage(url) {
		// ajax option
		var ajaxOption = {
			url : url,
			async : true,
			type : "GET",
			dataType : "html",
			cache : false
		};

		$.ajax(ajaxOption).done(function(data) {

			// Contents 영역 삭제
			$('#register_content').children().remove();
			// Contents 영역 교체
			$('#register_content').html(data);
			$('#register_content').html($('#sub_register_content').html());
		});
	}
</script>

<!-- ///////////////////////////사이드 메뉴//////////////////////////////// -->
<div class="register_content">
	<div class="side_menu">
		<div class="sidebar">
				<div class="cate">
					<span class="menu"> <input type="button" class="menulink" value="Step 1" onclick="asyncMovePage('studyregister_1')">
						<input type="checkbox" name="s_check" class="check" value="s1" />
					</span>
					<ul>
						<li>스터디 종류</li>
						<li>스터디 분류</li>
					</ul>
				</div>
				<div class="cate">
					<span class="menu"><input type="button" class="menulink" value="Step 2" onclick="asyncMovePage('studyregister_2')">
					<input type="checkbox" name="s_check" class="check" value="s2" /> </span>
					<ul>
						<li>스터디 제목</li>
						<li>스터디 대표 이미지</li>
						<li>스터디 내용</li>
					</ul>
				</div>
				<div class="cate">
					<span class="menu"> <input type="button" class="menulink" value="Step 3" onclick="asyncMovePage('studyregister_3')">
					<input type="checkbox" name="s_check" class="check" value="s3" />
					</span>
					<ul>
						<li>스터디 모집 인원</li>
						<li>스터디 상태</li>
						<li>스터디 주의사항</li>
					</ul>
				</div>
				<div class="cate">
					<span class="menu"> <input type="button" class="menulink" value="Step 4" onclick="asyncMovePage('studyregister_4')">
						<input type="checkbox" name="s_check" class="check" value="s4" />
					</span>
					<ul>
						<li>스터디 기간</li>
						<li>사용 언어</li>
					</ul>
				</div>
				<input type="submit" name="r_button" class="r_button" value="등록">
		</div>
	<!-- sidebar -->
	</div>
	<div id="register_content"></div>
</div>



