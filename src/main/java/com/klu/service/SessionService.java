package com.klu.service;

import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class SessionService {

    public void setUserSession(HttpSession session, String username, String email) {
        session.setAttribute("username", username);
        session.setAttribute("email", email);
    }

    public String getUsername(HttpSession session) {
        return (String) session.getAttribute("username");
    }

    public String getEmail(HttpSession session) {
        return (String) session.getAttribute("email");
    }
}