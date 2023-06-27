package com.skilldistillery.leagueolympia.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "athlete_event")
public class AthleteEvent {

	@EmbeddedId
	private AthleteEventId athleteEventId;
	
	@JsonIgnore
	@ManyToMany(
			mappedBy="athleteEvents"
			)
	private List<Team> teams;
	
	@ManyToOne
	@JoinColumn(name="sport_event_id")
	@MapsId(value="sportEventId")
	private SportEvent sportEvent;
	
	@ManyToOne
	@JoinColumn(name="athlete_id")
	@MapsId(value="athleteId")
	private Athlete athlete;
	
	@Column(name="finish_result")
	private Integer finishResult;

	private String remarks;
	private boolean enabled;
	
	public AthleteEvent() {
		super();
	}


	public List<Team> getTeams() {
		return teams;
	}


	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}


	public SportEvent getSportEvent() {
		return sportEvent;
	}


	public void setSportEvent(SportEvent sportEvent) {
		this.sportEvent = sportEvent;
	}


	public Athlete getAthlete() {
		return athlete;
	}


	public void setAthlete(Athlete athlete) {
		this.athlete = athlete;
	}


	public Integer getFinishResult() {
		return finishResult;
	}
	
	public void setFinishResult(Integer place) {
		this.finishResult = place;
	}
	
	public String getRemarks() {
		return remarks;
	}
	
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public boolean isEnabled() {
		return enabled;
	}
	
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public AthleteEventId getAthleteEventId() {
		return athleteEventId;
	}


	public void setAthleteEventId(AthleteEventId athleteEventId) {
		this.athleteEventId = athleteEventId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(athleteEventId);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AthleteEvent other = (AthleteEvent) obj;
		return Objects.equals(athleteEventId, other.athleteEventId);
	}


	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AthleteEvent [athleteEventId=").append(athleteEventId).append(", sportEvent=")
				.append(sportEvent).append(", athlete=").append(athlete).append(", finishResult=").append(finishResult)
				.append(", remarks=").append(remarks).append(", enabled=").append(enabled).append("]");
		return builder.toString();
	}

	public void addTeam(Team team) {
		if(teams == null) teams = new ArrayList <>();
		if(!teams.contains(team)) {
			teams.add(team);
			team.addAthleteEvent(this);
		}
	}
	public void removeTeam(Team team) {
		if(teams != null && teams.contains(team)) {
			teams.remove(team);
			team.removeAthleteEvent(this);
		}
	}

	
}
