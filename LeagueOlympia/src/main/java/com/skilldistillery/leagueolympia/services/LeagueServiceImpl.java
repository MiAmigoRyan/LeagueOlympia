package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.entities.SportEvent;
import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.repositories.LeagueRepository;
import com.skilldistillery.leagueolympia.repositories.SportEventRepository;
import com.skilldistillery.leagueolympia.repositories.UserRepository;

@Service
public class LeagueServiceImpl implements LeagueService {

	@Autowired
	private LeagueRepository leagueRepo;
	@Autowired
	private UserRepository userRepo;
	@Autowired 
	private SportEventRepository sportEventRepo;
	
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
		League managedLeague = leagueRepo.queryById(leagueId);
		if(managedLeague.getId()==leagueId) {
			managedLeague.setLeagueName(league.getLeagueName());
			managedLeague.setComissioner(league.getComissioner());
			managedLeague.setBetEnabled(league.isBetEnabled());
			managedLeague.setEnabled(league.isEnabled());
			managedLeague.setPhotoUrl(league.getPhotoUrl());
			managedLeague.setSideWager(league.getSideWager());
			managedLeague.setBuyIn(league.getBuyIn());
			managedLeague.setSportEvents(league.getSportEvents());
			return leagueRepo.saveAndFlush(managedLeague);
		}
		return null;
	}
	
	@Override
	public League addSportEvent(
			Integer sportEventId,
			Integer leagueId) {
		League league = leagueRepo.queryById(leagueId);
		SportEvent event = sportEventRepo.queryById(sportEventId);
		
		if(league !=null && event !=null) {
			league.addSportEvent(event);
			return leagueRepo.saveAndFlush(league);
		}
		return null;
	}

	@Override
	public boolean delete(String username, int leagueId) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
