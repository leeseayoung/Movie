package com.penguin.movie.like.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeRepository {

	//좋아요 추가
	public int insertLike(
			@Param("userId")int userId
			, @Param("movieId")int movieId);
	
	//좋아요 유저아이디에 의한 갯수? mapper 아직안했음
	public int selectCountLikeByUserId(
			@Param("userId")int userId
			, @Param("movieId")int movieId);
	
	
}
