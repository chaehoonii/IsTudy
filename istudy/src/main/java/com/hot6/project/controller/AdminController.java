package com.hot6.project.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hot6.project.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {
	@Inject
	AdminService service;
	
	@GetMapping("adminMain")
	public String adminMain() {
		return "/admin/adminList";
	}
}
