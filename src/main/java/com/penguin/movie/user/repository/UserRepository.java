package com.penguin.movie.user.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.penguin.movie.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>  {
	
	
	// 중복 기능
	public int countByLoginId(String loginId);
	
	
	
	// WHERE `loginId` = ?? AND `password` == ?? 하나일때는 옵션녈 사용
	// 로그인 기능
	public Optional<User> findByLoginIdAndPassword(String loginId, String password);
	
}
