package com.penguin.movie.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.penguin.movie.post.service.PostService;
@RequestMapping("/movie")
@RestController
public class MoviePostRestController {

	@Autowired
	private PostService postService;
	
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
