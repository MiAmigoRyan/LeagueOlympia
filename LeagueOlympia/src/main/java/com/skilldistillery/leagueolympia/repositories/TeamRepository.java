package com.skilldistillery.leagueolympia.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.entities.TeamId;

public interface TeamRepository extends JpaRepository<Team , Integer> {
	
	public Team findByUser_UsernameAndLeagueId(String username, Integer leagueId);
	
	public Team findByUser_UsernameAndId(String username, TeamId teamId);
	
	public List<Team> findByUser_Username(String username);
	
}
