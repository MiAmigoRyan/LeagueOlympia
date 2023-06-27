package com.skilldistillery.leagueolympia.services;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.Athlete;
import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.repositories.AthleteEventRepository;
import com.skilldistillery.leagueolympia.repositories.AthleteRepository;
import com.skilldistillery.leagueolympia.repositories.TeamRepository;

@Service
public class AthleteServiceImpl implements AthleteService{

	@Autowired
	private AthleteRepository athleteRepo;
	@Autowired
	private AthleteEventRepository athleteEventRepo;
	
	@Autowired
	private TeamRepository teamRepo;
	
	@Override
	public List<Athlete> index() {
		return athleteRepo.findAll();
	}

	@Override
	public List<AthleteEvent> athleteEventsBySportId(Integer sportEventId) {
		return athleteEventRepo.findBySportEvent_Id(sportEventId);

	}
}
