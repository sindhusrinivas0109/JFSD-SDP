package com.klu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.models.Event;
import com.klu.repository.EventRepository;

import java.util.List;
import java.util.logging.Logger;
import java.util.stream.Collectors;

@Service
public class EventService {
    private static final Logger logger = Logger.getLogger(EventService.class.getName());

    @Autowired
    private EventRepository eventRepository;

    public List<Event> getAllEvents() {
        logger.info("Fetching all events");
        return eventRepository.findAll();
    }

    public Event getEventById(Long id) {
        logger.info("Fetching event by ID: " + id);
        return eventRepository.findById(id).orElse(null);
    }

    public Event createEvent(Event event) {
        logger.info("Creating event: " + event.getTitle());
        return eventRepository.save(event);
    }

    public Event updateEvent(Event event) {
        logger.info("Updating event: " + event.getTitle());
        return eventRepository.save(event);
    }

    public void deleteEvent(Long id) {
        logger.info("Deleting event with ID: " + id);
        eventRepository.deleteById(id);
    }

    public void registerForEvent(Long eventId, String userId) {
        logger.info("Registering user " + userId + " for event with ID: " + eventId);
        Event event = eventRepository.findById(eventId).orElseThrow();
        event.getRegisteredUsers().add(userId);
        eventRepository.save(event);
    }

    public void cancelRegistration(Long eventId, String userId) {
        logger.info("Canceling registration for user " + userId + " for event with ID: " + eventId);
        Event event = eventRepository.findById(eventId).orElseThrow();
        event.getRegisteredUsers().remove(userId);
        eventRepository.save(event);
    }

    public List<Event> getRegisteredEventsForUser(String email) {
        logger.info("Fetching registered events for user: " + email);
        List<Event> allEvents = eventRepository.findAll();
        return allEvents.stream()
                .filter(event -> event.getRegisteredUsers().contains(email))
                .collect(Collectors.toList());
    }
}