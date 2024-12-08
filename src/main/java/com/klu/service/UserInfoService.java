package com.klu.service;

import com.klu.models.User;
import com.klu.repository.UserInfoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserInfoService {

    @Autowired
    private UserInfoRepository userRepository;

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }
}