package com.penguin.movie.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.user.domain.User;
import com.penguin.movie.user.repository.UserRepository;


@Service
public class UserService {
	@Autowired	
	private UserRepository userRepository;
	
	
	
	//저장 기능
	public User addUser(
			String loginId
			, String password
			, String name
			, String email) {
		

		
		User user = User.builder()
					 //값
					.loginId(loginId)
					.password(password)
					.name(name)
					.email(email)
					.build();



		return userRepository.save(user);
		
		
	}
	
	
}
