package com.skilldistillery.leagueolympia.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.services.LeagueService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class LeagueController {

	@Autowired
	private LeagueService leagueService;
	
	@GetMapping("leagues")
	public List<League> index(HttpServletRequest req, HttpServletResponse res) {
		List<League> leagues = leagueService.index();
		if (leagues == null) {
			res.setStatus(404);
		}
		return leagues;
	}
	
//	@GetMapping("leagues/{userId}")
//	public 
}
