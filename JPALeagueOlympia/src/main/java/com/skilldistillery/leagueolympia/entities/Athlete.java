package com.skilldistillery.leagueolympia.entities;

import java.util.Date;
import java.util.List;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@Entity
public class Athlete {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnore
	@OneToMany (mappedBy= "athlete")
	private List<AthleteComment> athleteComments;
	
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;
	
	@JsonIgnoreProperties("athlete")
	@OneToMany(mappedBy="athlete")
	private List<AthleteEvent> athleteEvents; 
	
	@Column(name = "first_name")
	private String fname;
	
	@Column(name = "last_name")
	private String lname;
	
	@Column(name ="photo")
	private String photoURL;
	
	@Column(name="date_of_birth")
	private Date dateOfBirth;

	
	@Column(name="social_media_url")
	private String socialMediaURL;

	public Athlete() {
		super();
	}

	
	
	public List<AthleteComment> getAthleteComments() {
		return athleteComments;
	}

	public void setAthleteComments(List<AthleteComment> athleteComments) {
		this.athleteComments = athleteComments;
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

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public Country getCountry() {
		return country;
	}


	public void setCountry(Country country) {
		this.country = country;
	}


	public String getPhotoURL() {
		return photoURL;
	}

	public void setPhotoURL(String photoURL) {
		this.photoURL = photoURL;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getSocialMediaURL() {
		return socialMediaURL;
	}

	public void setSocialMediaURL(String socialMediaURL) {
		this.socialMediaURL = socialMediaURL;
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
		Athlete other = (Athlete) obj;
		return id == other.id;
	}



	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Athlete [id=").append(id).append(", country=").append(country).append(", fname=").append(fname)
				.append(", lname=").append(lname).append(", photoURL=").append(photoURL).append(", dateOfBirth=")
				.append(dateOfBirth).append(", socialMediaURL=").append(socialMediaURL).append("]");
		return builder.toString();
	}



	
	
}
