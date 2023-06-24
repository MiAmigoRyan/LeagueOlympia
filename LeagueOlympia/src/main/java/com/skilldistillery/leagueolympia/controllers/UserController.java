package com.skilldistillery.leagueolympia.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.services.UserService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class UserController {

	@Autowired
	private UserService userService;
	
	@PutMapping("users/{username}")
	public User update(HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("username") String username,
			@RequestBody User user,
			Principal principal) {
		try {
			user = userService.update(principal.getName(), user);
			if(user == null) {
				res.setStatus(400);
			} else {
				res.setStatus(200);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			user = null;
		}
		return user; 
	}
	
	
	
}
