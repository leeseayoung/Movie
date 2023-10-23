package com.penguin.movie.user.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.penguin.movie.common.EncrypUtils;
import com.penguin.movie.user.domain.User;
import com.penguin.movie.user.repository.UserRepository;


@Service
public class UserService {
	@Autowired	
	private UserRepository userRepository;
	
	
	//로그인 기능
	public User getUser(String loginId, String password) {
		//암호화
		String encryptPassword = EncrypUtils.md5(password);
		
		//밑에 이렇게도 사용 가능!
		//User user = instagramRepository.findByLoginIdAndPassword(loginId, encryptPassword).orElse(null);
		
		Optional<User> optionalUser = userRepository.findByLoginIdAndPassword(loginId, encryptPassword);
		User user = optionalUser.orElse(null);
		
		return user;
		
	}
	
	
	
	

	//아이디 중복 기능
	public boolean isDuplicateId(String loginId) {
		
		int count = userRepository.countByLoginId(loginId);
		
		if(count ==1) {
			return false;
		} else {
			return true;
		}
		
	}
	

	
	
	
	//저장 기능
	public User addUser(
			String loginId
			, String password
			, String name
			, String email) {
		
		//비밀번호 암호화
	    String encryptPassword = EncrypUtils.md5(password);
	    		
		
		User user = User.builder()
					 //값
					.loginId(loginId)
					.password(encryptPassword)
					.name(name)
					.email(email)
					.build();



		return userRepository.save(user);
		
		
	}
	
	
}
