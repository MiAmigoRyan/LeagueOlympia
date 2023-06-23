package com.skilldistillery.leagueolympia.entities;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Embeddable;

//THIS CLASS IS A COMPOSITE KEY AKA VIRTUAL TABLE : IT 
//ALLOWS FOR THE RELATIONSHIP 

@Embeddable
public class AthleteEventId implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name="athlete_id")
	private int athleteId;
	
	@Column(name="sport_event_id")
	private int sportEventId;

	public AthleteEventId() {
		super();
	}
	
	public AthleteEventId(int athleteId, int sportEventId) {
		super();
		this.athleteId = athleteId;
		this.sportEventId = sportEventId;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
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
		AthleteEventId other = (AthleteEventId) obj;
		return athleteId == other.athleteId && sportEventId == other.sportEventId;
	}
	

}
