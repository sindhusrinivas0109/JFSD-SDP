package com.klu.service;

import com.klu.models.Blog;
import com.klu.models.Comment;
import com.klu.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    public List<Blog> getAllBlogs() {
        List<Blog> blogs = blogRepository.findAll();
        System.out.println("Fetched blogs: " + blogs); // Add this line for debugging
        return blogs;
    }
    public void saveBlog(Blog blog) {
        blogRepository.save(blog);
    }

    public Blog toggleLike(Long id) {
        Blog blog = blogRepository.findById(id).orElseThrow();
        blog.setLikes(blog.getLikes() + 1);
        return blogRepository.save(blog);
    }

    public void addComment(Long id, Comment comment) {
        Blog blog = blogRepository.findById(id).orElseThrow();
        blog.getComments().add(comment);
        blogRepository.save(blog);
    }
}