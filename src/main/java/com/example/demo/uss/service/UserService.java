package com.example.demo.uss.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.cmm.utl.DummyGenerator;

@Service
public class UserService {
	@Autowired UserMapper userMapper;
    @Autowired DummyGenerator dummy;

    public int register(User user) {
        return userMapper.insert(user);
    }

}
