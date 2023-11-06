package com.penguin.movie.oneLineReview.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.oneLineReview.repository.ReviewRepository;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	//한줄평
	public int addReview(int movieId, String review) {
		
		return reviewRepository.insertReview(movieId, review);
	}
	
	
	
	
}
