package com.klu.controllers;

import com.klu.models.User;
import com.klu.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class UserInfoController {

    @Autowired
    private UserInfoService userInfoService;

    @GetMapping("/users")
    public ModelAndView getUsers() {
        List<User> users = userInfoService.getAllUsers();
        ModelAndView modelAndView = new ModelAndView("Users");
        modelAndView.addObject("users", users);
        return modelAndView;
    }
}