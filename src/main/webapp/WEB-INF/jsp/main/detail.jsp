<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>영화 상세 정보</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="/static/css/detailPage.css" type="text/css">
</head>
<body>
    <div class="container">
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
        <h1 class="text-center pt-2"><a class="text-warning">영화 정보</a></h1>
        <section class="contents d-flex">
            <nav class="main-menu col-2 p-0">
                <ul class="nav flex-column">
                    <li class="nav-item menu-item"><a href="http://localhost:8080/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                    <li class="nav-item menu-item"><a href="http://localhost:8080/movie/favorite-view" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 찜한 영화</a></li>
                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>
                </ul>
            </nav>
            <article class="main-contents col-10 justify-content-around py-4">
                <div class="d-flex">
                
                    <div class="mr-3">
                        <img alt="영화 이미지" class="movie-image" src="${movieDetail.imagePath}">
                    </div>
                    <div>
                     
                        <label><b>제목 : </b></label><input type="text" class="form-control col-5" id="titleInput" value="${movieDetail.title}">
                    
                        <label><b>장르 : </b></label><input type="text" class="form-control col-7" id="genreInput" value="${movieDetail.genre}">
                      
                        <label><b>러닝 타임 : </b></label><input type="text" class="form-control col-4" id="runTimeInput" value="${movieDetail.runTime}">
                       
                        <label><b>개봉일 : </b></label><input type="text" class="form-control col-6" id="releaseDateInput" value="${movieDetail.releaseDate}">
                       
                    </div>
                </div>
                
                <div>                   
                    <label><b>줄거리 : </b></label><br>
                    <textarea class="movie-info" rows="10" cols="100" id="plotInput" cols="200" rows="5" >${movieDetail.plot}</textarea>
                </div>
              
                <!-- 영화 감상평, 한줄평, 찜 -->
                <div class="d-flex justify-content-end">
                    
                    
                    
                    <div class="action-item pr-3 pt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-bookmark" viewBox="0 0 16 16">
                            <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5V2zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1H4z"/>
                        </svg>
                        <label>찜 하기!</label>
                    </div>
                    
                    
                    
                    <div class="action-item pr-2 pt-2">
                        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                            <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                            <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                        </svg>
                        <label>감상평!</label>
                    </div>
                    
                    
                    
                    <!-- 한줄평 -->
                    <div class="action-item">
					    <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#reviewModal" id="oneLineModal">
					        <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-pen-fill" viewBox="0 0 16 16">
					            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001z"/>
					        </svg>
					        <label>한줄평!</label>
					    </button>
					
					    <div class="modal fade" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel" aria-hidden="true">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <h5 class="modal-title" id="reviewModalLabel">한줄평 남기기</h5>
					                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					                </div>
					                <div class="modal-body">
					                    <form>
					                        <div class="mb-3">
					                            <label for="review-text" class="col-form-label">한줄평: ${movieDetai.oneReviewList}</label>
					                            <textarea class="form-control" id="review-text" placeholder="15자 이내" rows="4"></textarea>
					                        </div>
					                    </form>
					                </div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="model-close">닫기</button>
					                    <button type="button" class="btn btn-primary" id="model-save">저장</button>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
                	<!-- 한줄평 끝-->
                
                </div>
                 <!-- 영화 감상평, 한줄평, 찜  끝-->

                <div>
                    <h1 class="pt-3">한줄평</h1>

                    <!-- 한줄평 시작!-->
                   <div class="row">
                        <div class="commentp pl-2">
                            <div class="user-nickname">유저 닉네임 : ${movieDetail.id}</div>
                            <div class="comment-text">한줄평 : </div>  
                            
                            <svg xmlns="http://www.w3.org/2000/svg" class="heart pt-2" width="35" height="35" fill="currentColor" class="bi bi-heart" viewBox="0 0 16 16">
                                <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.920 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.060.055.119.112.176.171a3.12 3.12 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15z"/>
                            </svg>
                        </div>

                     
                    </div>
                    <!-- 한줄평 시작 끝!-->
                </div>
            
            	<div class="d-flex justify-content-end">
	            	<c:if test="${not empty managerCode}">
	            		<div class="pr-3">
				    		<button type="button" class="btn btn-danger" id="deleteBtn" data-movie-id="${movieDetail.id}">영화 삭제</button>
	            		</div>
	            		<div>
				    		<button type="button" class="btn btn-primary" id="modifyBtn" data-movie-id="${movieDetail.id}">영화 수정</button>
				    		
				    		
	            		</div>
					</c:if>
            	</div>
            
            </article>
        </section>
    </div>

    <footer class="bg-secondary d-flex justify-content-center align-items-center text-white">
        <h5>2023 펭귄 리뷰</h5>
    </footer>
    
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
	
	<script>
	$(document).ready(function() {
		
		
		
			
			//모달
			//모달 열기
			$("#oneLineModal").on("click", function() {
	            $("#reviewModal").modal("show"); 
	        });
			
			//모달 저장
			$("#model-save").on("click", function() {
			   
				let userId = ${userId}; 
				let movieId = ${movieDetail.id};
			    let review = $("#review-text").val();
			   
			 
			    
			    $.ajax({
			        type: "post",
			        url: "/movie/oneLineReview",
			        data: {"userId":userId, "movieId": movieId, "review": review},
			        success: function(data) {
			            if (data.result == "success") {
			                location.reload();
			            } else {
			                alert("한줄평 실패!");
			            }
			        },
			        error: function() {
			            alert("한줄평 에러!");
			        }
			    });
			});

			
	        //모달 닫기	
	        $("#model-close").on("click", function() {
	            $("#reviewModal").modal("hide"); 
	        });
		
	        
	        
			//업데이트
			$("#modifyBtn").on("click", function() {
		    let title = $("#titleInput").val();
		    let genre = $("#genreInput").val();
		    let releaseDate = $("#releaseDateInput").val();
		    let runTime = $("#runTimeInput").val();
		    let plot = $("#plotInput").val(); 
		    let movieId = $(this).data("movie-id");
		
		    
		    
			    $.ajax({
			        type: "put",
			        url: "/movie/update",
			        data: {"title": title, "genre": genre, "releaseDate": releaseDate, "runTime": runTime, "plot": plot, "movieId": movieId},
			        success: function(data) {				
			            if (data.result == "success") {
			                location.href = "/movie/main-view";
			            } else {
			                alert("영화 수정 실패");
			            }
			        },
			        error: function() {
			            alert("영화 수정 에러");
			        }
			    });
			});
		
		
		
		
		
		
		
		
		
		
		
		
		//삭제 기능
		$("#deleteBtn").on("click", function() {
			
			let movieId = $(this).data("movie-id");
			
			
		
			$.ajax({
				type:"delete"
				, url:"/movie/delete"
				, data:{"movieId":movieId}
				, success:function(data) {
					if(data.result == "success") {
						location.href = "/movie/main-view"
					} else {
						alert("영화 삭제 실패!");
					}
				}
				, error:function() {
					alert("영화 삭제 에러!");
				}
			
		
			});
			
			
			
		});		
		
		
		
	});
	
	
	
	</script>
	
    
</body>
</html>
