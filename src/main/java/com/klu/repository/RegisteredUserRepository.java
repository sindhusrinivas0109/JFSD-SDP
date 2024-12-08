package com.klu.repository;

import com.klu.models.RegisteredUser;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RegisteredUserRepository extends JpaRepository<RegisteredUser, Long> {
    RegisteredUser findByEventIdAndUsername(Long eventId, String username);
}