package com.penguin.movie.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.review.repository.MovieRepository;

@Service
public class MovieService {
	//임시
	private static final String imagePath = null;
	@Autowired
	private MovieRepository movieRepository;
	
	//영화 추가
	public int addMovie(String title, String genre, String runTime, String releaseDate, String plot, MultipartFile file, Boolean checkBox) {
		
		
		
		return movieRepository.insertMovie(title, genre, runTime, releaseDate, plot, imagePath, checkBox);
	}
	
	
}
