package com.skilldistillery.leagueolympia.services;

import java.util.List;

import com.skilldistillery.leagueolympia.entities.SportEvent;

public interface SportEventService {

	public List<SportEvent> index();
	public List<SportEvent> index(String username);
}
