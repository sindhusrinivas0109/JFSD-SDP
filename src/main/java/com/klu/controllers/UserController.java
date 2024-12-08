package com.klu.controllers;

import com.klu.models.User;
import com.klu.models.Admin;
import com.klu.service.UserService;
import com.klu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @GetMapping("/Login")
    public ModelAndView showLoginForm() {
        return new ModelAndView("Login");
    }

    @PostMapping("/login")
    public ModelAndView processLogin(@RequestParam String loginType, @RequestParam String identifier, @RequestParam String password, HttpSession session) {
        if ("user".equals(loginType)) {
            User user = userService.authenticateUser(identifier, password);

            if (user != null) {
                session.setAttribute("userRole", "user");
                session.setAttribute("userEmail", user.getEmail());
                session.setAttribute("username", user.getName());
                session.setAttribute("profilePhotoPath", user.getProfilePhotoPath());
                session.setAttribute("bio", user.getBio());
                session.setAttribute("location", user.getLocation());
                session.setAttribute("phoneNumber", user.getPhoneNumber());
                session.setAttribute("occupation", user.getOccupation());
                session.setAttribute("articlesRead", user.getArticlesRead());
                session.setAttribute("discussions", user.getDiscussions());
                session.setAttribute("achievements", user.getAchievements());
                session.setAttribute("registeredEvents", user.getRegisteredEvents());
                session.setAttribute("totalEvents", user.getTotalEvents());
                session.setAttribute("registeredEventsProgress", user.getRegisteredEventsProgress());
                session.setAttribute("attendedEvents", user.getAttendedEvents());
                session.setAttribute("attendedEventsProgress", user.getAttendedEventsProgress());
                return new ModelAndView("redirect:/home");
            } else {
                ModelAndView modelAndView = new ModelAndView("Login");
                modelAndView.addObject("error", "Invalid credentials. Please try again.");
                return modelAndView;
            }
        } else if ("admin".equals(loginType)) {
            boolean isAuthenticated = adminService.authenticate(identifier, password);

            if (isAuthenticated) {
                Admin admin = adminService.findByIdentifier(identifier);
                session.setAttribute("userRole", "admin");
                session.setAttribute("userEmail", admin.getEmail());
                session.setAttribute("username", admin.getUsername());
                return new ModelAndView("redirect:/home");
            } else {
                ModelAndView modelAndView = new ModelAndView("Login");
                modelAndView.addObject("error", "Invalid credentials. Please try again.");
                return modelAndView;
            }
        } else {
            ModelAndView modelAndView = new ModelAndView("Login");
            modelAndView.addObject("error", "Invalid login type. Please try again.");
            return modelAndView;
        }
    }

    @GetMapping("/Signup")
    public ModelAndView showSignupForm() {
        return new ModelAndView("Signup");
    }

    @PostMapping("/signup")
    public ModelAndView processSignup(@RequestParam String name, @RequestParam String email, @RequestParam String password) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);

        userService.registerUser(user, null); // Pass null for profilePhoto
        return new ModelAndView("redirect:/Login");
    }

    @GetMapping("/home")
    public ModelAndView showHomePage(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Home");
        modelAndView.addObject("username", session.getAttribute("username"));
        modelAndView.addObject("userRole", session.getAttribute("userRole"));
        modelAndView.addObject("userEmail", session.getAttribute("userEmail"));
        return modelAndView;
    }

    @GetMapping("/logout")
    public ModelAndView logout(HttpSession session) {
        session.invalidate();
        return new ModelAndView("redirect:/Login");
    }

    @GetMapping("/profile")
    public ModelAndView showProfile(HttpSession session) {
        ModelAndView modelAndView = new ModelAndView("Profile");
        modelAndView.addObject("username", session.getAttribute("username"));
        modelAndView.addObject("userEmail", session.getAttribute("userEmail"));
        modelAndView.addObject("profilePhotoPath", session.getAttribute("profilePhotoPath"));
        modelAndView.addObject("bio", session.getAttribute("bio"));
        modelAndView.addObject("location", session.getAttribute("location"));
        modelAndView.addObject("phoneNumber", session.getAttribute("phoneNumber"));
        modelAndView.addObject("occupation", session.getAttribute("occupation"));
        modelAndView.addObject("articlesRead", session.getAttribute("articlesRead"));
        modelAndView.addObject("discussions", session.getAttribute("discussions"));
        modelAndView.addObject("achievements", session.getAttribute("achievements"));
        modelAndView.addObject("registeredEvents", session.getAttribute("registeredEvents"));
        modelAndView.addObject("totalEvents", session.getAttribute("totalEvents"));
        modelAndView.addObject("registeredEventsProgress", session.getAttribute("registeredEventsProgress"));
        modelAndView.addObject("attendedEvents", session.getAttribute("attendedEvents"));
        modelAndView.addObject("attendedEventsProgress", session.getAttribute("attendedEventsProgress"));
        return modelAndView;
    }

    @PostMapping("/updateProfile")
    public ModelAndView updateProfile(@RequestParam String bio, @RequestParam String location,
                                      @RequestParam String phoneNumber, @RequestParam String occupation, HttpSession session) {
        String email = (String) session.getAttribute("userEmail");
        User user = userService.getUserByUsername((String) session.getAttribute("username"));

        user.setBio(bio);
        user.setLocation(location);
        user.setPhoneNumber(phoneNumber);
        user.setOccupation(occupation);

        userService.updateUser(user);

        session.setAttribute("bio", bio);
        session.setAttribute("location", location);
        session.setAttribute("phoneNumber", phoneNumber);
        session.setAttribute("occupation", occupation);

        return new ModelAndView("redirect:/profile");
    }
}