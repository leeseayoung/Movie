package com.penguin.movie.post;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.penguin.movie.post.domain.Post;
import com.penguin.movie.post.service.PostService;
@RequestMapping("/movie")
@Controller
public class MoviePostController {

	@Autowired
	private PostService postService;
	
	
	@GetMapping("/post/detail-view")
	public String moviePostDetail(@RequestParam("id") int id, Model model) {
		
		Post post = postService.getPost(id);
		
		model.addAttribute("post", post);
		
		return "post/postDetail";
		
	}
	
	
	
	//리스트 페이지
	@GetMapping("/post/list-view")
	public String moviePostList(Model model
			,HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		
		List<Post> postList = postService.getPostList(userId);
		//정의 해서 가져와서 쓰면됨
		model.addAttribute("postList", postList);
		
		
		return "post/moviePostList"; 
	}
	
	
	
	
	
	
	// 추가 페이지
	@GetMapping("/post/create-view")
	public String postInput() {
		
		return "post/moviePost";
	}
	
	
	
	
	
	
	
}
