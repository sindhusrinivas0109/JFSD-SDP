// Videos.java

package com.klu.models;

import jakarta.persistence.*;

@Entity
@Table(name = "videos")
public class Videos {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "video_id")
    private Long id;

    public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

	public String getVideoUrl() {
		return videoUrl;
	}

	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Column(name = "video_title", nullable = false)
    private String title;

    @Column(name = "video_description", nullable = false)
    private String description;

    @Column(name = "video_thumbnail_url", nullable = false)
    private String thumbnailUrl;

    @Column(name = "video_video_url", nullable = false)
    private String videoUrl;

    @Column(name = "video_instructor", nullable = false)
    private String instructor;

    @Column(name = "video_duration", nullable = false)
    private String duration;

    @Column(name = "video_views", nullable = false)
    private int views;

    @Column(name = "video_category", nullable = false)
    private String category;

    // getters and setters...
}