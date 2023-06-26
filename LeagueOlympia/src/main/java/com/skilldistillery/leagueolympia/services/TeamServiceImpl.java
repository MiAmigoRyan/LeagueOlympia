package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.entities.League;
import com.skilldistillery.leagueolympia.entities.SportEvent;
import com.skilldistillery.leagueolympia.entities.Team;
import com.skilldistillery.leagueolympia.entities.TeamId;
import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.repositories.AthleteEventRepository;
import com.skilldistillery.leagueolympia.repositories.LeagueRepository;
import com.skilldistillery.leagueolympia.repositories.SportEventRepository;
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
	@Autowired
	private SportEventRepository sportEventRepo;
	@Autowired
	private AthleteEventRepository athleteEventRepo;

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
	
	@Override
	public Team addAthlete(
			Integer athleteId, 
			Integer leagueId, 
			Integer sportEventId,
			String username) {
				
		//List<SportEvent> sportEvent = sportEventRepo.findByLeagues_Id(leagueId);
		//get team from team repo.
		Team team = teamRepo.findByUser_UsernameAndLeagueId(username, leagueId);
		//athlevnt from athEv by athleteID
		AthleteEvent event = athleteEventRepo.findByAthlete_IdAndSportEvent_Id(athleteId, sportEventId);
		//add athleve to team
		System.out.println("***************************"+team+"***************************");
		System.out.println("***************************"+username+ "::"+leagueId+"***************************");
		System.out.println("***************************"+event+"***************************");
		if(team !=null && event != null) {
			//add and remove from team entity
			team.addAthleteEvent(event);
		return teamRepo.saveAndFlush(team);
		}
		
		return null;
	}

}
