package com.penguin.movie.review.dto;

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
	
}
