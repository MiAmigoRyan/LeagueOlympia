package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.repositories.LeagueRepository;

@Service
public class LeagueServiceImpl implements LeagueService {

	@Autowired
	private LeagueRepository leagueRepo;
	
	
	@Override
	public List<League> index() {
		return leagueRepo.findAll();	
	}

	@Override
	public List<League> index(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
