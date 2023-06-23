package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.SportEvent;
import com.skilldistillery.leagueolympia.repositories.SportEventRepository;

@Service
public class SportEventServiceImpl implements SportEventService {

	@Autowired
	private SportEventRepository leagueRepo;
	
//	@Autowired
//	private UserRepository userRepo;
	
	@Override
	public List<SportEvent> index() {
		return leagueRepo.findAll();	
	}

	@Override
	public List<SportEvent> index(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
