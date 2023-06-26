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
	@Autowired
	UserRepository userRepo;

	@Override
	public List<League> index() {
		return leagueRepo.findAll();
	}

	@Override
	public List<League> index(String username) {
		User user = userRepo.findByUsername(username);
		return user.getLeagues();
	}

	@Override
	public League create(String username, League newLeague) {
		User user = userRepo.findByUsername(username);
		if (user != null) {
			newLeague.setComissioner(user);
			return leagueRepo.saveAndFlush(newLeague);
		}
		return null;
	}
	
	@Override
	public League update(int leagueId, League league) {
		League managedLeague = leagueRepo.findById(leagueId);
		if(managedLeague.getId()==leagueId) {
			managedLeague.setLeagueName(league.getLeagueName());
			managedLeague.setComissioner(league.getComissioner());
			managedLeague.setBetEnabled(league.isBetEnabled());
			managedLeague.setEnabled(league.isEnabled());
			managedLeague.setPhotoUrl(league.getPhotoUrl());
			managedLeague.setSideWager(league.getSideWager());
			managedLeague.setBuyIn(league.getBuyIn());
			return leagueRepo.saveAndFlush(managedLeague);
		}
		return null;
	}
}
