<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드 프로젝트</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script>
	$(function() {
		$("#signup").on("click", function() {
			location.href = "/member/signup";
		})
		$("#logout").on("click", function() {
			location.href = "/member/logout";
		})

		$("#mypage").on("click", function() {
			location.href = "/member/mypage";
		})
		$("#memberout").on("click", function() {
			let result = confirm("정말 탈퇴하시겠습니까?");
			if (result) {
				location.href = "/member/memberout";
			}
		})

	})
</script>
</head>
<body>
	<c:choose>
		<c:when test="${loginID == null}">
			<div class="loginBox p-4 shadow bg-white rounded">
				<h2 class="mb-5 text-center">로그인</h2>
				<form action="member/loginProc" method="post">
					<div class="form-row mb-3">
						<div class="col-12 mb-2">
							<input type="text" class="form-control" name="id" placeholder="아이디를 입력해주세요.">
						</div>
						<div class="col-12">
							<input type="password" class="form-control" name="pw"placeholder="비밀번호를 입력해주세요.">
						</div>
					</div>
					<div class="form-row align-items-center mt-4">
						<div class="col-6 text-center">
							<button class="btn btn-outline-success w-100" id="login">로그인</button>
						</div>
						<div class="col-6 text-center">
							<button type="button" class="btn btn-outline-primary w-100" id="signup">회원가입</button>
						</div>
					</div>
				</form>
			</div>
		</c:when>
		<c:otherwise>
			<div class="welcome text-center">
				<h2>환영합니다 <strong>${loginID}</strong> 님!</h2>
				<p>원하시는 기능을 선택해 주세요:)</p>
				<ul>
					<button id="mypage" class="btn btn-success">마이페이지</button>
					<button id="logout" class="btn btn-warning">로그아웃</button>
					<button id="memberout" class="btn btn-danger">회원탈퇴</button>
				</ul>
			</div>
		</c:otherwise>
	</c:choose>
</body>
</html>