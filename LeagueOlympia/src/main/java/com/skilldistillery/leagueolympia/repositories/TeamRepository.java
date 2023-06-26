package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.Team;

public interface TeamRepository extends JpaRepository<Team , Integer> {
	
	public Team findByUser_UsernameAndLeagueId(String username, Integer leagueId);
	
}
