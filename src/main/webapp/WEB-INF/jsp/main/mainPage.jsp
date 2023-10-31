<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 리뷰</title>
<style>*{margin:0; padding:0;}</style>
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
            <h1 class="text-center">현재 상영중</h1>
            <section class="contents d-flex">
                <nav class="main-menu col-2 p-0">
                    <ul class="nav flex-column">
                        <li class="nav-item menu-item"><a href="http://localhost:8080/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                        <li class="nav-item menu-item"><a href="https://www.naver.com/" class="nav-link text-dark font-weight-bold">영화 리스트 리뷰</a></li>
                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>

                    </ul>
                </nav>

                
                <article class="main-contents col-10 justify-content-around py-4">
                
                	
                	
                		
	               <div class="-flex justify-content-around">
					    <div class="row">
					        
					        <c:forEach var="movie" items="${movieList}">
					            <!-- 영화 칸 -->
					            <div class="col-12 col-sm-6 col-md-4 col-lg-3"> 
					                <section>
					                    <img alt="영화 이미지" class="h-5 w-25"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
					                    <div class="font-weight-bold">
					                        <a href="#">${movie.title}</a>
					                    </div>
					                    <div class="small text-secondary">
					                        ${movie.genre}
					                    </div>
					                    <div class="small text-secondary">
					                        관객수 : 755만명
					                    </div>
					                    <div class="small text-secondary">
					                        예매율 : 6.5%
					                    </div>
					                </section>
					            </div>
					    		<!-- 영화 칸 끝 -->
					        </c:forEach>
					    </div>
					</div>
	                   
	                        
	                    <div class="d-flex justify-content-around">
		                    	
		                    <c:forEach var="movie" items="${movieList}">
		                    	<section>
			                        <img alt="영화 이미지" class="h-5 w-25"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
			                        <div class="font-weight-bold">
			                            <a href="#">${movie.title}</a>
			                        </div>
			                        <div class="small text-secondary">
			                           ${movie.genre}
			                        </div>
			                        <div class="small text-secondary">
			                            관객수 : 755만명
			                        </div>
			                        <div class="small text-secondary">
			                            예매율 : 6.5%
			                        </div>
								</section>
		                    </c:forEach>
	                    </div>



                		
	                  
                </article>
           
            </section>
            <c:if test="${not empty managerCode}">
		    	<a href="http://localhost:8080/movie/create-view" class="btn btn-primary">영화 추가</a>
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