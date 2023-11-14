package com.penguin.movie.post.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.post.domain.Post;
import com.penguin.movie.post.repository.PostRepository;
@Service
public class PostService {

	
	@Autowired
	private PostRepository postRepository;
	
	//업데이트
	public int updatePost(int postId, String title, String content) {
		return postRepository.updatePost(postId, title, content);
	}
	
	
	//삭제
	public int deletePost(int postId, int userId) {
		Post post = postRepository.selectPost(postId);
		
		if(post.getUserId() != userId) {
			
			return 0;
		}	
		
		return postRepository.deletePost(postId);
	}
	
	
	
	//영화 감상평 추가
	public int addPost(int userId, String title, String content) {
		return postRepository.insertPost(userId, title, content);
		
	}
	
	
	
	//감상평 리스트
	public List<Post> getPostList(int userId) {
		
		return postRepository.selectPostList(userId);
		
	}
	
	
	//감상평 한개 가져오기
	public Post getPost(int id) {
		
		return postRepository.selectPost(id);
		
	}
	
}
