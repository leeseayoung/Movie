<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                    <h1 class="text-danger">펭귄 리뷰</h1>
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
                    <div>이세영 님</b><u>로그아웃</u></div>
                </div>
            </header>
            <section class="contents d-flex">
                <nav class="main-menu col-2 p-0">
                    <ul class="nav flex-column">
                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">별점 높은 영화</a></li>
                        <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가쓴 감상평</a></li>

                    </ul>
                </nav>

                
                
                <article class="main-contents col-10 d-flex flex-wrap justify-content-between py-4">
                	
                	
                		
	                    <div class="video">
	                    	
	                        <img alt="상영중" class="h-50 w-100"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] 잇츠원 유태양 - ♬왕과비
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>
	                   
	                    <div class="video">
	                        <img alt="상영중" class="h-50 w-100"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] 아이즈원 권은비 - ♬Panorama
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>
	                    <div class="video">
	                        <img alt="상영중" class="h-50 w-100" src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] 스트레이 키즈 리노 - ♬미친놈
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>
	                    <div class="video">
	                        <img alt="썸네일" class="h-50 w-100"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] 아이즈원 장원영 - ♬Panorama
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>
	                    <div class="video">
	                        <img alt="썸네일" class="h-50 w-100"  src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] NCT DREAM 제노 - ♬ 맛 (Hot Sauce)
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>
	                    <div class="video">
	                        <img alt="썸네일" class="h-50 w-100" src="https://cdn.pixabay.com/photo/2017/12/15/13/51/polynesia-3021072_1280.jpg">
	                        <div class="font-weight-bold">
	                            [상영중] 아이즈원 미야와키 사쿠라 - ♬Panorama
	                        </div>
	                        <div class="small text-secondary">
	                            N-net Ent
	                        </div>
	                        <div class="small text-secondary">
	                            조회수 : 80만회 1개월전
	                        </div>
	
	                    </div>

                </article>
           
            </section>
            
            
            
            <footer>
                <div class="text-center text-secondary mt-3">
                    Copyright (C) 2023 ITube all rights reserved.
                </div>
            </footer>
        </div>
       
       
       <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    


</body>
</html>