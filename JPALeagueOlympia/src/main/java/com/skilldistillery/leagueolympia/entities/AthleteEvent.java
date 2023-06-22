package com.skilldistillery.leagueolympia.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Table;

@Embeddable
@Table(name = "athlete_event")
public class AthleteEvent implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "athlete_id")
	private int athleteId;
	
	@Column(name = "sport_event_id")
	private int sportEventId;	

	private int place;
	private String remarks;
	private boolean enabled;
	
	public AthleteEvent() {
		super();
	}

	public int getAthleteId() {
		return athleteId;
	}

	public void setAthleteId(int athleteId) {
		this.athleteId = athleteId;
	}

	public int getSportEventId() {
		return sportEventId;
	}

	public void setSportEventId(int sportEventId) {
		this.sportEventId = sportEventId;
	}

	public int getPlace() {
		return place;
	}
	
	public void setPlace(int place) {
		this.place = place;
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
	
	@Override
	public int hashCode() {
		return Objects.hash(athleteId, sportEventId);
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
		return athleteId == other.athleteId && sportEventId == other.sportEventId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AthleteEvent [athleteId=");
		builder.append(athleteId);
		builder.append(", sportEventId=");
		builder.append(sportEventId);
		builder.append(", place=");
		builder.append(place);
		builder.append(", remarks=");
		builder.append(remarks);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append("]");
		return builder.toString();
	}
	
}
