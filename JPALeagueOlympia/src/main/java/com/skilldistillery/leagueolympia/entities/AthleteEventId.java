package com.skilldistillery.leagueolympia.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;

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
	

}
