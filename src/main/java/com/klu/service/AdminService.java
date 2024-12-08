package com.klu.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klu.models.Admin;
import com.klu.repository.AdminRepository;

@Service
public class AdminService {

    private static final Logger logger = LoggerFactory.getLogger(AdminService.class);

    @Autowired
    private AdminRepository adminRepository;

    public boolean authenticate(String identifier, String password) {
        logger.info("Attempting to authenticate admin with identifier: {}", identifier);

        Admin admin = adminRepository.findByUsername(identifier);
        if (admin == null) {
            admin = adminRepository.findByEmail(identifier);
        }

        if (admin != null) {
            logger.info("Found admin: {}", admin.getUsername());
            if (admin.getPassword().equals(password)) {
                logger.info("Authentication successful for admin: {}", admin.getUsername());
                return true;
            } else {
                logger.warn("Password mismatch for admin: {}", admin.getUsername());
            }
        } else {
            logger.warn("Admin not found for identifier: {}", identifier);
        }
        return false;
    }

    public Admin findByIdentifier(String identifier) {
        Admin admin = adminRepository.findByUsername(identifier);
        if (admin == null) {
            admin = adminRepository.findByEmail(identifier);
        }
        return admin;
    }
}