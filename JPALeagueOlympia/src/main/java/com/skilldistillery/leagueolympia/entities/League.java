package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class League { 

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnoreProperties({"sportEventComments", "leagueComments", "teams", "athleteComments", "leagues", "id", 
		"password", "enabled", "role", "photoUrl", "aboutMe", "firstName", "lastName", "createdDate", "updatedDate"})
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User comissioner;
	
	@OneToMany(mappedBy = "league")
	private List<LeagueComment> comments;

	@ManyToMany(mappedBy = "leagues")
	private List<SportEvent> sportEvents;

	@ManyToMany(mappedBy = "boughtInLeagues")
	private List<User> usersBoughtIn;

	@JsonIgnoreProperties({"league", "user"})
	@OneToMany(mappedBy = "league")
	private List<Team> teams;

	@Column(name = "name")
	private String leagueName;

	@Column(name = "photo")
	private String photoUrl;
	
	@Column(name = "bets_enabled")
	private boolean betEnabled;

	@Column(name = "buy_in")
	private double buyIn;

	
	@Column(name = "side_wager")
	private String sideWager;

	@Column(name = "created_date")
	@CreationTimestamp
	private LocalDateTime createdAt;

	@Column(name = "updated_date")
	@UpdateTimestamp
	private LocalDateTime updatedAt;

	private boolean enabled;

	public League() {
		super();
	}

	public User getComissioner() {
		return comissioner;
	}

	public void setComissioner(User comissioner) {
		this.comissioner = comissioner;
	}

	public List<LeagueComment> getComments() {
		return comments;
	}

	public void setComments(List<LeagueComment> comments) {
		this.comments = comments;
	}

	public List<SportEvent> getSportEvents() {
		return sportEvents;
	}

	public void setSportEvents(List<SportEvent> sportEvents) {
		this.sportEvents = sportEvents;
	}

	public List<User> getUsersBoughtIn() {
		return usersBoughtIn;
	}

	public void setUsersBoughtIn(List<User> usersBoughtIn) {
		this.usersBoughtIn = usersBoughtIn;
	}

	public List<Team> getTeams() {
		return teams;
	}

	public void setTeams(List<Team> teams) {
		this.teams = teams;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLeagueName() {
		return leagueName;
	}

	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}

	public String getPhotoUrl() {
		return photoUrl;
	}

	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}

	public boolean isBetEnabled() {
		return betEnabled;
	}

	public void setBetEnabled(boolean betEnabled) {
		this.betEnabled = betEnabled;
	}

	public double getBuyIn() {
		return buyIn;
	}

	public void setBuyIn(double buyIn) {
		this.buyIn = buyIn;
	}

	public String getSideWager() {
		return sideWager;
	}

	public void setSideWager(String sideWager) {
		this.sideWager = sideWager;
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
		return Objects.hash(betEnabled, buyIn, createdAt, enabled, id, leagueName, photoUrl, sideWager, updatedAt);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		League other = (League) obj;
		return betEnabled == other.betEnabled && Double.doubleToLongBits(buyIn) == Double.doubleToLongBits(other.buyIn)
				&& Objects.equals(createdAt, other.createdAt) && enabled == other.enabled && id == other.id
				&& Objects.equals(leagueName, other.leagueName) && Objects.equals(photoUrl, other.photoUrl)
				&& Objects.equals(sideWager, other.sideWager) && Objects.equals(updatedAt, other.updatedAt);
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("League [id=").append(id).append(", leagueName=").append(leagueName).append(", photoUrl=")
				.append(photoUrl).append(", betEnabled=").append(betEnabled).append(", buyIn=").append(buyIn)
				.append(", sideWager=").append(sideWager).append(", createdAt=").append(createdAt)
				.append(", updatedAt=").append(updatedAt).append(", enabled=").append(enabled).append("]");
		return builder.toString();
	}

	public void addBoughtInUser(User user) {
		if(usersBoughtIn == null) usersBoughtIn = new ArrayList<>();
		
		if(!usersBoughtIn.contains(user)){
			usersBoughtIn.add(user);
			user.addLeague(this);
		}
	}
	public void removeBoughtInUser(User user) {
		if(usersBoughtIn != null && usersBoughtIn.contains(user)) {
			usersBoughtIn.remove(user);
			user.removeLeague(this);
		}
	}
	
}
