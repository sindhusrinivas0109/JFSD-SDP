package com.klu.service;

import com.klu.models.Videos;
import com.klu.repository.VideosRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideosService {

    @Autowired
    private VideosRepository videosRepository;

    public List<Videos> getAllVideos() {
        List<Videos> videos = videosRepository.findAll();
        System.out.println("Videos fetched from repository: " + videos.size()); // Debug statement
        return videos;
    }

    public void saveVideo(Videos video) {
        videosRepository.save(video);
    }

    public void deleteVideo(Long id) {
        videosRepository.deleteById(id);
    }
}