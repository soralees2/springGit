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
</head>
<body>
		<div class="container p-5 mt-5 shadow bg-white rounded">
		<h2>회원가입</h2>
		<form action="${pageContext.request.contextPath}/joinView.mem"
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
							url:"${pageContext.request.contextPath}/idcheck.mem",
							type:"GET",
							data :"id="+$("#id").val(),
							contentType:"text/plain;charset=uft-8",
							dataType:"text"
						}).done(function(data){
							if(data==="use"){// 아이디 이미 존재
								alert("이미 사용중인 아이디입니다.");
								
							}else{
								var idUse = confirm("사용 가능한 아이디입니다.");
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
		location.href="${pageContext.request.contextPath}/index.jsp";
	})
	})
</script>
</body>
</html>