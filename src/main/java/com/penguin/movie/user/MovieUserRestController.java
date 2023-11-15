package com.penguin.movie.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
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
			, @RequestParam("email") String email
			, @RequestParam("managerCode") String managerCode) {
		
		
		User user = userService.addUser(loginId, password, name, email, managerCode);
		
		
		// 회원 가입 성공시 success, 실패시 fail
		Map<String, String> resultMap  = new HashMap<>();
		
		if(user != null) {
			resultMap.put("result", "success");
			
		} else {
			resultMap.put("result", "fail");
			
		}
		
		return resultMap;
		
	}
		
	//중복 기능
	@GetMapping("/duplicate-id")
	public Map<String, Boolean> duplicateId(@RequestParam("loginId") String loginId) {
			
		boolean isDuplicate = userService.isDuplicateId(loginId);
			
		Map<String, Boolean> resultMap = new HashMap<>();
			
		//"isDuplicate e 빼먹음
		if(isDuplicate) {
			resultMap.put("isDuplicate", true);
		} else {
			resultMap.put("isDuplicate", false);
		}
			
		return resultMap;
	}	
	
	
	//로그인 기능
	@PostMapping("/login")
	public Map<String, String> login(
			@RequestParam("loginId")String loginId
			, @RequestParam("password")String password
			, HttpServletRequest request) {
		
		User user = userService.getUser(loginId, password);
		
		Map<String, String> resultMap  = new HashMap<>();
		if(user != null) {
			// 로그인 성공 (하나)
			HttpSession session = request.getSession();
			// 세션에 로그인이 되었다 라는 정보를 저장
			// 세션에 사용자와 관련된 정보를 저장
			// 세션에 사용자 정보가 저장된 경우 로그인된 상태로 파악
			session.setAttribute("userId", user.getId());
			session.setAttribute("userName",user.getName());
			session.setAttribute("managerCode", user.getManagerCode());
			//session.setAttribute("userLogin",user.getLoginId());
			
			resultMap.put("result", "success");
			
		} else {
			
			resultMap.put("result", "fail");
			
		}
		return resultMap;
		
	}
	
	
	
	
	
	
}
