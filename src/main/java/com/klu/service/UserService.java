package com.klu.service;

import com.klu.models.User;
import com.klu.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

@Service
public class UserService {

    private static final String UPLOAD_DIR = "uploads/";

    @Autowired
    private UserRepository userRepository;

    public User registerUser(User user, MultipartFile profilePhoto) {
        if (profilePhoto != null && !profilePhoto.isEmpty()) {
            try {
                String fileName = UUID.randomUUID().toString() + "_" + profilePhoto.getOriginalFilename();
                Path filePath = Paths.get(UPLOAD_DIR, fileName);
                Files.createDirectories(filePath.getParent());
                Files.copy(profilePhoto.getInputStream(), filePath);
                user.setProfilePhotoPath(filePath.toString());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return userRepository.save(user);
    }

    public User authenticateUser(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    public User getUserByUsername(String username) {
        return userRepository.findByName(username);
    }

    public User updateUser(User user) {
        return userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}