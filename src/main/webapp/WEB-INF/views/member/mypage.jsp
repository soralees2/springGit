<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	*{box-sizing:border-box;}
	#container {margin: auto};
	.list-group-item{overflow:hidden;}
	#comm{float:left; padding:0; width:25%;}
	.info{float:left; width:65%;}
	.btns{float:left; width:10%; padding:0;}
	#footer{text-align:center;}
</style>
<script>
	$(function() {
		$.ajax({
			url:"${pageContext.request.contextPath}/page.mem", type:"get", dataType:"json"
		}).done(function(resp){
			console.log(resp);
			console.log(resp.id);
			$("#divId").text(resp.id);
			$("#divName").text(resp.name);
			$("#divContact").text(resp.contact);
			$("#divEmail").text(resp.email);
			$("#divPostcode").text(resp.postcode);
			$("#divAddress1").text(resp.address1);
			$("#divAddress2").text(resp.address2);
		});

		$("#back").on("click", function() {
			location.href = "/index.jsp";
		})
		
		$("#nameBtn").on("click",function(){
			$("#divName").attr("contenteditable","true");
			$("#divName").focus();
		})
		$("#contactBtn").on("click",function(){
			$("#divContact").attr("contenteditable","true");
			$("#divContact").focus();
		})
		$("#emailBtn").on("click",function(){
			$("#divEmail").attr("contenteditable","true");
			$("#divEmail").focus();
		})
		$("#postcodeBtn").on("click",function(){
			new daum.Postcode({
	        	oncomplete: function (data) {
	        		var roadAddr = data.roadAddress;
	        		$("#divPostcode").text(data.zonecode);
	        		$("#divAddress1").text(roadAddr);
	        	}
			}).open();
		})
		$("#address2Btn").on("click",function(){
			$("#divAddress2").attr("contenteditable","true");
			$("#divAddress2").focus();
		})
		
		$("#frm").on("submit",function(){
			$("#id").val($("#divId").text());
			$("#name").val($("#divName").text());
			$("#contact").val($("#divContact").text());
			$("#email").val($("#divEmail").text());
			$("#postcode").val($("#divPostcode").text());
			$("#address1").val($("#divAddress1").text());
			$("#address2").val($("#divAddress2").text());
		})
		
		
		
	})
</script>
</head>
<body>
	<form action="${pageContext.request.contextPath}/modifyInfo.mem" method="post" id="frm">
	<div class="card border-secondary mb-3" id="container" style="width: 35rem;">
		<div class="card-body text-secondary">
			<h5 class="card-title" id="title">${login.name}님의 정보관리</h5>
		</div>
		<ul class="list-group list-group-flush">
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					ID  :
				</div>
				<div class="info" id="divId">
					<!-- ${login.id} -->
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					NAME  :
				</div>
				<div class="info" id="divName">
					<!-- ${login.name} -->
				</div>
				<div class="btns">
					<button type="button" id="nameBtn" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					CONTACT  :
				</div>
				<div class="info" id="divContact">
					<!-- ${login.contact} -->
				</div>
				<div class="btns">
					<button type="button" id="contactBtn" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					EMAIL  :
				</div>
				<div class="info" id="divEmail">
					<!-- ${login.email} -->
				</div>
				<div class="btns">
					<button type="button" id="emailBtn" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					POSTCODE  :
				</div>
				<div class="info" id="divPostcode">
					<!-- ${login.postcode} -->
				</div>
				<div class="btns">
					<button type="button" id="postcodeBtn" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					ADDRESS1  :
				</div>
				<div class="info" id="divAddress1">
					<!-- ${login.address1} -->
				</div>
			</li>
			<li class="list-group-item">
				<div class="card-body text-secondary" id="comm">
					ADDRESS2  :
				</div>
				<div class="info" id="divAddress2">
					<!-- ${login.address2} -->
				</div>
				<div class="btns">
					<button type="button" id="address2Btn" class="btn btn-outline-info btn-sm">수정</button>
				</div>
			</li>
		</ul>
		<div class="card-body" id="footer">
			<button type="submit" class="btn btn-secondary">수정사항 반영하기</button>
			<button type="button" class="btn btn-secondary" id="back">Back</button>
		</div>
	</div>
	<input type=hidden id=id name=id value="${login.id}">
	<input type=hidden id=name name=name value="${login.name}">
	<input type=hidden id=contact name=contact value="${login.contact}">
	<input type=hidden id=email name=email value="${login.email}">
	<input type=hidden id=postcode name=postcode value="${login.postcode}">
	<input type=hidden id=address1 name=address1 value="${login.address1}">
	<input type=hidden id=address2 name=address2 value="${login.address2}">
	</form>
</body>
</html>