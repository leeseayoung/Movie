package com.penguin.movie.oneLineReview.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.penguin.movie.oneLineReview.domain.Review;

@Repository
public interface ReviewRepository {

	//한줄평 리뷰 저장
	public int insertReview(
			@Param("userId")int userId 
			, @Param("movieId")int movieId 
			, @Param("review")String review);
	
	
	//한줄평 조회 해오기
	public List<Review> selectOneReviewList(
			@Param("movieId")int movieId);
	
	
}
