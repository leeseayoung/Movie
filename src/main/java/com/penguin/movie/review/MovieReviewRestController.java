package com.penguin.movie.review;

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
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.review.service.MovieService;

@RequestMapping("/movie")
@RestController
public class MovieReviewRestController {

	@Autowired
	private MovieService movieService;
	
	//영화 추가 기능 
	@PostMapping("/create")
	public Map<String, String> createPost(
			  @RequestParam("title") String title
			 , @RequestParam("genre") String genre
			 , @RequestParam("runTime") String runTime
			 , @RequestParam("releaseDate") String releaseDate
			 , @RequestParam("plot") String plot
			 , @RequestParam("imageFile") MultipartFile file
			 , @RequestParam("screenBox") Boolean screenBox) {
		
		
		
		int count = movieService.addMovie(title, genre, runTime, releaseDate, plot, file, screenBox);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	

	
	//업데이트
	@PutMapping("/update")
	public Map<String, String> updateMovie(
			@RequestParam("title")String title
			, @RequestParam("genre")String genre
			, @RequestParam("releaseDate")String releaseDate
			, @RequestParam("runTime")String runTime
			, @RequestParam("plot")String plot
			, @RequestParam("movieId")int movieId) {
		
		
		int count = movieService.updateMovie(movieId, title, genre, releaseDate, runTime, plot);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success"); 
		} else {
			resultMap.put("result", "fail"); 
		}
		return resultMap;
		
		
		
	}
	
	
	
	//삭제
	@DeleteMapping("/delete")
	public Map<String, String> deleteMovie(
			@RequestParam("movieId")int movieId
			, HttpSession session) {
		
//		int id = (Integer)session.getAttribute("id");
		int count = movieService.deleteMovie(movieId);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(count == 1) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	

//	@DeleteMapping("/delete")
//	public Map<String, String> deleteMovie(
//	        @RequestParam("movieId") int movieId,
//	        HttpSession session) {
//
//	    // 세션에서 "id" 속성 가져오기
//	    Integer id = (Integer) session.getAttribute("id");
//
//	    // id가 null인 경우를 확인하여 처리
//	    if (id == null) {
//	       
//	        Map<String, String> resultMap = new HashMap<>();
//	        resultMap.put("result", "fail");
//	        return resultMap;
//	    }
//
//	    // 여기에 이어서 영화 삭제 로직을 실행
//	    int count = movieService.deleteMovie(movieId, id);
//
//	    Map<String, String> resultMap = new HashMap<>();
//	    if (count == 1) {
//	        resultMap.put("result", "success");
//	    } else {
//	        resultMap.put("result", "fail");
//	    }
//	    return resultMap;
//	}
 
	
	
	
}
