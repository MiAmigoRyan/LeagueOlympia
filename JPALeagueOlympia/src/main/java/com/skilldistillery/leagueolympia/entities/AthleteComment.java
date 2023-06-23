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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "athlete_comment")
public class AthleteComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name = "reply_to_id")
	private AthleteComment reply;

	@OneToMany (mappedBy ="reply")
	private List<AthleteComment> replies;
	
	@ManyToOne
	@JoinColumn(name="athlete_id")
	private Athlete athlete;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name ="comment_text")
	private String comment;
	
	@Column(name="date_posted")
	@CreationTimestamp
	private LocalDateTime createdAt;
	

	public AthleteComment() {
		super();
	}
	

	public AthleteComment getReply() {
		return reply;
	}



	public void setReply(AthleteComment reply) {
		this.reply = reply;
	}



	public List<AthleteComment> getReplies() {
		return replies;
	}



	public void setReplies(List<AthleteComment> replies) {
		this.replies = replies;
	}



	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}



	public Athlete getAthlete() {
		return athlete;
	}

	public void setAthlete(Athlete athlete) {
		this.athlete = athlete;
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
		AthleteComment other = (AthleteComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AthleteComment [id=").append(id).append(", user=").append(user).append(", comment=")
				.append(comment).append(", createdAt=").append(createdAt).append(", replyId=")
				.append("]");
		return builder.toString();
	}

	


	
	
	
}
