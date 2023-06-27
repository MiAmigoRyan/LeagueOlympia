package com.skilldistillery.leagueolympia.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.entities.AthleteEventId;
import com.skilldistillery.leagueolympia.entities.TeamId;


public interface AthleteEventRepository  extends JpaRepository <AthleteEvent, Integer>{

	public List<AthleteEvent> findBySportEvent_Id(Integer sportEventId);
	public AthleteEvent findByAthleteIdAndSportEvent_Id(Integer athleteEventId, Integer sportEventId);
	public AthleteEvent findByAthleteEventIdAndTeams_Id(AthleteEventId athleteEventId, TeamId teamId);
	
}
