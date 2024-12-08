package com.klu.controllers;

import com.klu.models.Blog;
import com.klu.models.Comment;
import com.klu.service.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BlogController {

    @Autowired
    private BlogService blogService;

    @GetMapping("/blogs")
    public String getAllBlogs(Model model) {
        List<Blog> blogs = blogService.getAllBlogs();
        model.addAttribute("blogs", blogs);
        System.out.println("Fetched blogs: " + blogs); // Add this line for debugging
        return "Blogs";
    }

    @PostMapping("/createBlog")
    public String createBlog(@ModelAttribute Blog blog) {
        blogService.saveBlog(blog);
        return "redirect:/blogs";
    }

    @PostMapping("/likeBlog/{id}")
    @ResponseBody
    public Blog likeBlog(@PathVariable Long id) {
        return blogService.toggleLike(id);
    }

    @PostMapping("/addComment/{id}")
    @ResponseBody
    public void addComment(@PathVariable Long id, @RequestBody Comment comment) {
        blogService.addComment(id, comment);
    }
}