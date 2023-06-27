package com.skilldistillery.leagueolympia.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.Athlete;


public interface AthleteRepository  extends JpaRepository <Athlete, Integer>{

//	public List<Athlete> findByAthlete_eventAndSport_event_id(Integer sportEventId);
}
