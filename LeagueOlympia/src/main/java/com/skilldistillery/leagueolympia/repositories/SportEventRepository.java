package com.skilldistillery.leagueolympia.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.SportEvent;

public interface SportEventRepository extends JpaRepository<SportEvent , Integer> {
	
	public List<SportEvent> findByLeagues_Id(Integer leagueId);
	
}
