package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.League;

public interface LeagueRepository extends JpaRepository<League , Integer> {
	
	League findById(int leagueId);
	
}
