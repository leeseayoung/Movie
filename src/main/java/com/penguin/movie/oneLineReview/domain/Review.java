package com.penguin.movie.oneLineReview.domain;

import java.util.Date;

public class Review {

	
	private int id;
	private int userId;
	private int movieId;
	private String review;


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getMovieId() {
		return movieId;
	}
	public void setMovieId(int movieId) {
		this.movieId = movieId;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	
	

}
