package com.skilldistillery.leagueolympia.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

@Embeddable
public class TeamId implements Serializable {

	
	private static final long serialVersionUID = 1L;
	
	@Column(name ="user_id")
	private int userId;
	
	@Column(name = "league_id")
	private int leagueId;

	public TeamId() {
		super();
	}
	public TeamId(int userId, int leagueId) {
		super();
		this.userId = userId;
		this.leagueId = leagueId;
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




	@Override
	public int hashCode() {
		return Objects.hash(leagueId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TeamId other = (TeamId) obj;
		return leagueId == other.leagueId && userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("TeamId [userId=").append(userId).append(", leagueId=").append(leagueId).append("]");
		return builder.toString();
	}

	
	
	
}
