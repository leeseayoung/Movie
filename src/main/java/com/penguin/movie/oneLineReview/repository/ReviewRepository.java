package com.penguin.movie.oneLineReview.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ReviewRepository {

	//한줄평 리뷰
	public int insertReview(
			@Param("movieId")int movieId 
			, @Param("review")String review);
	
}
