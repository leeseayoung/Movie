package com.penguin.movie.user;

import javax.servlet.http.HttpSession;

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
	
	
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/user/login-view";
	}
	
	
}
