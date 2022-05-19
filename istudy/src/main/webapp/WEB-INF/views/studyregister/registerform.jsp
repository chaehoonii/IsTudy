<link rel="stylesheet" href="/css/studyregister/studyregister.css"
	type="text/css" />

<script>
	$(document).ready(
			function() {
				asyncMovePage("studyregister_1")
		});
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
	<div class="header" role="banner">
  		<h1 class="logo">
    		<a href="#"><span>I </span>s<span>T</span>udy</a>
  		</h1>
  	<div class="nav-wrap">
    	<nav class="main-nav" role="navigation">
      		<ul class="unstyled list-hover-slide">
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_1')">Step 1</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_2')">Step 2</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_3')">Step 3</a></li>
        		<li><a href="#" id="menulink" onclick="asyncMovePage('studyregister_4')">Step 4</a></li>
      		</ul>
      	<input type="submit" name="r_button" class="r_button" value="등록">
    	</nav>
    
  </div>
</div>
	<form id="register_form" action="studyRegisterOk" method="post" enctype="multipart/form-data">
		<div id="register_content"></div>
	</form>
</div>
<script src="/js/studyregister/roomUpload.js"></script>
<div style="clear: both"></div>



