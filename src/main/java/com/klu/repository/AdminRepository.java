package com.klu.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klu.models.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, String> {
    Admin findByUsername(String username);
    Admin findByEmail(String email);
}