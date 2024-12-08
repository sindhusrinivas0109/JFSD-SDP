package com.klu.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "User_Table")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "User_id")
    private int id;

    @Column(name = "User_name", nullable = false)
    private String name;

    @Column(name = "User_email", nullable = false, unique = true)
    private String email;

    @Column(name = "User_password", nullable = false)
    private String password;

    @Column(name = "Profile_Photo_Path")
    private String profilePhotoPath;

    @Column(name = "Bio")
    private String bio;

    @Column(name = "Location")
    private String location;

    @Column(name = "Phone_Number")
    private String phoneNumber;

    @Column(name = "Occupation")
    private String occupation;

    @Column(name = "Articles_Read")
    private Integer articlesRead;

    @Column(name = "Discussions")
    private Integer discussions;

    @Column(name = "Achievements")
    private Integer achievements;

    @Column(name = "Registered_Events")
    private Integer registeredEvents;

    @Column(name = "Total_Events")
    private Integer totalEvents;

    @Column(name = "Registered_Events_Progress")
    private Integer registeredEventsProgress;

    @Column(name = "Attended_Events")
    private Integer attendedEvents;

    @Column(name = "Attended_Events_Progress")
    private Integer attendedEventsProgress;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    public String getProfilePhotoPath() {
        return profilePhotoPath;
    }

    public void setProfilePhotoPath(String profilePhotoPath) {
        this.profilePhotoPath = profilePhotoPath;
    }

    public String getBio() {
        return bio;
    }

    public void setBio(String bio) {
        this.bio = bio;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
    }

    public Integer getArticlesRead() {
        return articlesRead;
    }

    public void setArticlesRead(Integer articlesRead) {
        this.articlesRead = articlesRead;
    }

    public Integer getDiscussions() {
        return discussions;
    }

    public void setDiscussions(Integer discussions) {
        this.discussions = discussions;
    }

    public Integer getAchievements() {
        return achievements;
    }

    public void setAchievements(Integer achievements) {
        this.achievements = achievements;
    }

    public Integer getRegisteredEvents() {
        return registeredEvents;
    }

    public void setRegisteredEvents(Integer registeredEvents) {
        this.registeredEvents = registeredEvents;
    }

    public Integer getTotalEvents() {
        return totalEvents;
    }

    public void setTotalEvents(Integer totalEvents) {
        this.totalEvents = totalEvents;
    }

    public Integer getRegisteredEventsProgress() {
        return registeredEventsProgress;
    }

    public void setRegisteredEventsProgress(Integer registeredEventsProgress) {
        this.registeredEventsProgress = registeredEventsProgress;
    }

    public Integer getAttendedEvents() {
        return attendedEvents;
    }

    public void setAttendedEvents(Integer attendedEvents) {
        this.attendedEvents = attendedEvents;
    }

    public Integer getAttendedEventsProgress() {
        return attendedEventsProgress;
    }

    public void setAttendedEventsProgress(Integer attendedEventsProgress) {
        this.attendedEventsProgress = attendedEventsProgress;
    }
}