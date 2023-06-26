package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.Team;

public interface TeamService {

	public List<Team> index();
	public List<Team> index(String username);
	public Team create(String username, Team team, Integer leagueId);
	public Team addAthlete(Integer athleteId, Integer leagueId, Integer sportEventId, String username);

}
