package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.SportEvent;

public interface SportEventRepository extends JpaRepository<SportEvent , Integer> {
	
	
	
}
