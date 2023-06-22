package com.skilldistillery.leagueolympia.entities;

import java.util.Objects;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "athlete_event")
public class AthleteEvent {

	@EmbeddedId
	private AthleteEventId athleteEventId;
	
	private int place;
	private String remarks;
	private boolean enabled;
	
	public AthleteEvent() {
		super();
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
		builder.append("AthleteEvent [athleteEventId=").append(athleteEventId).append(", place=").append(place)
				.append(", remarks=").append(remarks).append(", enabled=").append(enabled).append("]");
		return builder.toString();
	}

	
}
