package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.klu.models.Event;


public interface EventRepository extends JpaRepository<Event, Long> {
}