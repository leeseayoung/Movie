package com.penguin.movie.review;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.penguin.movie.review.domain.Movie;
import com.penguin.movie.review.dto.MovieDetail;
import com.penguin.movie.review.service.MovieService;

@RequestMapping("/movie")
@Controller
public class MovieReviewController {

	@Autowired
	private MovieService movieService;
	
	
	
	
	
	//세팅 model , session  영화 저장 기능 불러오기
	@GetMapping("/main-view")
	public String movieReview(Model model
			, HttpSession session) {
		
		
		//영화 정보 불러오기
		List<MovieDetail> movieList = movieService.getMovieList();
		
		model.addAttribute("movieList", movieList);

		
		
		return "main/mainPage";
	}
	
	
	
	
	
	
	//영화 추가
	@GetMapping("/create-view")
	public String addMovie() {
		
		//"manager/addMovie";
		return "manager/addMovie";
	}
	
	
	//영화 상세페이지
	@GetMapping("/detail-view")
	public String movieDetail(@RequestParam("id")int id, Model model) {
				//영화 정보 이름
		Movie movieDetail = movieService.getMovie(id);
		
		model.addAttribute("movieDetail", movieDetail);
		
		return "main/detail";
	}
	
	

	
}
