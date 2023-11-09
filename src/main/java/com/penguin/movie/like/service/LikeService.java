package com.penguin.movie.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.like.repository.LikeRepository;

@Service
public class LikeService {

	@Autowired
	private LikeRepository likeRepository;
	
	//좋아요 추가
	public int addlike(int userId, int movieId) {
		return likeRepository.insertLike(userId, movieId);
	}
	
	
	//좋아요가 있나 없나?
	public boolean isLike(int userId, int movieId) {
		int count = likeRepository.selectCountLikeByUserId(userId, movieId);
		 
		 if(count == 0) {
			 return false;
		 } else {
			 return true;
		 }
	}
	
	//좋아요 갯수
	public int countLike(int movieId) {
		return likeRepository.selectCountLike(movieId);
	}
	
	
	
	
}
