package com.klu.controllers;

import com.klu.models.Videos;
import com.klu.service.VideosService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class VideosController {

    @Autowired
    private VideosService videosService;

    @GetMapping("/Videos")
    public ModelAndView fetchVideos() {
        List<Videos> videos = videosService.getAllVideos();
        System.out.println("Videos fetched: " + videos.size()); // Debug statement
        ModelAndView modelAndView = new ModelAndView("Videos"); // Ensure this matches the JSP file name without the extension
        modelAndView.addObject("videos", videos);
        return modelAndView;
    }

    @GetMapping("videos/admin")
    public ModelAndView adminVideos() {
        ModelAndView modelAndView = new ModelAndView("adminVideos");
        return modelAndView;
    }

    @PostMapping("videos/saveVideo")
    public ModelAndView saveVideo(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam String thumbnailUrl,
            @RequestParam String videoUrl,
            @RequestParam String instructor,
            @RequestParam String duration,
            @RequestParam int views,
            @RequestParam String category) {

        Videos video = new Videos();
        video.setTitle(title);
        video.setDescription(description);
        video.setThumbnailUrl(thumbnailUrl);
        video.setVideoUrl(videoUrl);
        video.setInstructor(instructor);
        video.setDuration(duration);
        video.setViews(views);
        video.setCategory(category);

        videosService.saveVideo(video);

        ModelAndView modelAndView = new ModelAndView("redirect:/videos/admin");
        return modelAndView;
    }

    @PostMapping("videos/deleteVideo")
    public ModelAndView deleteVideo(@RequestParam Long id) {
        videosService.deleteVideo(id);
        ModelAndView modelAndView = new ModelAndView("redirect:/videos/admin");
        return modelAndView;
    }
}