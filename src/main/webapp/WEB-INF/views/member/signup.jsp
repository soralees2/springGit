<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<style>
.joinbox {
	border: 1px solid #ddd;
	max-width: 700px;
}

.joinhi {
	text-align: center;
	margin-bottom: 45px;
}

input, button, select {
	font-size: 0.9rem !important;
}

div[class*="col-"] span {
	font-size: 13px;
}

.form-row:last-of-type input {
	font-weight: bold;
}

.pw-check span {
	display: none;
}
</style>
</head>
<body>
		<div class="container joinbox p-5 mt-5 shadow bg-white rounded">
		<h2 class="joinhi">회원가입</h2>
		<form action="/member/join"
			method="post" id="checkForm">
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="inlineFormInput">아이디</label>
				</div>
				<div class="col-8 col-sm-auto mb-2">
					<input type="text" class="form-control" name="id" id="id"
						placeholder="아이디를 입력해주세요.">
				</div>
				<div class="col-4 col-sm-auto mb-2">
					<input type="button" id="check" class="btn btn-dark w-100"
						value="중복확인">
				</div>
			</div>
			<div class="form-row align-items-cente">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">비밀번호</label>
				</div>
				<div class="col-12 col-sm-auto mb-2">
					<input type="password" class="form-control" name="inp_pw01"
						id="inp_pw01" placeholder="비밀번호를 입력해주세요.">
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">비밀번호 확인</label>
				</div>
				<div class="col-12 col-sm-auto mb-2">
					<input type="password" class="form-control" id="inp_pw02"
						placeholder="비밀번호를 입력해주세요.">
				</div>
				<div class="col-12 col-sm-auto pw-check mb-2">
					<span class="text-danger" id="pw-danger">비밀번호가 일치하지 않습니다!</span> <span
						class="text-success" id="pw-success">비밀번호가 일치합니다.</span>
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">이름</label>
				</div>
				<div class="col-12 col-sm-auto mb-2">
					<input type="text" class="form-control" name="name" id="name"
						placeholder="이름을 입력해주세요.">
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">전화번호</label>
				</div>
				<div class="col-4 col-sm-auto mb-2">
					<select class="form-control" id="phone" name="phone">
						<option>02</option>
						<option>010</option>
						<option>031</option>
					</select>
				</div>

				<div class="col-4 col-sm-auto mb-2">
					<input type="text" class="form-control" name="phone1" id="phone1"
						size="4">
				</div>
				<div class="col-4 col-sm-auto mb-2">
					<input type="text" class="form-control" name="phone2" id="phone2"
						size="4">
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">이메일</label>
				</div>
				<div class="col-12 col-sm-auto mb-2">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="이메일~">
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">우편번호</label>
				</div>
				<div class="col-8 col-sm-auto mb-2">
					<input type="text" class="form-control" name="postcode"
						id="postcode">
				</div>
				<div class="col-4 col-sm-auto mb-2">
					<button type="button" class="btn btn-dark w-100" id="search">찾기</button>
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">주소1</label>
				</div>
				<div class="col-12 col-sm-10 mb-2">
					<input type="text" class="form-control" name="address1"
						id="address1" placeholder="주소를 입력해 주세요.">
				</div>
			</div>
			<div class="form-row align-items-center">
				<div class="col-12 col-sm-2 mb-2">
					<label class="mb-0" for="">주소2</label>
				</div>
				<div class="col-12 col-sm-10 mb-2">
					<input type="text" class="form-control" name="address2"
						id="address2" placeholder="주소를 입력해 주세요.">
				</div>
			</div>
			<div class="form-row align-items-center mt-5">
				<div class="col-4 text-center">
					<input type="button" class="btn btn-outline-primary w-100"
						value="회원가입" id="send">
				</div>
				<div class="col-4 text-center">
					<input type="reset" class="btn btn-outline-secondary w-100"
						value="다시입력">
				</div>
				<div class="col-4 text-center">
					<input type="button" class="btn btn-outline-primary w-100"
						value="뒤로가기" id="back">
				</div>
			</div>
		</form>
	</div>
	<script>
	var isIdCheck = false;
	$(function() {
		$("#check").on(
				"click",
				function() {
					let idInput = document.getElementById("id");
					let idReg = /^[a-z0-9]{5,20}$/;
					let resultId = idReg.test(idInput.value);
					if (resultId) {
						$.ajax({
							url:"/member/idCheck",
							data:{id:$("#id").val()}
							}).done(function(data){
							if(data==="1"){// 아이디 이미 존재
								alert("이미 사용중인 아이디입니다.");
								
							}else{
								var idUse = confirm("사용 가능한 아이디입니다. 사용하시겠습니까?");
								if(idUse){
								isIdCheck = true;
																							
								}
							}
						});
						
					} else {
						alert("올바른 아이디를 입력해주세요!");
					}
				})
		$("#id").on("keyup", function() {
			isIdCheck = false;
		})
	$("#back").on("click",function(){
		location.href="/";
	})
	})
	
	
	document.getElementById("inp_pw02").onkeyup = function() {
			let chkPW = document.getElementById("inp_pw01").value;
			if (chkPW === this.value) {
				document.getElementById("pw-success").setAttribute("style",
						"display:block");
				document.getElementById("pw-danger").setAttribute("style",
						"display:none");
			} else {
				document.getElementById("pw-success").setAttribute("style",
						"display:none");
				document.getElementById("pw-danger").setAttribute("style",
						"display:block");

			}
		}

		document.getElementById("search").onclick = function() {
			new daum.Postcode({
				oncomplete : function(data) {
					let roadAddr = data.roadAddress;

					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address1").value = roadAddr;
				}
			}).open();
		};

		let idInput = document.getElementById("id");
		let pwInput = document.getElementById("inp_pw01");
		let nameInput = document.getElementById("name");
		let phone1Input = document.getElementById("phone1");
		let phone2Input = document.getElementById("phone2");

		let idReg = /^[a-z0-9]{5,20}$/;
		let pwReg = /^[^ㄱ-ㅎ]\S{8,16}$/;
		let nameRegex = /^[가-힣A-Za-z]+$/;

		let phone1Reg = /^\d{3,4}$/;
		let phone2Reg = /^\d{4}$/;

		let check = document.getElementById("checkForm");

		document.getElementById("send").onclick = function() {

			let resultId = idReg.test(idInput.value);
			resultId.addClassName
			let resultPw = pwReg.test(pwInput.value);
			let resultName = nameRegex.test(nameInput.value);

			let resultPhone1 = phone1Reg.test(phone1Input.value);
			let resultPhone2 = phone2Reg.test(phone2Input.value);

			if (!resultId) {
				alert("아이디는 5-20자의 영문 소문자,숫자만 사용 가능합니다.");
				return;
			}
			if (!resultPw) {
				alert("비밀번호는 8-16자 영문 대,소문자,숫자와 특수기호를 사용하세요.");
				return;
			}
			if (!resultName) {
				alert("이름은 한글과 영문 대,소문자를 사용하세요.(특수기호,공백 사용 불가)");
				return;
			}
			if (!resultPhone1 || !resultPhone2) {
				alert("전화번호를 정확히 입력해주세요.");
				return;
			}
			if (isIdCheck == false) {
				alert("아이디 중복체크를 해주세요!");
				return;
			}

			document.getElementById("checkForm").submit();
		};
</script>
</body>
</html>