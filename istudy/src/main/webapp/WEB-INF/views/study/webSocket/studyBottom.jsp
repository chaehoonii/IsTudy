<!-- 수업 기능메뉴 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/css/study/bottomBar.css" rel="stylesheet" type="text/css"> 


<div class="function">
	<div class="icon-box">
		<div class="icon">
			<div class="icon movebtn" style="padding:0;"><a href="#"><i class="fa-light fa-message-smile fa-3x chaticon"></i></a>
				<div class="moveExplain">
					채팅
				</div>
			</div>
		</div>
		<div class="icon">
			<div class="icon micbtn inactive" style="padding:0;"><a id="muter" onclick="share_microphone();"><i class="fas fa-microphone-slash fa-3x mic"></i></a>
				<div class="nonemic_ex">
					마이크 켜기
				</div>
				<div class="usemic_ex">
					마이크 끄기
				</div>
			</div>
		</div>		
		<div class="icon">
			<div class="icon screenbtn" style="padding:0;"><a href="javascript:void(0);" onclick="share_monitor()"><i class="fas fa-desktop fa-3x monitor"></i></a>
				<div class="screenExplain">
					화면공유
				</div>
			</div>
		</div>
		
		<div class="icon">
			<div class="icon compilerbtn" style="padding:0;"><a onclick="openCompiler()" href="#"><i class="fa-solid fa-c fa-3x c"></i></a>
				<div class="compilerExplain">
					컴파일러
				</div>
			</div>
		</div>
	</div>
</div>
<span class="exit-box"><a id="exitBtn" onclick="exit()" href="#"><i class="fas fa-sign-out-alt fa-2x exit"></i></a></span>


<script>
	function exit(){
		if(confirm("스터디방에서 나가시겠습니까?")){
			location.replace("/study?study_num=${vo.study_num}");
		}else{
			
		}
	}
	
	function openCompiler(){
		var url = "/compiler";
		var name = "compiler";
		var popupWidth = 500;
		var popupHeight = 700;
		var popupX = (window.screen.width / 2) - (popupWidth / 2);
		var popupY = (window.screen.height / 2) - (popupHeight / 2);
		var option = "toolbar=no, location=no, status=no, scrollbars=no, resizable=no"
		myExternalWindow = window.open(url, name, option+ ', left='+ popupX + ', top='+ popupY);
		myExternalWindow.resizeTo(popupWidth,popupHeight);
	}
	
	const muter = document.querySelector("#muter");
	muter.addEventListener("click", (e) => {
	  ["fa-microphone", "fa-microphone-slash"].forEach(
	    c => e.target.classList.toggle(c));
	});
	document.querySelector('div.micbtn').addEventListener('click', function() {
		  this.classList.toggle('inactive');
		  this.classList.toggle('active');
		});
</script>
