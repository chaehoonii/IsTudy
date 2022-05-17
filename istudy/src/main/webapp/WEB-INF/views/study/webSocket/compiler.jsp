<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="/css/defaultStudyPractice.css">
<link rel="stylesheet" type="text/css" href="/css/study/codemirror.css">
<link rel="stylesheet" type="text/css" href="/css/study/mdn-like.css">
<link rel="stylesheet" type="text/css" href="/css/study/dracula.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="/js/study/codemirror.js"></script>
<script src="/js/study/python.js"></script>
<script src="/js/study/clike.js"></script>

<style>
.coding {
	height: 90%;
	padding: 30px;
}

.compiler, .input, .result {
	height: 20%;
	float: left;
	width: 100%;
}

.compiler {
	height: 85%;
}

.compiler, .input {
	margin-bottom: 30px;
}

.codingFunc {
	width: 100%;
	height: 90%;
	float: right;
	font-size:13px;
}

.execute {
	margin: 20px;
	float: right;
}
#topBar{display:none;}
.bottom{display:none;}
</style>
</head>
<script>
	
</script>
<body onresize="parent.resizeTo(500,800)" onload="parent.resizeTo(500,800)">
	<div class="main">
		<div class="coding">
			<div class="codingFunc">
				<div class="languageSelect">
					<select id="selectpart" onchange="change_opt(this)">
						<option value="python">Python</option>
						<option value="C">C</option>
						<option value="java">java</option>
					</select>
				</div>
				<form name="compileView" style="width: 100%; height: 70%;" method="post">
					<div class="compiler img-rounded" style="padding: 5px; height: 40vh;">
						<label>코드 작성</label>
						<textarea style="width: 100%; height: 30vh; resize:none;" name="CodeText"
							id="editor"></textarea>
					</div>
					<div class="input img-rounded" style="padding: 5px; height: 15vh;">
						<label> 입력값 </label>
						<textarea style="width: 100%; height: 15vh;" name="InputText"
							id="input"></textarea>
					</div>
					<input type="button" class="btn"
						style="margin: 0px 10px; float: right;" value="실행"
						onclick="processCompile();">
				</form>

				<div class="result img-rounded" style="padding: 5px; height: 15vh;">
					<label>결과</label>
					<textarea style="width: 100%; height: 15vh;" name="ResultText"
						id="result"></textarea>
				</div>
			</div>
		</div>
		<form name="tstform" method="post">
			<input type="hidden" id="src" name="src" />
		</form>
	</div>
	<!-- Library textarea에 적용하는 과정 -->
	<script>
		var settingFile = 'python';
		var set_mode = 'python';

		var textarea = document.getElementById('editor');
		var editor = CodeMirror.fromTextArea(textarea, {
			lineNumbers : true,
			lineWrapping : true,
			theme : "dracula",
			mode : "python",
			value : textarea.value,
		});

		var textarea2 = document.getElementById('result');
		var editor2 = CodeMirror.fromTextArea(textarea2, {
			lineNumbers : true,
			lineWrapping : true,
			mode : "python",
			theme : "dracula",
			value : textarea2.value
		});

		var textarea3 = document.getElementById('input');
		var editor3 = CodeMirror.fromTextArea(textarea3, {
			lineNumbers : true,
			lineWrapping : true,
			mode : "python",
			theme : "dracula",
			value : textarea3.value
		});

		editor.setSize("100%", "100%");
		editor2.setSize("100%", "100%");
		editor3.setSize("100%", "100%");

		function change_opt(e) {
			editor.setSize("0%", "0%"); // 0%에서 100%로 늘려줘야 점점 안커짐....,,,,,
			editor2.setSize("0%", "0%");
			editor3.setSize("0%", "0%");
			set_mode = e.value;

			if (e.value === "python") {
				settingFile = 'python';
			} else if (e.value === "C") {
				settingFile = "text/x-csrc";
			} else {
				settingFile = "text/x-java";
			}

			editor = CodeMirror.fromTextArea(textarea, {
				lineNumbers : true,
				lineWrapping : true,
				theme : "dracula",
				mode : settingFile,
				value : textarea.value,
			});

			editor2 = CodeMirror.fromTextArea(textarea2, {
				lineNumbers : true,
				lineWrapping : true,
				theme : "dracula",
				mode : settingFile,
				value : textarea2.value
			});

			editor3 = CodeMirror.fromTextArea(textarea3, {
				lineNumbers : true,
				lineWrapping : true,
				theme : "dracula",
				mode : settingFile,
				value : textarea3.value
			});

			editor.setSize("100%", "100%");
			editor2.setSize("100%", "100%");
			editor3.setSize("100%", "100%");

			console.log(e.value);
			if (e.value === "java") {
				editor.setValue("public class MentoMenti {\n\tpublic static void main(String args[]) {\n\n\t}\n}");
			}
		}

		function processCompile() {
			var total_data = {
				mode : set_mode,
				src : editor.getValue(),
				input : editor3.getValue(),
			};

			$.ajax({
				url : "https://localhost:8060/WebCompile",
				type : "POST",
				async : true,
				data : total_data,
				success : function(data) {
					editor2.setValue(data);
				}
			});
		}
	</script>
	</body>