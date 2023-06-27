package com.skilldistillery.leagueolympia.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;
import com.skilldistillery.leagueolympia.entities.AthleteEventId;
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
	public Team update(Team team,  Integer leagueId,String username) {
		Team managedTeam = teamRepo.findByUser_UsernameAndLeagueId(username, leagueId);
		if(managedTeam != null) {
			managedTeam.setAthleteEvents(team.getAthleteEvents());
			managedTeam.setDescription(team.getDescription());
			managedTeam.setPhotoURL(team.getPhotoURL());
			managedTeam.setTeamName(team.getTeamName());
			managedTeam.setLeague(team.getLeague());
			
			return teamRepo.saveAndFlush(managedTeam);
		}else {
			return null;
		}
		
	}
	

//	@Override
//	public Team removeTeam(String username, Integer leagueId) {
//		Team teamRemoved = teamRepo.findByUser_UsernameAndLeagueId(username, leagueId);
//		if(teamRemoved!=null) {
//			teamRemoved.setEnabled(!teamRemoved.isEnabled());		
//		}
//		return teamRemoved;
//	}

	@Override
	public List<Team> index(String username) {
		
		List<Team> usersTeams = teamRepo.findByUser_Username(username);
		
		return usersTeams;
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
		AthleteEvent event = athleteEventRepo.findByAthleteIdAndSportEvent_Id(athleteId, sportEventId);
		//add athleve to team
		if(team !=null && event != null) {
			//add and remove from team entity
			team.addAthleteEvent(event);
		return teamRepo.saveAndFlush(team);
		}
		
		return null;
	}

	@Override
	public Team removeAthleteEventFromTeam(
			String username, 
			TeamId teamId, 
			AthleteEventId athleteEventId) {
		
		Team team = teamRepo.findByUser_UsernameAndId(username, teamId);
		AthleteEvent athleteEvent = athleteEventRepo.findByAthleteEventIdAndTeams_Id
				(athleteEventId, team.getId());
		
		team.removeAthleteEvent(athleteEvent);
		athleteEvent.removeTeam(team);
		
		return teamRepo.saveAndFlush(team);
	}


}
