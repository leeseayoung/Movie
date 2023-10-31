package com.penguin.movie.review.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.penguin.movie.common.FileManager;
import com.penguin.movie.review.domain.Movie;
import com.penguin.movie.review.dto.MovieDetail;
import com.penguin.movie.review.repository.MovieRepository;

@Service
public class MovieService {

	@Autowired
	private MovieRepository movieRepository;
	
	
	//영화 추가  //, MultipartFile file, Boolean checkBox
	public int addMovie(String title, String genre, String runTime, String releaseDate, String plot , MultipartFile file, Boolean screenBox) {
		
		//사진(파일) 저장
		String imagePath =  FileManager.saveFile(file);
		
		return movieRepository.insertMovie(title, genre, runTime, releaseDate, plot, imagePath, screenBox);
	}
	
	
	
	//영화(장르,제목)가져오기 기능
	public List<MovieDetail> getMovieList() {
		
		List<Movie> movieList = movieRepository.selectMovieList();
		
		List<MovieDetail> movieDetailList = new ArrayList<>();
		for(Movie movie:movieList) {
			
		//장르랑 제목만 일단	
		MovieDetail movieDetail = MovieDetail.builder()
								   .id(movie.getId())
								   .imagePath(movie.getImagePath())
								   .title(movie.getTitle())
								   .genre(movie.getGenre())
								   .runTime(movie.getRunTime())
								   .releaseDate(movie.getReleaseDate())
								   .screenBox(movie.isScreenBox())
								   .build();
			
			
		movieDetailList.add(movieDetail);	
		}
		
		return movieDetailList;
	}
	
	//영화 정보 가져오기
	public Movie getMovie(int id) {
		
		return movieRepository.selectMovie(id) ;
	}
	
	
	
	
}
