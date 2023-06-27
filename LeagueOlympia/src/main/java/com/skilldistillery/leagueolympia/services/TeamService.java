package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.AthleteEventId;
import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.entities.TeamId;

public interface TeamService {

	public List<Team> index();
	
	public List<Team> index(String username);
	public Team create(String username, Team team, Integer leagueId);
	public Team addAthlete(Integer athleteId, Integer leagueId, Integer sportEventId, String username);
	Team update(Team team, Integer leagueId, String username);
	//public Team removeTeam(String username, Integer leagueId);
	public Team removeAthleteEventFromTeam(String username, 
			TeamId teamId, 
			AthleteEventId athleteEventId);

}
