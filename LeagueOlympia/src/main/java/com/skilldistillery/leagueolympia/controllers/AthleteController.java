package com.skilldistillery.leagueolympia.controllers;

import java.security.Principal;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.services.AthleteService;
import com.skilldistillery.leagueolympia.services.UserService;

@RestController
@RequestMapping("api")
@CrossOrigin({"*", "http://localhost/"})
public class AthleteController {

	@Autowired
	private AthleteService athleteService;
	

	@GetMapping("athletes")
	public List<Athlete> index(
			HttpServletRequest req,
			HttpServletResponse res){
		List<Athlete> athletes = athleteService.index();
		if(athletes == null) {
			res.setStatus(400);
		}
		return athletes;
	}
	
//	@PutMapping("athletes/{athleteId}")
//	public User update(HttpServletRequest req,
//			HttpServletResponse res,
//			@PathVariable("athleteId") Integer athleteId,
//			@RequestBody Athlete newAthlete,
//			Principal principal) {
//		try {
//			 = athleteService.update(principal.getName(), *** );
//			if( == null) {
//				res.setStatus(400);
//			} else {
//				res.setStatus(200);
//				
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			res.setStatus(400);
//			newAthlete = null;
//		}
//		return newAthlete; 
//	}
	
	
	
}
