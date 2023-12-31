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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
                    <li class="nav-item menu-item"><a href="/movie/main-view" class="nav-link text-dark font-weight-bold">현재 상영중</a></li>
                    <li class="nav-item menu-item"><a href="/movie/favorite-view" class="nav-link text-dark font-weight-bold">미상영 영화</a></li>
                    <li class="nav-item menu-item"><a href="#" class="nav-link text-dark font-weight-bold">내가 찜한 영화</a></li>
                    <li class="nav-item menu-item"><a href="/movie/post/list-view" class="nav-link text-dark font-weight-bold">내가 쓴 감상평</a></li>
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
                    
                    
                    
                    <div class="action-item pr-3">
                        <i class="bi bi-folder-plus" style="font-size: 40px;"></i>
                        <label>찜 하기!</label>
                    </div>
                    
                    
                    
                    <div class="action-item pr-2 "> 
                       <a href="/movie/post/create-view"> <i class="bi bi-pencil-square" style="font-size: 40px; color: black;"></i></a>
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
					                            <label for="review-text" class="col-form-label">한줄평: ${reviewDetail.id}</label>
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
				        <!-- 반복문 한줄평 시작 -->
				        <c:forEach items="${movieDetail.oneReviewList}" var="oneReview">
				            <c:if test="${oneReview.movieId == movieDetail.id}">
				                <div class="commentp pl-2">
				                    <div class="user-nickname">유저 닉네임 : ${oneReview.loginId}</div>
				                    <div class="comment-text">한줄평 : ${oneReview.review}</div>  
				                   
									<!-- 좋아요 시작 -->
									<c:choose>
								 		<c:when test="${movieDetail.like}">
								 			<i class="bi bi-heart-fill text-danger unlike-icon" style="font-size: 30px; data-post-id="${movieDetail.id}"></i>
								 		</c:when>
								 		<c:otherwise>
						                    <i class="bi bi-heart like-Icon" style="font-size: 30px;" data-movie-id="${movieDetail.id}"></i>
								 		</c:otherwise>
								 	</c:choose> 
				                    <!-- 좋아요 끝 -->
				                    좋아요 ${oneReview.likeCount}개
				                </div>
				            </c:if>
				        </c:forEach>
				        <!-- 한줄평 시작 끝!-->
				    </div>
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
		
		//좋아요 기능
		$(".like-Icon").on("click", function() {
			
			let movieId= $(this).data("movie-id");
			
			$.ajax({
				type:"post"
				, url: "/movie/like"
				, data:{"movieId":movieId}
				, success:function(data) {
					
					if(data.result == "success"){
						location.reload();
					} else {
						alert("좋아요 실패");
					}
					
				}
				, erroe:function() {
					alert("좋아요 에러!");
				}
			});
		});	
		
			
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
