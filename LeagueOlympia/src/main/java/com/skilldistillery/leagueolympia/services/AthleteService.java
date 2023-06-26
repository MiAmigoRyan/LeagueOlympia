package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.Athlete;

public interface AthleteService {
	public List<Athlete> index();
	List<Athlete> indexOfAthletEvents(int teamId);
}
