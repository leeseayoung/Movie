package com.penguin.movie.review.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.jni.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.common.FileManager;
import com.penguin.movie.like.service.LikeService;
import com.penguin.movie.oneLineReview.dto.OneReviewDetail;
import com.penguin.movie.oneLineReview.service.ReviewService;
import com.penguin.movie.review.domain.Movie;
import com.penguin.movie.review.dto.MovieDetail;
import com.penguin.movie.review.repository.MovieRepository;
import com.penguin.movie.user.service.UserService;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	@Autowired //한줄평
	private ReviewService reviewService;
	
	@Autowired //로그인정보
	private UserService userService;
	
	@Autowired // 좋아요정보
	private LikeService likeService;
	
	
	
	//영화 추가  //, MultipartFile file, Boolean checkBox
	public int addMovie(String title, String genre, String runTime, String releaseDate, String plot , MultipartFile file, Boolean screenBox) {
		
		//사진(파일) 저장
		String imagePath =  FileManager.saveFile(file);
		
		return movieRepository.insertMovie(title, genre, runTime, releaseDate, plot, imagePath, screenBox);
	}
	
	
	//업데이트
	public int updateMovie(int movieId, String title, String genre , String runTime ,  String releaseDate, String plot) {
		
		return movieRepository.updateMovie(movieId, title, genre, runTime, releaseDate, plot);
	}
	
	
	
	
	
	
	//영화 삭제
	 public int deleteMovie(int movieId) {
	        
		 int count = movieRepository.deleteMovie(movieId);
	        
	        
	        return count;
	    }
	

	 
	 //영화 삭제 
//	public int deleteMovie(int movieId, int id) {
//		
//		Movie movie = movieRepository.selectMovie(movieId);
//		
//		if(movie.getId() != id) {
//			return 0;
//			
//		}
//		
//		FileManager.removeFile(movie.getImagePath());
//		
//		return movieRepository.deleteMovie(movieId);
//	}

	
	
	
	
	
	
	
	
	
	//영화(장르,제목)가져오기 기능
	public List<MovieDetail> getMovieList() {
		
		List<Movie> movieList = movieRepository.selectMovieList();
		
		
		
		List<MovieDetail> movieDetailList = new ArrayList<>();
		for(Movie movie:movieList) {
				
			//리뷰의 아이디를 가지고와야됨	
//			User user = userService.getUserById(userId);
				
				
			//한줄평 가져오기	
			List<OneReviewDetail> oneReviewList = reviewService.getOneReviewList(movie.getId());
				

			
			
			//장르랑 제목만 일단	
			MovieDetail movieDetail = MovieDetail.builder()
									   .id(movie.getId())
									   .imagePath(movie.getImagePath())
									   .title(movie.getTitle())
									   .genre(movie.getGenre())
									   .runTime(movie.getRunTime())
									   .releaseDate(movie.getReleaseDate())
									   .screenBox(movie.isScreenBox())
									  
									   .build();
				
				
			movieDetailList.add(movieDetail);	
		}
		
		return movieDetailList;
	
	}
	
	

	
	//, int userId
	public MovieDetail getMovieDetail(int id) {
	    // 한줄평 가져오기
	    List<OneReviewDetail> oneReviewList = reviewService.getOneReviewList(id);

	    
		//리뷰의 아이디를 가지고와야됨(로그인 아이디)	
		
		
		//좋아요 색갈 오류?
//		boolean isLike = likeService.isLike(id, userId);
	    
	    
	    //좋아요 갯수 조회
		int likeCount = likeService.countLike(id);
		
	    
	    // id
	    Movie movie = movieRepository.selectMovie(id);

	    MovieDetail movieDetail = MovieDetail.builder()
					            .id(movie.getId())
					            .imagePath(movie.getImagePath())
					            .title(movie.getTitle())
					            .genre(movie.getGenre())
					            .runTime(movie.getRunTime())
					            .releaseDate(movie.getReleaseDate())
					            .plot(movie.getPlot())
					            .screenBox(movie.isScreenBox())
					            .oneReviewList(oneReviewList)
					            .likeCount(likeCount)
					          
					           
					            .build();

	    return movieDetail;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//영화 정보 가져오기(id)일치하는 영화 정보
	public Movie getMovie(int id) {
		
		return movieRepository.selectMovie(id) ;
	}



	
	
	
	
}
