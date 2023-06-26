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
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.services.AthleteEventService;
import com.skilldistillery.leagueolympia.services.LeagueService;
import com.skilldistillery.leagueolympia.services.SportEventService;
import com.skilldistillery.leagueolympia.services.TeamService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class TeamController {

	@Autowired
	private LeagueService leagueService;
	@Autowired
	private TeamService teamService;
	@Autowired
	private SportEventService sportEventService;
	@Autowired
	private AthleteEventService athleteEventService;
	
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
			if(newTeam == null || leagueId == null) {
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
	@PostMapping("teams/{leagueId}/sportEvents/{sportEventId}/athletes/{athleteId}")
	public Team addAthlete(
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("leagueId") Integer leagueId,
			@PathVariable ("sportEventId") Integer sportEventId,
			@PathVariable("athleteId") Integer athleteId,
			Principal principal
			){
		Team managedTeam = null;
		try {
			managedTeam = teamService.addAthlete(athleteId, leagueId, sportEventId, principal.getName()) ;
			if(managedTeam == null) {
				res.setStatus(404);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
		}
		return managedTeam;
	}
	//list athletes by league and port even
	@GetMapping("sportEvents/{sportEventId}/athleteEvents")
	public List<AthleteEvent> athletesBySportEventInLeague(HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable ("sportEventId") Integer sportEventId
			){
		
		//List<SportEvent> sportEvents = sportEventService.findByLeague(leagueId);
		return athleteEventService.findByEvent(sportEventId);
	
	}
	
	@PutMapping("teams/{leagueId}")
	public Team update(
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable ("leagueId") Integer leagueId,
			@RequestBody Team team,
			Principal principal){
		
		try {
			team = teamService.update(team, leagueId, principal.getName());
			if(team == null) {
				res.setStatus(404);
			}else {
				res.setStatus(200);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			team = null;
		}
		
		return team;
		
	}
	
}
