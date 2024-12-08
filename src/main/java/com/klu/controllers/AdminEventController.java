package com.klu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.klu.models.Event;
import com.klu.service.EventService;

import java.util.List;

@Controller
@RequestMapping("/admin/events")
public class AdminEventController {
    @Autowired
    private EventService eventService;

    @GetMapping
    public String getAllEvents(Model model) {
        List<Event> events = eventService.getAllEvents();
        model.addAttribute("events", events);
        return "adminEvents";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("event", new Event());
        return "eventForm";
    }

    @PostMapping("/create")
    public String createEvent(@ModelAttribute Event event) {
        eventService.createEvent(event);
        return "redirect:/admin/events";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Event event = eventService.getEventById(id);
        model.addAttribute("event", event);
        return "eventForm";
    }

    @PostMapping("/update")
    public String updateEvent(@ModelAttribute Event event) {
        eventService.updateEvent(event);
        return "redirect:/admin/events";
    }

    @PostMapping("/delete")
    public String deleteEvent(@RequestParam Long eventId) {
        eventService.deleteEvent(eventId);
        return "redirect:/admin/events";
    }
}