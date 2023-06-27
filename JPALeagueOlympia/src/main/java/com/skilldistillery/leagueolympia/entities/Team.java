package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Team {
	
	@EmbeddedId
	private TeamId id;
	
	


	@Column(name = "name")
	private String teamName;
	
	@Column(name = "photo")
	private String photoURL;
	
	private String description;
	
	@Column(name = "created_date")
	 @CreationTimestamp
	 private LocalDateTime createdAt;

	 @Column(name = "updated_date")
	 @UpdateTimestamp
	 private LocalDateTime updatedAt;
	
	 private boolean enabled;
	 
	 @ManyToMany
	@JoinTable(
			name="team_has_athlete_event",
			joinColumns = {
						@JoinColumn(name="team_user_id",
								referencedColumnName = "user_id"),
						@JoinColumn(name="team_league_id",
								referencedColumnName = "league_id")
						},
			inverseJoinColumns = {
						@JoinColumn(name="athlete_event_athlete_id", 
									referencedColumnName = "athlete_id"),
						@JoinColumn(name="athlete_event_sport_id", 
									referencedColumnName = "sport_event_id")
			})
		private List<AthleteEvent> athleteEvents;
		
		@ManyToOne
		@JoinColumn(name="user_id")
		@MapsId(value="userId")
		private User user;
	 
		@JsonIgnoreProperties({"teams", "comments", "usersBoughtIn"})
		@ManyToOne
		@JoinColumn(name="league_id")
		@MapsId(value="leagueId")
		private League league;

		public Team() {
		super();
		id= new TeamId();
	}
		
	public List<AthleteEvent> getAthleteEvents() {
		return athleteEvents;
	}



	public void setAthleteEvents(List<AthleteEvent> athleteEvents) {
		this.athleteEvents = athleteEvents;
	}

	public League getLeague() {
		return league;
	}
	
	
	public void setLeague(League league) {
		this.league = league;
	}
	
	
	public User getUser() {
		return user;
	}
	
	
	public void setUser(User user) {
		this.user = user;
	}
	public TeamId getId() {
		return id;
	}
	
	public void setId(TeamId id) {
		this.id = id;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(LocalDateTime updatedAt) {
		this.updatedAt = updatedAt;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Team other = (Team) obj;
		return Objects.equals(id, other.id);
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Team [id=").append(id).append(", user=").append(user).append(", league=").append(league)
				.append(", teamName=").append(teamName).append(", photoURL=").append(photoURL).append(", description=")
				.append(description).append(", createdAt=").append(createdAt).append(", updatedAt=").append(updatedAt)
				.append(", enabled=").append(enabled).append("]");
		return builder.toString();
	}

	public void addAthleteEvent(AthleteEvent athleteEvent) {
		if(athleteEvents == null) athleteEvents  = new ArrayList<>();
		
		if(!athleteEvents.contains(athleteEvent)){
			athleteEvents.add(athleteEvent);
			athleteEvent.addTeam(this);
		}
	}
	public void removeAthleteEvent(AthleteEvent athleteEvent) {
		if(athleteEvents != null && athleteEvents.contains(athleteEvent)) {
			athleteEvents.remove(athleteEvent);
			athleteEvent.removeTeam(this);
		}
	}
	

}
