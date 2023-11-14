<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>감상평</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/mainPage.css"  type="text/css">

</head>
<body>
		   <div id="wrap">
		        <header class="header d-flex">
		            <div class="logo col-3 d-flex align-items-center">
		                <h1>펭귄 리뷰</h1>
		            </div>
		            <div class="search col-7 d-flex justify-content-center align-items-center">
		                <div class="input-group col-10 p-0">
		                    <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		                    <div class="input-group-append">
		                        <button class="btn" type="button">검색</button>
		                    </div>
		                </div>
		            </div>
		            <div class="user col-2 d-flex justify-content-end align-items-center">
		                <c:if test="${not empty userId}">
		                    <div class="mr-3">${userName}님<a href="/user/logout">로그아웃</a></div>
		                </c:if>
		            </div>
		        </header>
	            <h1 class="text-center pt-3">영화 감상평</h1>
	            <section class="contents d-flex">
	                <nav class="main-menu col-2 p-0">
	                    <ul class="nav flex-column">
	                    <li class="nav-item menu-item"><a href="/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
	                    <li class="nav-item menu-item"><a href="/movie/favorite-view" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
	                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 찜한 영화</a></li>
	                    <li class="nav-item menu-item"><a href="/movie/post/list-view" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>
	
	                    </ul>
	                </nav>
	
	            
	                <section class="contents d-flex justify-content-center align-items-center col-9">
							 
						<div class="post-layout my-5 ">
	
							<div class="d-flex mt-3">
								<label class="col-2 pl-3">제목 : </label>
								<input type="text" class="form-control col-10" id="titleInput">
							</div>
							<textarea class="form-control mt-3" rows="7" id="contentInput"></textarea>
							
							
							
							<div class="d-flex justify-content-between mt-3">
								<a href="/movie/post/list-view" class="btn btn-secondary">목록으로</a>
								<button type="button" class="btn btn-secondary" id="saveBtn">저장</button>
							</div>
							
						</div>
					</section>
	           
	            </section>
	
		        
	
		 
	            
		        <footer class="bg-secondary d-flex justify-content-center align-items-center text-white">
		        	<h5>2023 펭귄 리뷰</h5>
		    	</footer>
    
        </div>
	    
	    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
       	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        
        <script>
        	$(document).ready(function() {
        		$("#saveBtn").on("click", function () {
    				let title = $("#titleInput").val();
    				let content = $("#contentInput").val();
    				
    				if(title == "") {
    					alert("제목을 입력하세요!");
    					return ;
    				}
    				
    				if(content == "") {
    					alert("내용을 입력하세요!");
    					return ;
    				}
    				
    				$.ajax({
    					type:"post"
    					, url:"/movie/post/create" 
    					, data:{"title":title, "content":content}
    					, success:function(data) {
    						if(data.result == "success"){
    							location.href = "/movie/main-view";
    						} else {
	    						alert("감상평 추가 실패!")
	    					}
    					}
    					, erroe:function() {
    						alert("감상평 추가 에러!!")
    					}
    					
    					
    				});
    				
        		});
        		
        	});
        
        </script>
	
	

</body>
</html>