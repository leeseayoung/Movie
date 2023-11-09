package com.penguin.movie.like;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.penguin.movie.like.service.LikeService;

@RestController
public class LikeRestController {

	@Autowired
	private LikeService likeService;
	
	//좋아요 추가
	@PostMapping("/movie/like")
	public Map<String, String> like(
			@RequestParam("movieId")int movieId
			, @RequestParam("reviewId")int reviewId
			, HttpSession session) {
		
		int userId = (Integer)session.getAttribute("userId");
		int count = likeService.addlike(userId, movieId, reviewId);
	
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	
	
	
	}
	
	
}
