package com.example.demo.uss.web;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.bkg.service.Booking;
import com.example.demo.cmm.enm.Messenger;
import com.example.demo.uss.service.User;
import com.example.demo.uss.service.UserMapper;
import com.example.demo.uss.service.UserService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RestController
@RequestMapping("/users")
public class UserController {
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired UserService userService;
    @Autowired UserMapper userMapper;
    

    @PostMapping("")
    public Messenger register(@RequestBody User user) {
    	logger.info("==============회원가입 정보: "+user.toString());
        return (userService.register(user) == 1) 
        		? Messenger.SUCCESS 
        		: Messenger.FAILURE;
    }
    
    @PostMapping("/login")
    public User login(@RequestBody User user) {
    	return userMapper.login(user);
    }
    @GetMapping("/{userNum}")
    public User detail(@PathVariable int userNum){
        return userMapper.selectById(userNum);
    }
    @PutMapping("")
    public Messenger update(@RequestBody User user){
    	logger.info("==============수정할 유저번호: "+user.getUserNum());
        return userMapper.update(user) == 1 ? Messenger.SUCCESS : Messenger.FAILURE;
    }
    @DeleteMapping("")
    public Messenger delete(@RequestBody User user){
    	logger.info("==============삭제할 유저번호: "+user.getUserNum());
        return userMapper.delete(user) == 1 ? Messenger.SUCCESS : Messenger.FAILURE;
    }
}
