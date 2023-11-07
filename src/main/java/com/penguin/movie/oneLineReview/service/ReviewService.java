package com.penguin.movie.oneLineReview.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.oneLineReview.domain.Review;
import com.penguin.movie.oneLineReview.dto.OneReviewDetail;
import com.penguin.movie.oneLineReview.repository.ReviewRepository;
import com.penguin.movie.user.domain.User;
import com.penguin.movie.user.service.UserService;

@Service
public class ReviewService {
	
	@Autowired
	private ReviewRepository reviewRepository;
	
	@Autowired
	private UserService userService;
	
	
	
	//한줄평 추가
	public int addReview(int userId, int movieId, String review) {
		
		return reviewRepository.insertReview(userId, movieId, review);
	}
	
	
	
	
	//한줄평 정보 가져오기
	public List<OneReviewDetail> getOneReviewList(int movieId) {
		
		List<Review> reviewList = reviewRepository.selectOneReviewList(movieId);
		
		List<OneReviewDetail> oneReviewDetailList = new ArrayList<>();
		 for(Review review:reviewList) {
			 
			 int userId = review.getUserId();
			 User user = userService.getUserById(userId);
			 
			 OneReviewDetail oneReviewDetail = OneReviewDetail.builder()
					 							.id(review.getId())
					 							.userId(review.getUserId())
					 							.movieId(review.getMovieId())
					 							.review(review.getReview())
					 							.loginId(user.getLoginId())
					 							.build();
			 
			 oneReviewDetailList.add(oneReviewDetail);
		 }
		
		return oneReviewDetailList;
		
	}
	
	
}
