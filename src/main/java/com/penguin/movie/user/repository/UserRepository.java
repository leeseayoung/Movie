package com.penguin.movie.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.penguin.movie.user.domain.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer>  {

}
