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
	
	
	
	//영화 감상평 추가
	public int addPost(int userId, String title, String content) {
		return postRepository.insertPost(userId, title, content);
		
	}
	
	
	//감상평 리스트
	public List<Post> getPostList(int userId) {
		
		return postRepository.selectPostList(userId);
		
	}
	
	
	
	
}
