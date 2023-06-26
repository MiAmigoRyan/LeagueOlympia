package com.skilldistillery.leagueolympia.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.repositories.AthleteEventRepository;

@Service
public class AthleteEventServiceImpl implements AthleteEventService{

	@Autowired
	private AthleteEventRepository athleteEventRepo;
	
	
	@Override
	public List<AthleteEvent> index() {
		return athleteEventRepo.findAll();
	}


	@Override
	public List<AthleteEvent> findByEvent(Integer sportEventId) {
		return athleteEventRepo.findBySportEvent_Id(sportEventId)
		;
	}
}
