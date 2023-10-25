<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/join.css"  type="text/css">
</head>
<body>
	<div id="wrap">
		<header id="head" class="bg-warning d-flex justify-content-center align-items-center">
			<h1>펭귄 영화 리뷰</h1>
		</header>
		
		
		<section class="d-flex">
				
					<div class=" col-4"></div>
					<div class=" col-4">
						<div class="input-box my-5">
							<h1 class="text-center">회원 가입</h1>
							
								<div class="d-flex">
									<input type="text" placeholder="아이디" class="form-control mt-4" id="loginInput">
									<button type="button" class="btn btn-sm btn-info ml-3" id="isDuplicateBtn">중복확인</button>
								</div>
								
								<div class="small text-success d-none" id="avalicableText">사용가능한 아이디 입니다!</div>
								<div class="small text-danger d-none" id="dupliateText">중복된 아이디 입니다!</div>
								
							<input type="password" placeholder="비밀번호" class="form-control mt-4" id="passwordInput">
							<input type="password" placeholder="비밀번호 확인" class="form-control mt-4" id="passwordConfirmInput">
							<input type="text" placeholder="이름" class="form-control mt-4" id="nameInput">
							<input type="text" placeholder="이메일" class="form-control mt-4" id="emailInput">
							
							<input type="text" placeholder="관리자 코드" class="form-control mt-4" id="managerCodeInput">
							
							<button type="button" class="btn btn-secondary btn-block mt-4" id="joinBtn">가입</button>
						</div>
					
					</div>
					<div class=" col-4"></div>
				
		
		</section>
		
		
		
        <footer class="d-flex align-items-center mt-3">
        			대표전화 : 02-000-1121 / 
					제호 : 펭귄 영화 / 등록번호 : 서울,바00098 / 등록일자 : 2023년 10월 20일 /
					E-mail : penguin@naver.com
		</footer>
	
	</div>



	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function() {
			
			//중복확인 체크 여부
			var isCheckDuplicate = false;
			var isDuplicate = true;
			
			$("#loginInput").on("input", function() {
				 isCheckDuplicate = false;
				 isDuplicate = true;
				 
					$("#avalicableText").addClass("d-none");
					$("#dupliateText").addClass("d-none");
			});
			
			
			$("#isDuplicateBtn").on("click", function() {
				let id = $("#loginInput").val();
				
				if(id == "") {
					alert("아이디를 입력하세요");
					return ;
				}
				
				
				$.ajax({
					type:"get"
					, url:"/user/duplicate-id"
					, data:{"loginId":id}
					, success:function(data) {
						
						isCheckDuplicate = true;
						
						
						if(data.isDuplicate) {
							// 중복
							$("#dupliateText").removeClass("d-none");
							$("#avalicableText").addClass("d-none");
							
							isDuplicate = true;
						} else {
							//중복되지 않았다
							$("#avalicableText").removeClass("d-none");
							$("#dupliateText").addClass("d-none");
							
							isDuplicate = false;
						}
						
					}
					, error:function() {
						alert("중복확인 에러!!");
					}
					
				});

			});
			
			$("#joinBtn").on("click", function() {
				
				let loginId = $("#loginInput").val();
				let password = $("#passwordInput").val();
				let passwordCheck = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				let managerCode = $("#managerCodeInput").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요!");
					return;
				}
				
				// 중복체크가 안된경우
				if(!isCheckDuplicate) {
					alert("아이디 중복체크를 해주세요");
					return ;
				}
				
				//중복된 id인 경우
				if(isDuplicate) {
					alert("중복된 아이디 입니다!");
					return ;
				}
				
				
				if(password == "") {
					alert("비밀번호를 입력하세요!");
					return;
					
				}
				
				if(password != passwordCheck) {
					alert("비밀번호가 일치하지 않습니다!");
					return;
					
				}
				
				if(name == "") {
					alert("이름을 입력하세요!");
					return;
					
				}
				
				if(email == "") {
					alert("이메일을 입력하세요!");
					return;
					
				}
				
				$.ajax({
					type:"post"
					, url:"/user/join"
					, data:{"loginId":loginId, "password":password, "name":name, "email":email, "managerCode":managerCode}
					, success:function(data) {
						
						if(data.result == "success") {
							location.href = "/user/login-view";
						} else {
							alert("회원가입 실패!!");
						}
						
						
					}
					, error:function() {
						alert("회원가입 에러!!");
					}
				});
				
				
				
			});
			
			
		});
	
	
	</script>







</body>
</html>