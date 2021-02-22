package com.example.demo.uss.service;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.bkg.service.Booking;

@Repository
public interface UserMapper {
    public int insert(User user);
	public User login(User user);
	public User selectById(int userNum);
    public int update(User user);
    public int delete(User user);
}
