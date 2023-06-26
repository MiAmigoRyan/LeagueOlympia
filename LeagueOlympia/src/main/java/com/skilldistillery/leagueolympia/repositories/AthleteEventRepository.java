package com.skilldistillery.leagueolympia.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;


public interface AthleteEventRepository  extends JpaRepository <AthleteEvent, Integer>{

	public List<AthleteEvent> findBySportEvent_Id(Integer sportEventId);
	public AthleteEvent findByAthlete_IdAndSportEvent_Id(Integer athleteEventId, Integer sportEventId);
	
}
