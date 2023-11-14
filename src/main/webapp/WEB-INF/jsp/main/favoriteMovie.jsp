<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰</title>
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
            <h1 class="text-center">미상영 영화</h1>
            <section class="contents d-flex">
                <nav class="main-menu col-2 p-0">
                    <ul class="nav flex-column">
                        <li class="nav-item menu-item"><a href="/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                        <li class="nav-item menu-item"><a href="/movie/favorite-view" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 찜한 영화</a></li>
                        <li class="nav-item menu-item"><a href="/movie/post/list-view" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>

                    </ul>
                </nav>

                
                <article class="main-contents col-10 justify-content-around py-4">
                
                	
                	
                		
					            <!-- 영화 칸 -->
				               
	               <div class="-flex justify-content-around">
					    <div class="row">
					        
					        <c:forEach var="movie" items="${movieList}">
					       	 <c:if test="${movie.screenBox == false}">
					       
					            <div class="col-12 col-sm-6 col-md-4 col-lg-3"> 
					                <section>
					                    <img alt="영화 이미지" class="h-50 w-75 pt-3"  src="${movie.imagePath}">
					                    <div class="font-weight-bold pt-2">
					                        제목 : <a href="/movie/detail-view?id=${movie.id}">${movie.title}</a>
					                    </div>
					                    <div class="small text-secondary">
					                        장르 : ${movie.genre}
					                    </div>
					                    <div class="small text-secondary">
					                        러닝 타임 : ${movie.runTime}
					                    </div>
					                    <div class="small text-secondary">
					                      	개봉일 : ${movie.releaseDate}
					                    </div>
					                </section>
					            </div>
					            </c:if>
					        </c:forEach>
					    </div>
					</div>
					    		<!-- 영화 칸 끝 -->
	                   
	                        
	                
				<c:set var="movie" value="${movie.checkBox}" />
				
				<c:if test="${movie == true}" >
					<h1>${movie}</h1>
				</c:if>


                		
	                  
                </article>
           
            </section>
            <c:if test="${not empty managerCode}">
		    	<a href="/movie/create-view" class="btn btn-primary">영화 추가</a>
			</c:if>
			
	        

	 
            
            <footer>
                <div class="text-center text-secondary mt-3">
                   2023 펭귄 리뷰 
                </div>
            </footer>
        </div>
       
       
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
	

</body>
</html>