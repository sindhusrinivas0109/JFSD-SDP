package com.klu.models;

import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import jakarta.persistence.Id;
import jakarta.persistence.Column;

@Entity
@Table(name ="admin_table")
public class Admin {

    @Id
    @Column(name="admin_username", length = 50, nullable = false)
    private String username;

    @Column(name="admin_email", length = 50, nullable = false, unique = true)
    private String email;

    @Column(name="admin_password", length = 50, nullable = false)
    private String password;

    // Getters and Setters
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}