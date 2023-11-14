package com.penguin.movie.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.penguin.movie.post.service.PostService;
@RequestMapping("/movie")
@RestController
public class MoviePostRestController {

	@Autowired
	private PostService postService;
	
	
	//수정
	@PutMapping("/post/update")
	public Map<String, String> updatePost(
			@RequestParam("postId")int postId
			, @RequestParam("title")String title
			, @RequestParam("content")String content) {
		
		int count = postService.updatePost(postId, title, content);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success"); 
		} else {
			resultMap.put("result", "fail"); 
		}
		return resultMap;
	
	}
	
	
	
	
	
	//삭제
	@DeleteMapping("/post/delete")
	public Map<String, String> deletePost(
			@RequestParam("postId")int postId
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		int count = postService.deletePost(postId, userId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
		
	}
	
	
	
	
	//추가
	@PostMapping("/post/create")
	public Map<String, String> createPostMovie(
			@RequestParam("title") String title
			, @RequestParam("content") String content
			, HttpSession session){
		
		int userId = (Integer)session.getAttribute("userId");
		int count = postService.addPost(userId, title, content);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
		
		
	}
	
	
	
	
	
}
