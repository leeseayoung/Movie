package com.penguin.movie.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.penguin.movie.post.domain.Post;

@Repository
public interface PostRepository {
	
	//영화 감상평 추가
	public int insertPost(
			@Param("userId")int userId
			, @Param("title")String title
			, @Param("content") String content);
	
	//감상평 리스트
	public List<Post> selectPostList(@Param("userId")int userId);

	
	
	
}
