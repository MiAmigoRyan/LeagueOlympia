package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.repositories.LeagueRepository;
import com.skilldistillery.leagueolympia.repositories.UserRepository;

@Service
public class LeagueServiceImpl implements LeagueService {

	@Autowired
	private LeagueRepository leagueRepo;
	@Autowired UserRepository userRepo;
	
	
	@Override
	public List<League> index() {
		return leagueRepo.findAll();	
	}

	@Override
	public List<League> index(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public League create(String username, League newLeague) {
		User user = userRepo.findByUsername(username);
		if(user != null) {
			newLeague.setComissioner(user);
			return leagueRepo.saveAndFlush(newLeague);
		}
		return null;
	}

}
