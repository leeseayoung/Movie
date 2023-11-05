<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link rel="stylesheet" href="/static/css/mainPage.css"  type="text/css">
</head>
<body>
		       <div id="wrap">
            <header class="d-flex">
                <div class="logo col-3 d-flex align-items-center">
                    <h1 class="text-primary">펭귄 리뷰</h1>
                </div>
                <div class="search col-7 d-flex justify-content-center align-items-center">
                    <div class="input-group mb-2 col-10 p-0">
                        <input type="text" class="form-control">
                        <div class="input-group-append">
                            <button class="btn" type="button">검색</button>
                        </div>
                    </div>
                </div>
                <div class="user col-2 d-flex justify-content-end align-items-center" >
                   	<c:if test = "${not empty userId}">
					<div class="mr-3">${userName}님 <a href="/user/logout">로그아웃</a></div>
					</c:if>
                </div>
            </header>
            <h1 class="text-center">영화 추가</h1>
            <section class="contents d-flex">
                <nav class="main-menu col-2 p-0">
                    <ul class="nav flex-column">
                    <li class="nav-item menu-item"><a href="http://localhost:8080/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                    <li class="nav-item menu-item"><a href="https://www.naver.com/" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 찜한 영화</a></li>
                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>

                    </ul>
                </nav>

                <!-- justify-content-between -->
                <article class="main-contents col-10 d-flex flex-wrap justify-content-around py-4">
                	
                	<div>
                		<div class="text-center">제목<input type="text" class="form-control center border-0" id="titleInput"></div>
                		<div class="text-center pt-3">런 타임<input type="text" class="form-control border-0" id="runTimeInput"></div>
                		<div class="text-center pt-3">장르<input type="text" class="form-control border-0" id="genreInput"></div>
                		<div class="text-center pt-3">개봉일<input type="text" class="form-control border-0" id="releaseDateInput"></div>
                		<div class="text-center pt-3">상영중<input type="checkbox" class="form-control border-0" id="checkBoxInput"></div>

                	
                	
                	</div>				
                	
						
					<div class="input-box border rounded mt-4">

						
						<div class="input-box border rounded">
						<textarea class="form-control border-0" placeholder="줄거리" rows="8" id="plotInput"></textarea>
						<div class="d-flex justify-content-between p-2">
							<input type="file" id="fileInput">
							<button type="button" class="btn btn-info btn-sm" id="addMovie-Btn">영화추가</button>
						</div>
					
						</div>		
					
					</div>
                	


                </article>
           
            </section>

	        

	 
            
            <footer>
                <div class="text-center text-secondary mt-3">
                   2023 펭귄 리뷰 
                </div>
            </footer>
        </div>
        
      	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
 
       	<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
        
        
        <script>
        $(document).ready(function() {
  
        	
        	$("#addMovie-Btn").on("click", function() {
        		
        	let title = $("#titleInput").val();
        	let runTime = $("#runTimeInput").val();
        	let genre = $("#genreInput").val();
        	let releaseDate = $("#releaseDateInput").val();
        	let checkBox = $("#checkBoxInput").is(":checked");   //체크박스 상태에 따라 "상영" 또는 "미상영" 설정	
        	
        	let plot = $("#plotInput").val();
        	let file = $("#fileInput")[0];
        	
        	alert("영화 상영중 : " + checkBox);  // alert으로 체크박스 상태 출력
        		
        		if(title == "") {
        			alert("제목을 입력하세요!");
        			return ;
        		}
        	
        		if(runTime == "") {
        			alert("런타임을 입력해주세요!");
        			return;
        		}
        	
        		if(genre == "") {
        			alert("장르를 입력해주세요!");
        			return;
        		}
        		
        		if(releaseDate == "") {
        			alert("개봉일을 입력해주세요!");
        			return;
        		}
        		
        		
        		if(plot == "") {
        			alert("줄거리를 입력해주세요!");
        			return;
        		}
        		
        		if(file.files.length == 0) {
        			alert("영화 이미지를 선택해주세요!");
        			return;
        		}
        		
				let formData = new FormData();
				formData.append("title", title);
				formData.append("genre", genre);
				formData.append("runTime", runTime);
				formData.append("releaseDate", releaseDate);
				formData.append("plot", plot);
				formData.append("screenBox", checkBox);
				formData.append("imageFile", file.files[0]);
        		
        		
				$.ajax({
        			type:"post"
        			, url:"/movie/create"
    				, data:formData
    				, enctype:"multipart/form-data"  // 파일 업로드 필수 옵션
    				, processData:false  // 파일 업로드 필수 옵션
    				, contentType:false   // 파일 업로드 필수 옵션
    				, success:function(data){
    					if(data.result == "success") {
    						location.href = "/movie/main-view";
    					} else{
    						alert("영화 추가 실패!");
    					}
    				}
					, error:function() {
						alert("영화 추가 에러!");
					}	
						

        		});
        		
        		
        	
        	});
        	
        	
        	
        });
        
        
        </script>
        
        
        
        
        
        
</body>
</html>