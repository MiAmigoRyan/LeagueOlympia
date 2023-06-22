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
public class League {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String leagueName;
	
	@Column(name="photo")
	private String photoUrl;
	
	@Column(name="bets_enabled")
	private boolean betEnabled;
	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="buy_in")
	private double buyIn;
	
	@Column(name="side_wager")
	private String sideWager;
	
	@Column(name = "created_at")
	 @CreationTimestamp
	 private LocalDateTime createdAt;

	 @Column(name = "updated_at")
	 @UpdateTimestamp
	 private LocalDateTime updatedAt;
	 
	 private boolean enabled;
	 
	 

	public League() {
		super();
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

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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
		return Objects.hash(betEnabled, buyIn, createdAt, enabled, id, leagueName, photoUrl, sideWager, updatedAt,
				userId);
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
				&& Objects.equals(sideWager, other.sideWager) && Objects.equals(updatedAt, other.updatedAt)
				&& userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("League [id=").append(id).append(", leagueName=").append(leagueName).append(", photoUrl=")
				.append(photoUrl).append(", betEnabled=").append(betEnabled).append(", userId=").append(userId)
				.append(", buyIn=").append(buyIn).append(", sideWager=").append(sideWager).append(", createdAt=")
				.append(createdAt).append(", updatedAt=").append(updatedAt).append(", enabled=").append(enabled)
				.append("]");
		return builder.toString();
	}
	 
	 
	 
	 
	 
}
