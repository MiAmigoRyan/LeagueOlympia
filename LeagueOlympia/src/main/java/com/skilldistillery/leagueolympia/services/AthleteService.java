package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.Athlete;
import com.skilldistillery.leagueolympia.entities.AthleteEvent;

public interface AthleteService {
	
	public List<Athlete> index();
	
	public List<AthleteEvent> athleteEventsBySportId(Integer sportEventId);
	
	
}
	
