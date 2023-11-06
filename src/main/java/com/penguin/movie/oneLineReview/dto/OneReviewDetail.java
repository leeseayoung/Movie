package com.penguin.movie.oneLineReview.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class OneReviewDetail {

	private int id;
	private int userId;
	private int movieId;
	private String review;
	
}
