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
	private String loginId;
	
	//좋아요
	private boolean isLike;
	private int likeCount;
	
}
