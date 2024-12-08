package com.klu.controllers;

import com.klu.models.Feedback;
import com.klu.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class FeedbackController {

    @Autowired
    private FeedbackService feedbackService;

    @GetMapping("/feedback")
    public ModelAndView showFeedbackForm() {
        ModelAndView modelAndView = new ModelAndView("Feedback");
        List<Feedback> feedbackList = feedbackService.getAllFeedback();
        modelAndView.addObject("feedbackList", feedbackList);
        return modelAndView;
    }

    @PostMapping("/feedback")
    public ModelAndView submitFeedback(@RequestParam String name, @RequestParam String email, @RequestParam String subject,
                                       @RequestParam int rating, @RequestParam String feedback) {
        Feedback newFeedback = new Feedback();
        newFeedback.setName(name);
        newFeedback.setEmail(email);
        newFeedback.setSubject(subject);
        newFeedback.setRating(rating);
        newFeedback.setFeedback(feedback);

        feedbackService.saveFeedback(newFeedback);

        return new ModelAndView("redirect:/feedback");
    }
}