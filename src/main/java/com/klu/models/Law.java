// Law.java

package com.klu.models;

import jakarta.persistence.*;

@Entity
public class Law {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Law_id")
    private Long id;

    @Column(name = "Law_category", nullable = false)
    private String category;

    @Column(name = "Law_name", nullable = false)
    private String name;

    @Column(name = "Law_description", nullable = false)
    private String description;

    @Column(name = "Law_url", nullable = false)
    private String url;

    @Column(name = "Law_detailed_info", nullable = false, columnDefinition = "TEXT")
    private String detailedInfo;

    // Default constructor (required by JPA)
    public Law() {}

    // Constructor
    public Law(String category, String name, String description, String url, String detailedInfo) {
        this.category = category;
        this.name = name;
        this.description = description;
        this.url = url;
        this.detailedInfo = detailedInfo;
    }

    // Getters
    public Long getId() {
        return id;
    }

    public String getCategory() {
        return category;
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }

    public String getUrl() {
        return url;
    }

    public String getDetailedInfo() {
        return detailedInfo;
    }

    // Setters (optional, if you need to modify the fields later)
    public void setId(Long id) {
        this.id = id;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setDetailedInfo(String detailedInfo) {
        this.detailedInfo = detailedInfo;
    }
}