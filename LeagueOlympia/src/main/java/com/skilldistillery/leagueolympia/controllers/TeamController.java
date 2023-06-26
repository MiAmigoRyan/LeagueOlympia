package com.skilldistillery.leagueolympia.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.services.LeagueService;
import com.skilldistillery.leagueolympia.services.TeamService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class TeamController {

	@Autowired
	private LeagueService leagueService;
	@Autowired
	private TeamService teamService;
	
	@GetMapping("teams")
	public List<Team> index(HttpServletRequest req, HttpServletResponse res) {
		List<Team> teams = teamService.index();
		if (teams == null) {
			res.setStatus(404);
		}
		return teams;
	}
	
	@GetMapping("teams/{username}")
	public List<Team> index(
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("username") String username ,
			Principal principal){
	List<Team> usersTeams = teamService.index();
	if(usersTeams == null) {
		res.setStatus(404);
	}
	return usersTeams;
}
	
 	
	@PostMapping("teams/{leagueId}")
	public Team create(HttpServletRequest req,
			HttpServletResponse res,
			@RequestBody Team newTeam,
			@PathVariable("leagueId") Integer leagueId,
			Principal principal) {
		
		try {
			newTeam = teamService.create(principal.getName(), newTeam, leagueId);
			if(newTeam == null) {
				res.setStatus(404);
			}else {
				res.setStatus(200);
				StringBuffer url = req.getRequestURL();
				url.append("/").append(newTeam.getId());
				res.setHeader("Location", url.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			newTeam = null; 
		}
		return newTeam;
		
	}
}
