package com.penguin.movie.review.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.penguin.movie.review.domain.Movie;

@Repository
public interface MovieRepository {

	
	
	
	
	//영화 업데이트
	public int updateMovie(
			@Param("movieId") int movieId
			, @Param("title") String title
			, @Param("genre") String genre
			, @Param("runTime") String runTime
			, @Param("releaseDate") String releaseDate 
			, @Param("plot") String plot);
	
	
	
	//영화 삭제
	public int deleteMovie(@Param("movieId")int movieId);
	
	
	//영화 추가  
	public int insertMovie(
			 @Param("title")String title // 제목
			, @Param("genre")String genre // 장르
			, @Param("runTime")String runTime //런타임
			, @Param("releaseDate")String releaseDate //개봉일
			, @Param("plot")String plot // 줄거리
			, @Param("imagePath")String imagePath //이미지
			, @Param("screenBox")Boolean screenBox); //상영 박스
	
	
	//영화 정보 조회 
	public List<Movie> selectMovieList();
	
	
	//영화 세부 정보 조회
	public Movie selectMovie(@Param("id")int id);
	
	
	
}
