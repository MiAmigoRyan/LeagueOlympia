package com.skilldistillery.leagueolympia.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.SportEvent;
import com.skilldistillery.leagueolympia.services.SportEventService;


@RestController
@RequestMapping("api")
@CrossOrigin({ "*", "http://localhost/" })
public class SportEventController {

	@Autowired
	private SportEventService sportEventService;

	@GetMapping("events")
	public List<SportEvent> index(HttpServletRequest req, HttpServletResponse res) {
		List<SportEvent> sportEvents = sportEventService.index();
		if (sportEvents == null) {
			res.setStatus(404);
		}
		return sportEvents;
	}
	
	@GetMapping("events/{leagueId}")
	public List<SportEvent> getByLeagues(
			HttpServletRequest req, 
			HttpServletResponse res,
			@PathVariable("leagueId") Integer leagueId
			){
		List<SportEvent> sportEventsInLeague = sportEventService.findByLeague(leagueId);
		if(sportEventsInLeague.size()==0) {
			res.setStatus(404);
		}
		return sportEventsInLeague;
	}
}
