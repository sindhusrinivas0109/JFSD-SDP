package com.klu.controllers;

import com.klu.models.Admin;
import com.klu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/adminLogin")
    public ModelAndView showAdminLoginForm() {
        return new ModelAndView("AdminLogin");
    }

    @PostMapping("/adminLogin")
    public ModelAndView processAdminLogin(@RequestParam String identifier, @RequestParam String password, HttpSession session) {
        boolean isAuthenticated = adminService.authenticate(identifier, password);

        if (isAuthenticated) {
            Admin admin = adminService.findByIdentifier(identifier);
            session.setAttribute("adminRole", "admin");
            session.setAttribute("adminUsername", admin.getUsername());
            session.setAttribute("adminEmail", admin.getEmail());
            return new ModelAndView("redirect:/Home");
        } else {
            ModelAndView modelAndView = new ModelAndView("AdminLogin");
            modelAndView.addObject("error", "Invalid credentials. Please try again.");
            return modelAndView;
        }
    }

    @GetMapping("/Home")
    public ModelAndView showAdminHomePage(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("AdminHome");
        modelAndView.addObject("adminUsername", session.getAttribute("adminUsername"));
        modelAndView.addObject("adminEmail", session.getAttribute("adminEmail"));
        return modelAndView;
    }

    @GetMapping("/adminLogout")
    public ModelAndView adminLogout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/adminLogin");
    }
}