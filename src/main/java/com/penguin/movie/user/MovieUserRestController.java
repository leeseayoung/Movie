package com.penguin.movie.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.penguin.movie.user.domain.User;
import com.penguin.movie.user.service.UserService;

@RestController
@RequestMapping("/user")

public class MovieUserRestController {
	@Autowired
	private UserService userService;
	
	//회원가입 기능
	@PostMapping("/join")
	public Map<String, String> join(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("email") String email) {
		
		
		User user = userService.addUser(loginId, password, name, email);
		
		
		// 회원 가입 성공시 success, 실패시 fail
		Map<String, String> resultMap  = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
			
		} else {
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;
		
	}
		
		
	
	
}
