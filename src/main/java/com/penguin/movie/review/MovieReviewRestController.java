package com.penguin.movie.review;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.review.service.MovieService;

@RequestMapping("/movie")
@RestController
public class MovieReviewRestController {

	@Autowired
	private MovieService movieService;
	
	
	@PostMapping("/create")
	public Map<String, String> createPost(
			 @RequestParam("title") String title
			 , @RequestParam("genre") String genre
			 , @RequestParam("runTime") String runTime
			 , @RequestParam("releaseDate") String releaseDate
			 , @RequestParam("polt") String polt
			 , @RequestParam("imageFile") MultipartFile file
			 , @RequestParam("checkBox") Boolean checkBox		 
			, HttpSession session) {
		
		
		
		int count = movieService.addMovie(title, genre, runTime, releaseDate, polt, file, checkBox);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	
	
}
