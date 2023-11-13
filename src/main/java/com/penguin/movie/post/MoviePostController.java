package com.penguin.movie.post;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/movie")
@Controller
public class MoviePostController {

	
	
	@GetMapping("/post/create-view")
	public String postInput() {
		
		return "post/moviePost";
	}
	
}
