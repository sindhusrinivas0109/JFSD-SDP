package com.klu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.klu.models.Event;
import com.klu.models.User;
import com.klu.service.EventService;

import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.logging.Logger;

@Controller
@RequestMapping("/events")
public class EventController {
    private static final Logger logger = Logger.getLogger(EventController.class.getName());

    @Autowired
    private EventService eventService;

    @GetMapping
    public String getAllEvents(Model model) {
        List<Event> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        model.addAttribute("registeredEvents", getRegisteredEvents()); // Assuming you have a method to get registered events
        model.addAttribute("isAdmin", isCurrentUserAdmin()); // Assuming you have a method to check if the current user is an admin
        return "events"; // Ensure this matches the JSP file name
    }

    @PostMapping("/register")
    public String registerForEvent(@RequestParam Long eventId) {
        eventService.registerForEvent(eventId, "current-user");
        return "redirect:/events";
    }

    @PostMapping("/cancel")
    public String cancelRegistration(@RequestParam Long eventId) {
        eventService.cancelRegistration(eventId, "current-user");
        return "redirect:/events";
    }

    @GetMapping("/my-events")
    public String getMyEvents(Model model) {
        List<Event> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        return "userEvents"; // Ensure this matches the JSP file name
    }

    // Admin Actions

    @GetMapping("/admin/create")
    public String showCreateForm(Model model) {
        model.addAttribute("event", new Event());
        return "eventForm"; // Ensure this matches the JSP file name
    }

    @PostMapping("/admin/create")
    public String createEvent(@ModelAttribute Event event) {
        eventService.createEvent(event);
        return "redirect:/events";
    }

    @GetMapping("/admin/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Event event = eventService.getEventById(id);
        model.addAttribute("event", event);
        return "eventForm"; // Ensure this matches the JSP file name
    }

    @PostMapping("/admin/update")
    public String updateEvent(@ModelAttribute Event event) {
        eventService.updateEvent(event);
        return "redirect:/events";
    }

    @PostMapping("/admin/delete")
    public String deleteEvent(@RequestParam Long eventId) {
        eventService.deleteEvent(eventId);
        return "redirect:/events";
    }

    // Helper Methods

    private List<String> getRegisteredEvents() {
        // Implement logic to get registered events for the current user
        return List.of("eventId1", "eventId2"); // Example
    }

    private boolean isCurrentUserAdmin() {
        // Implement logic to check if the current user is an admin
        return true; // Example
    }
    
    @GetMapping("/registered-events")
    public String getRegisteredEvents(Model model, HttpSession session) {
        logger.info("Entering getRegisteredEvents method");
        User user = (User) session.getAttribute("user");
        if (user == null) {
            logger.warning("User not found in session. Redirecting to login.");
            return "redirect:/login"; // Redirect to login if user is not authenticated
        }
        logger.info("User found in session: " + user.getEmail());
        List<Event> registeredEvents = eventService.getRegisteredEventsForUser(user.getEmail());
        logger.info("Retrieved registered events for user: " + registeredEvents.size());
        model.addAttribute("registeredEvents", registeredEvents);
        model.addAttribute("user", user);
        return "userEvents"; // Ensure this matches the JSP file name
    }

    private List<Event> getRegisteredEventsForUser(String email) {
        // Implement logic to get registered events for the user by email
        return List.of(new Event(), new Event()); // Example
    }
}