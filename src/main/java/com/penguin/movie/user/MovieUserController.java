package com.penguin.movie.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/user")
@Controller
public class MovieUserController {

	//로그인 페이지
	@GetMapping("/login-view")
	public String login() {
		
		return "login/login";
	}
	
	
	//회원가입 페이지
	@GetMapping("join-view")
	public String join() {
		
		return "login/join";
		}
	
	
}
