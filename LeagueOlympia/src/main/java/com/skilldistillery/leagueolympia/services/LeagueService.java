package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.League;

public interface LeagueService {

	public List<League> index();
	public List<League> index(String username);
	public League create(String username, League league);
	public League update(int leagueId, League league);
	public boolean delete(String username, int leagueId);
}
