package com.penguin.movie.oneLineReview;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.penguin.movie.oneLineReview.service.ReviewService;
@RequestMapping("/movie")
@RestController
public class OneLineReviewRestController {

	@Autowired
	private ReviewService reviewService;
	
	
	
	
	//한줄평 저장 기능
	@PostMapping("/oneLineReview")
	public Map<String, String> createReview( 
			@RequestParam("userId")int userId
			, @RequestParam("movieId")int movieId
			, @RequestParam("review")String review
			, HttpSession session) {
			 
//		int loginId = (Integer)session.getAttribute("userId");
		int count =	 reviewService.addReview(userId, movieId, review);
				
		Map<String, String> resultMap = new HashMap<>();
				
				if(count == 1) {
					resultMap.put("result", "success");
				} else {
					resultMap.put("result", "fail");
				}
				
				return resultMap;
			 
		}
	

	

	
}
