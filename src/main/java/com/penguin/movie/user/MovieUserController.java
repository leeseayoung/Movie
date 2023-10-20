package com.penguin.movie.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class MovieUserController {

	//테스트
	@GetMapping("/login-view")
	public String login() {
		
		return "login/login";
	}
	
	
	
}
