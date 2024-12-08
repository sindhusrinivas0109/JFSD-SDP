package com.klu.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Controller1 {
	
	@GetMapping("/")
	public String method1(){
		return "index";
	}
	@GetMapping("/Books")
	public String LawBooks(){
		return "Books";
	}
	

	@GetMapping("/Sub")
	public String SubscribePage(){
		return "Subscribe";
	}

	@GetMapping("/Contact")
	public String ContactPage(){
		return "Contact";
	}
	
	@GetMapping("/About")
	public String AboutPage(){
		return "About";
	}
		
	@GetMapping("/Articles")
	public String ArticlesPage(){
		return "Articles";
	}
	
	@GetMapping("/Navbar")
	public String Navbar(){
		return "Navbar";
	}
	
	
	@GetMapping("/Profile")
	public String ProfilePage(){
		return "Profile";
	}
}



