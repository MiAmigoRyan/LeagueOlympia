package com.skilldistillery.leagueolympia.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.services.AthleteEventService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class AthleteEventController {

	@Autowired
	private AthleteEventService athleteEventService;
	

	@GetMapping("athleteEvents")
	public List<AthleteEvent> index(
			HttpServletRequest req,
			HttpServletResponse res){
		List<AthleteEvent> athleteEvents = athleteEventService.index();
		if(athleteEvents.size()==0) {
			res.setStatus(404);
		}
		return athleteEvents;	}
	
	
}
