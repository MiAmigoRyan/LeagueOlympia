package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.SportEvent;
import com.skilldistillery.leagueolympia.repositories.SportEventRepository;

@Service
public class SportEventServiceImpl implements SportEventService {

	@Autowired
	private SportEventRepository sportEventRepo;
	

	
	@Override
	public List<SportEvent> index() {
		return sportEventRepo.findAll();	
	}
	
	@Override
	public List<SportEvent> findByLeague(Integer leagueId){
		return sportEventRepo.findByLeagues_Id(leagueId);
	}

	
	@Override
	public List<SportEvent> index(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
