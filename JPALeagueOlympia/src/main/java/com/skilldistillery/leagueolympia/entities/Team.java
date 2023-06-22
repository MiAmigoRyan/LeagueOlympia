package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
public class Team {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name ="user_id")
	private int userId;
	
	@Column(name = "league_id")
	private int leagueId;
	
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
	 
	public Team() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
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
		return Objects.hash(createdAt, description, enabled, id, leagueId, photoURL, teamName, updatedAt, userId);
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
		return Objects.equals(createdAt, other.createdAt) && Objects.equals(description, other.description)
				&& enabled == other.enabled && id == other.id && leagueId == other.leagueId
				&& Objects.equals(photoURL, other.photoURL) && Objects.equals(teamName, other.teamName)
				&& Objects.equals(updatedAt, other.updatedAt) && userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Team [id=").append(id).append(", userId=").append(userId).append(", leagueId=").append(leagueId)
				.append(", teamName=").append(teamName).append(", photoURL=").append(photoURL).append(", description=")
				.append(description).append(", createdAt=").append(createdAt).append(", updatedAt=").append(updatedAt)
				.append(", enabled=").append(enabled).append("]");
		return builder.toString();
	}
	 
	 
}
