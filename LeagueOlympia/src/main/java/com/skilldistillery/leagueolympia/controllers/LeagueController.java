package com.skilldistillery.leagueolympia.controllers;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@GetMapping("leagues/{username}")
	public List<League> index(
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("username") String username ,
			Principal principal){
	List<League> usersLeagues = leagueService.index();
	if(usersLeagues == null) {
		res.setStatus(404);
	}
	return usersLeagues;
}
	@PostMapping("leagues")
	public League create(HttpServletRequest req,
			HttpServletResponse res,
			@RequestBody League newLeague,
			Principal principal) {
		
		try {
			newLeague = leagueService.create(principal.getName(), newLeague);
			if(newLeague == null) {
				res.setStatus(404);
			}else {
				res.setStatus(200);
				StringBuffer url = req.getRequestURL();
				res.setHeader("Location", url.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			newLeague = null; 
		}
		return newLeague;
	}
	
	@PutMapping("leagues/{leagueId}")
	public League update(HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("leagueId")Integer leagueId,
			@RequestBody League managedLeague,
			Principal principal) {
		
		try {
			managedLeague = leagueService.update(leagueId, managedLeague);
			if(managedLeague==null) {
				res.setStatus(400);
			} else {
				res.setStatus(200);
			}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
			managedLeague = null;
		}
		return managedLeague;
	}
	
	@PostMapping("leagues/{leagueId}/sportEvent/{sportEventId}")
	public League addSportEvent(
			HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable("leagueId") Integer leagueId,
			@PathVariable("sportEventId") Integer sportEventId,
			Principal principal) {
		League managedLeague = null;
		try {
			managedLeague = leagueService.addSportEvent(sportEventId, leagueId);
				if(managedLeague == null) {
					res.setStatus(404);
				}
		} catch (Exception e) {
			e.printStackTrace();
			res.setStatus(400);
		}
			
		return null;
	}
	
	@DeleteMapping("leauges/{leagueId}")
	public void delete(HttpServletRequest req,
			HttpServletResponse res,
			@PathVariable int leagueId,
			Principal principal) {
		if(leagueService.delete(principal.getName(),leagueId)){
			res.setStatus(200);
		}else {
			res.setStatus(400);
		}
	}

}