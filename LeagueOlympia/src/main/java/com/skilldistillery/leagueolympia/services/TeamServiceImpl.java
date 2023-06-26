package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.entities.TeamId;
import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.repositories.LeagueRepository;
import com.skilldistillery.leagueolympia.repositories.TeamRepository;
import com.skilldistillery.leagueolympia.repositories.UserRepository;

@Service
public class TeamServiceImpl implements TeamService {

	@Autowired
	private TeamRepository teamRepo;
	@Autowired
	private UserRepository userRepo;
	@Autowired
	private LeagueRepository leagueRepo;


	@Override
	public List<Team> index() {
		return teamRepo.findAll();
	}

	@Override
	public Team create(String username, Team newTeam, Integer leagueId) {
		User user = userRepo.findByUsername(username);
		League league = leagueRepo.queryById(leagueId);
		if (user != null && league != null) {			
			newTeam.setId(new TeamId(user.getId(), league.getId()));
			newTeam.setUser(user);
			newTeam.setLeague(league);
			return teamRepo.saveAndFlush(newTeam);
		}
		return null;
	}


	@Override
	public List<Team> index(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}
