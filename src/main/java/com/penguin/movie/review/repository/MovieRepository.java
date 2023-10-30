package com.penguin.movie.review.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.penguin.movie.review.domain.Movie;

@Repository
public interface MovieRepository {

	//영화 추가  
	public int insertMovie(
			@Param("title")String title // 제목
			, @Param("genre")String genre // 장르
			, @Param("runTime")String runTime //런타임
			, @Param("releaseDate")String releaseDate //개봉일
			, @Param("plot")String plot // 줄거리
			, @Param("imagePath")String imagePath //이미지
			, @Param("checkBox")Boolean checkBox); //체크 박스
	
	
	//영화 정보 조회 
	public List<Movie> selectMovieList();
	
	
}
