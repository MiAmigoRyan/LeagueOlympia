package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
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
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String password;
	private boolean enabled;
	private String role;
	private String photo;
	
	@JsonIgnoreProperties({"comissioner", "usersBoughtIn", "comments"})
	@OneToMany(mappedBy="comissioner")
	private List<League> leagues;
	
	
	@JsonIgnore
	@OneToMany(mappedBy= "user")
	private List<SportEventComment> sportEventComments;

	@JsonIgnore
	@OneToMany(mappedBy= "user")
	private List<LeagueComment> leagueComments;
	
	@JsonIgnoreProperties({"user"})
	@OneToMany(mappedBy="user")
	private List<Team> teams;
	
	@JsonIgnore
	@OneToMany(mappedBy="user")
	private List<AthleteComment> athleteComments;
	
	
	@JsonIgnore
	@ManyToMany
	@JoinTable(
			name = "user_has_bought_in",
			joinColumns = @JoinColumn (name="user_id"),
			inverseJoinColumns = @JoinColumn(name="league_id")
			)
	private List<League> boughtInLeagues;
	
	@Column(name = "about_me")
	private String aboutMe;
	
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "created_date")
	@CreationTimestamp
	private LocalDateTime createdDate;

	@Column(name = "updated_date")
	@UpdateTimestamp
	private LocalDateTime updatedDate;

	public User() {
		super();
	}

	
	public List<League> getLeagues() {
		return leagues;
	}


	public void setLeagues(List<League> leagues) {
		this.leagues = leagues;
	}


	public List<SportEventComment> getSportEventComments() {
		return sportEventComments;
	}


	public void setSportEventComments(List<SportEventComment> sportEventComments) {
		this.sportEventComments = sportEventComments;
	}


	public List<LeagueComment> getLeagueComments() {
		return leagueComments;
	}


	public void setLeagueComments(List<LeagueComment> leagueComments) {
		this.leagueComments = leagueComments;
	}


	public List<AthleteComment> getAthleteComments() {
		return athleteComments;
	}


	public void setAthleteComments(List<AthleteComment> athleteComments) {
		this.athleteComments = athleteComments;
	}


	public List<League> getBoughtInLeagues() {
		return boughtInLeagues;
	}


	public void setBoughtInLeagues(List<League> boughtInLeagues) {
		this.boughtInLeagues = boughtInLeagues;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

	public LocalDateTime getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(LocalDateTime updatedDate) {
		this.updatedDate = updatedDate;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("User [id=");
		builder.append(id);
		builder.append(", username=");
		builder.append(username);
		builder.append(", password=");
		builder.append(password);
		builder.append(", enabled=");
		builder.append(enabled);
		builder.append(", role=");
		builder.append(role);
		builder.append(", photo=");
		builder.append(photo);
		builder.append(", aboutMe=");
		builder.append(aboutMe);
		builder.append(", firstName=");
		builder.append(firstName);
		builder.append(", lastName=");
		builder.append(lastName);
		builder.append(", createdDate=");
		builder.append(createdDate);
		builder.append(", updatedDate=");
		builder.append(updatedDate);
		builder.append("]");
		return builder.toString();
	}

}
