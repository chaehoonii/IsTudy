function editCheck() {
	let tel = document.querySelector("#tel");
	if (tel.value == '') {
		alert("전화번호를 입력하세요");
		tel.focus();
		return false;
	}
	let email = document.querySelector("#email");
	if (email.value == '') {
		alert("이메일을 입력하세요.");
		email.focus();
		return false;
	}
	let userpw = document.querySelector("#user_pw");
	if (userpw.value == '') {
		alert("비밀번호를 입력하세요.");
		userpw.focus();
		return false;
	}
	let pwd = document.querySelector("#pwd2");
	if (pwd.value == '') {
		alert("비밀번호확인을 입력하세요.");
		pwd.focus();
		return false;
	}
	let username = document.querySelector("#user_name");
	if (username.value == '') {
		alert("이름을 입력하세요.");
		username.focus();
		return false;
	}
	let usernick = document.querySelector("#user_nick");
	if (usernick.value == '') {
		alert("닉네임을 입력하세요.");
		usernick.focus();
		return false;
	}
	var permission = document.getElementsByName('permission');
	var permission_type = null;
	for (var i = 0; i < permission.length; i++) {
		if (permission[i].checked == true) {
			permission_type = permission[i].value;
		}
	}
	if (permission_type == null) {
		alert("분류를 선택하세요.");
		return false;
	}
	var study_type_num = document.getElementsByName('study_type_num');
	var sel_type = null;
	for (var i = 0; i < study_type_num.length; i++) {
		if (study_type_num[i].checked == true) {
			sel_type = study_type_num[i].value;
		}
	}
	if (sel_type == null) {
		alert("관심분야를 선택하세요.");
		return false;
	}
	let regTel = /^(010|011|016|019|02|031|032|041|051)[0-9]{3,4}[0-9]{4}$/;
	if (!regTel.test(tel.value)) {
		alert("전화번호 형식이 잘못 되었습니다. 확인 후 다시 입력해주세요.");
		tel.focus();
		return false;
	}
	return true;
}

$(function() {
	//전화번호 확인
	let regTel2 = /^(010|011|016|019|02|031|032|041|051)[0-9]{3,4}[0-9]{4}$/;
	$("#tel").keyup(function() {
		if (!regTel2.test($("#tel").val())) {
			$("#telChk").html("전화번호 형식이 잘못 되었습니다.").css('color', 'red').css("font-size", "14px");
		} else {
			$("#telChk").html("&nbsp;").css('color', 'blue').css("font-size", "14px");
		}
	});

	$("#mFrm").submit(function() {
		alert("회원정보 수정이 완료되었습니다.");
		return true;
	});

	// 이미지 미리보기
	$(document).on("change", '#profile_img', function() {
		setImageFromFile(this, "#user_img");
	});

	function setImageFromFile(input, expression) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(expression).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}

	//  이미지 영역 클릭하면 파일 버튼 클릭
	$("#user_img_wrap").click(function() {
		$("#profile_img").trigger("click");
		$("#img_upload_phr").css("display", "none");
	})
	$("#study_type1").click(function() {
		if ($(this).is(':checked')) {
			$("#career_list").hide();
			$(".career_url").hide();

		}
	})

	$("#study_type2").click(function() {
		if ($(this).is(':checked')) {
			$("#career_list").show();
			$(".career_url").show();
		}
	})

});