package com.penguin.movie.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.common.FileManager;
import com.penguin.movie.review.repository.MovieRepository;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	
	//영화 추가  //, MultipartFile file, Boolean checkBox
	public int addMovie(String title, String genre, String runTime, String releaseDate, String plot , MultipartFile file, Boolean checkBox) {
		
		//사진(파일) 저장
		String imagePath =  FileManager.saveFile(file);
		
		return movieRepository.insertMovie(title, genre, runTime, releaseDate, plot, imagePath, checkBox);
	}
	
	
	
	
	
	
	
	
}
