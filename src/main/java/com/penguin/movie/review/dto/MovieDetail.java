package com.penguin.movie.review.dto;

import java.util.List;

import com.penguin.movie.oneLineReview.dto.OneReviewDetail;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class MovieDetail {

	private int id;
	private String title;
	private String runTime;
	private String genre;
	private String releaseDate;
	private String plot;
	private String imagePath;
	private boolean screenBox;
	

  

	private List<OneReviewDetail> oneReviewList;
	private String loginId;
	
	
}
