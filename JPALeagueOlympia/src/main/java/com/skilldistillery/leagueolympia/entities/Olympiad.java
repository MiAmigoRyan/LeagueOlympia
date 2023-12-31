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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class Olympiad {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private int year;
	
	@OneToMany(mappedBy="olympiad")
	private List<SportEvent> sportevents;
	
	@ManyToOne
	@JoinColumn(name="country_id")
	private Country country;

	@Column(name = "opening_date")
	private LocalDate openingDate;

	@Column(name = "closing_date")
	private LocalDate closingDate;
	private String logo;
	
	@Column(name = "host_city")
	private String hostCity;
	
	@ManyToOne
	@JoinColumn(name = "category_id")
	private OlympiadCategory olympiadCategory;
	
	@Column(name = "website_url")
	private String websiteUrl;

	public Olympiad() {
		super();
	}

	public List<SportEvent> getSportevents() {
		return sportevents;
	}

	public void setSportevents(List<SportEvent> sportevents) {
		this.sportevents = sportevents;
	}

	public void setOlympiadCategory(OlympiadCategory olympiadCategory) {
		this.olympiadCategory = olympiadCategory;
	}



	public int getId() {
		return id;
	}
	
	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public LocalDate getOpeningDate() {
		return openingDate;
	}

	public void setOpeningDate(LocalDate openingDate) {
		this.openingDate = openingDate;
	}

	public LocalDate getClosingDate() {
		return closingDate;
	}

	public void setClosingDate(LocalDate closingDate) {
		this.closingDate = closingDate;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

	public String getHostCity() {
		return hostCity;
	}

	public void setHostCity(String hostCity) {
		this.hostCity = hostCity;
	}

	public OlympiadCategory getOlympiadCategory() {
		return olympiadCategory;
	}

	public void setCategoryId(OlympiadCategory olympiadCategory) {
		this.olympiadCategory = olympiadCategory;
	}

	public String getWebsiteUrl() {
		return websiteUrl;
	}

	public void setWebsiteUrl(String websiteUrl) {
		this.websiteUrl = websiteUrl;
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
		Olympiad other = (Olympiad) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Olympiad [id=");
		builder.append(id);
		builder.append(", title=");
		builder.append(title);
		builder.append(", year=");
		builder.append(year);
		builder.append(", openingDate=");
		builder.append(openingDate);
		builder.append(", closingDate=");
		builder.append(closingDate);
		builder.append(", logo=");
		builder.append(logo);
		builder.append(", hostCity=");
		builder.append(hostCity);
		builder.append(", websiteUrl=");
		builder.append(websiteUrl);
		builder.append("]");
		return builder.toString();
	}
	
}
