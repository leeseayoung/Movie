<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 상세 정보</title>
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
	                   <c:if test="${not empty userId}">
						<div class="mr-3">${userName}님 <a href="/user/logout">로그아웃</a></div>
						</c:if>
	                </div>
	            </header>
				 <h1 class="text-center"><a class="text-warning">영화 정보</a></h1>
           		 
           		 
           		 <section class="contents d-flex">
	                <nav class="main-menu col-2 p-0">
	                    <ul class="nav flex-column">
	                        <li class="nav-item menu-item"><a href="http://localhost:8080/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
	                        <li class="nav-item menu-item"><a href="https://www.naver.com/" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
	                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>
	
	                    </ul>
	                </nav>
					            <article class="main-contents col-10 justify-content-around py-4">
                <div class="d-flex">
                    <div class="mr-3">
                        <img alt="영화 이미지" class="h-100 w-100" src="${movieDetail.imagePath}">
                        <label><br>줄거리 : ${movieDetail.plot}</label>
                    </div>
                    <div>
                        <label>제목 : ${movieDetail.title}</label><br>
                        <label>장르 : ${movieDetail.genre}</label><br>
                        <label>러닝 타임 : ${movieDetail.runTime}</label><br>
                        <label>개봉일 : ${movieDetail.releaseDate}</label><br>
                   
                        
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
				
</body>
</html>