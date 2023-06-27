package com.skilldistillery.leagueolympia.repositories;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.skilldistillery.leagueolympia.entities.League;

public interface LeagueRepository extends JpaRepository<League , Integer> {
	
	League queryById(int leagueId);
	
	@Transactional
	@Modifying
	@Query(value = "insert into user_has_bought_in (user_id, league_id) VALUES (?1,?2)", nativeQuery = true)
	void addBoughtInUser(int userId, int leagueId);
	
}
