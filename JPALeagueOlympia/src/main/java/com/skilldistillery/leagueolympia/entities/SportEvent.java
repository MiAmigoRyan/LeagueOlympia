package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "sport_event")
public class SportEvent {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String venue;
	
	@OneToMany(mappedBy="sportEvent")
	private List<SportEventComment> comments;
	
	@ManyToOne
	@JoinColumn(name="olympiad_id")
	private Olympiad olympiad;
	
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(
			name="league_has_sport_event",
			joinColumns = @JoinColumn(name="sport_event_id"),
			inverseJoinColumns = @JoinColumn(name="league_id")
			)
	private List<League> leagues;
	
	@JsonIgnore
	@OneToMany(mappedBy="sportEvent")
	private List<AthleteEvent> athleteEvents;
	
	
	@Column(name = "location_latitude")
	private String locationLatitude;
	
	@Column(name = "location_longitude")
	private String locationLongitude;

	@ManyToOne
	@JoinColumn(name = "sport_id")
	private Sport sport;

	private boolean completed;
	
	@Column(name = "event_completion_date")
	private LocalDate eventCompletionDate;
	
	public SportEvent() {
		super();
	}
	
	public List<SportEventComment> getComments() {
		return comments;
	}

	public void setComments(List<SportEventComment> comment) {
		this.comments = comment;
	}

	public Olympiad getOlympiad() {
		return olympiad;
	}

	public void setOlympiad(Olympiad olympiad) {
		this.olympiad = olympiad;
	}

	public List<League> getLeagues() {
		return leagues;
	}
	
	public void setLeagues(List<League> leagues) {
		this.leagues = leagues;
	}

	public List<AthleteEvent> getAthleteEvents() {
		return athleteEvents;
	}


	public void setAthleteEvents(List<AthleteEvent> athleteEvents) {
		this.athleteEvents = athleteEvents;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVenue() {
		return venue;
	}

	public void setVenue(String venue) {
		this.venue = venue;
	}

	public String getLocationLatitude() {
		return locationLatitude;
	}

	public void setLocationLatitude(String locationLatitude) {
		this.locationLatitude = locationLatitude;
	}

	public String getLocationLongitude() {
		return locationLongitude;
	}

	public void setLocationLongitude(String locationLongitude) {
		this.locationLongitude = locationLongitude;
	}

	public Sport getSport() {
		return sport;
	}

	public void setSport(Sport sport) {
		this.sport = sport;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}

	public LocalDate getEventCompletionDate() {
		return eventCompletionDate;
	}

	public void setEventCompletionDate(LocalDate eventCompletionDate) {
		this.eventCompletionDate = eventCompletionDate;
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
		SportEvent other = (SportEvent) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SportEvent [id=");
		builder.append(id);
		builder.append(", venue=");
		builder.append(venue);
		builder.append(", locationLatitude=");
		builder.append(locationLatitude);
		builder.append(", locationLongitude=");
		builder.append(locationLongitude);
		builder.append(", completed=");
		builder.append(completed);
		builder.append(", eventCompletionDate=");
		builder.append(eventCompletionDate);
		builder.append("]");
		return builder.toString();
	}
	
}
