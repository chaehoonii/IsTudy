function editCheck() {

	//비밀번호 입력 여부 + 확인란 체크
	var regpwd = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/;
	let userpwd = document.getElementById("user_pw");
	let userpwd2 = document.getElementById("pwd2");



	if (!regpwd.test(userpwd.value)) {
		alert("비밀번호를 잘못 입력하셨습니다.\n비밀번호는 영문 숫자 조합 8자리 이상입니다.\n");
		userpwd.focus();
		return false;
	}
	if (userpwd.value == '' || userpwd2.value == '') {
		alert("비밀번호와 비밀번호 확인란을 모두 입력해주세요.");
		userpwd.focus();
		return false;
	}
	if (userpwd.value != userpwd2.value) {
		alert("비밀번호가 비밀번호 확인란과 일치하지 않습니다.");
		userpwd2.focus();
		return false;
	}

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
	//닉네임 형식+중복 여부('N')
	if (document.getElementById("nickchk").value == 'N') {
		alert("닉네임 중복이 확인되지 않았습니다.");
		return false;
	}
	//이메일 형식+중복 여부('N')
	if (document.getElementById("emailchk").value == 'N') {
		alert("이메일 중복이 확인되지 않았습니다.");
		return false;
	}
	//번호 형식+중복 여부('N')
	if (document.getElementById("tel_chk").value == 'N') {
		alert("번호 중복이 확인되지 않았습니다.");
		return false;
	}
	return true;
}

$(function() {

	//유효성 검사
	//비밀번호
	let userpwd = document.getElementById("user_pw");
	let userpwd2 = document.getElementById("user_pw2");
	var regpwd = /^(?=.*\d)(?=.*[a-zA-Z]).{8,}$/;

	$("#user_pw").keyup(function() {
		if ($("#user_pw").val().length > 0) {
			if (!regpwd.test(userpwd.value)) {
				$("#pwdChk").html("취약한 비밀번호입니다.").css('color', 'red').css("font-size", "14px");
			} else {
				$("#pwdChk").html("사용 가능한 비밀번호입니다.").css('color', 'blue').css("font-size", "14px");
			}
		}
	});

	//비밀번호 확인
	$("#pwd2").keyup(function() {
		if ($("#user_pw").val() != $("#pwd2").val()) {
			$("#pwd2Chk").html("비밀번호가 일치하지 않습니다.").css('color', 'red').css("font-size", "14px");
		} else {
			$("#pwd2Chk").html("비밀번호가 일치합니다.").css('color', 'blue').css("font-size", "14px");
		}
	});

	//전화번호 확인
	let regTel2 = /^(010|011|016|019|02|031|032|041|051)[0-9]{3,4}[0-9]{4}$/;
	$("#tel").keyup(function() {
		if (!regTel2.test($("#tel").val())) {
			$("#telChk").html("전화번호 형식이 잘못 되었습니다.").css('color', 'red').css("font-size", "14px");
		} else {
			$("#telChk").html("").css('color', 'blue').css("font-size", "14px");
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

	$("#user_nick").keyup(function() {
		var nick = $("#user_nick").val();
		var nickovl = $("#nickoverlap").val();
		var url = "/users/userNickCheck";
		$.ajax({
			url: url,
			data: "nick=" + nick,
			type: "POST",
			success: function(result) {
				if (result > 0 && nick != nickovl) {   //중복 데이터 존재함 (불가능)
					$("#nick_chk").html("이미 이 닉네임으로 가입된 계정이 있습니다.");
					$("#nickchk").val('N');
					$("#nick_chk").css("color", "red").css("font-size", "14px");
				} else {         //중복 데이터 없음(가능)
					$("#nick_chk").html("");
					$("#nickchk").val('Y');
				}
			}
		});
	});
	$("#email").keyup(function() {
		var email = $("#email").val();
		var emailovl = $("#emailoverlap").val();
		var url = "/users/userEmailCheck"
		$.ajax({
			url: url,
			data: "email=" + email,
			type: "POST",
			success: function(result) {
				if (result > 0 && email != emailovl) {   //중복 데이터 존재함 (불가능)
					$("#email_chk").html("이미 이 이메일로 가입된 계정이 있습니다.");
					$("#emailchk").val('N');
					$("#email_chk").css("color", "red").css("font-size", "14px");
				} else {         //중복 데이터 없음(가능)
					$("#email_chk").html("");
					$("#emailchk").val('Y');
				}
			}
		});
	});
	$("#tel").keyup(function() {
		var tel = $("#tel").val();
		var telovl = $("#teloverlap").val();
		var url = "/users/userTelCheck"
		$.ajax({
			url: url,
			data: "tel=" + tel,
			type: "POST",
			success: function(result) {
				if (result > 0 && tel != telovl) {   //중복 데이터 존재함 (불가능)
					$("#tel_chk2").html("이미 이 번호로 가입된 계정이 있습니다.");
					$("#tel_chk").val('N');
					$("#tel_chk2").css("color", "red").css("font-size", "14px");
				} else {         //중복 데이터 없음(가능)
					$("#tel_chk2").html("");
					$("#tel_chk").val('Y');
				}
			}
		});
	});
});