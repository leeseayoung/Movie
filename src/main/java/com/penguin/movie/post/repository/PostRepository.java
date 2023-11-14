package com.penguin.movie.post.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.penguin.movie.post.domain.Post;

@Repository
public interface PostRepository {
	
	//업데이트
	public int updatePost(
			@Param("postId") int postId
			, @Param("title") String title
			, @Param("content") String content);
	
	
	//영화 감상평 추가
	public int insertPost(
			@Param("userId")int userId
			, @Param("title")String title
			, @Param("content") String content);
	
	
	//감상평 리스트
	public List<Post> selectPostList(@Param("userId")int userId);

	//감상평 한개 가져오기
	public Post selectPost(@Param("id")int id);
	
	//삭제
	public int deletePost(@Param("postId")int postId);

	
	
}
