package com.penguin.movie.review;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/movie")
@Controller
public class MovieReviewController {

	//세팅 model , session 
   
	@GetMapping("/main-view")
	public String movieReview() {
		
		
		return "main/mainPage";
	}
	
	
	@GetMapping("/create-view")
	public String addMovie() {
		
		//"manager/addMovie";
		return "manager/addMovie";
	}
	
	
}
