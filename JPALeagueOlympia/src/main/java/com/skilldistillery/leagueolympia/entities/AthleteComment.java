package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class AthleteComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name ="comment_text")
	private String comment;
	
	@Column(name="date_posted")
	@CreationTimestamp
	private LocalDateTime createdAt;
	
	@Column(name="reply_to_id")
	private int replyId;
	
	@Column(name="athlete_id")
	private int athleteId;

	public AthleteComment() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
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

	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public int getAthleteId() {
		return athleteId;
	}

	public void setAthleteId(int athleteId) {
		this.athleteId = athleteId;
	}

	@Override
	public int hashCode() {
		return Objects.hash(athleteId, comment, createdAt, id, replyId, userId);
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
		return athleteId == other.athleteId && Objects.equals(comment, other.comment)
				&& Objects.equals(createdAt, other.createdAt) && id == other.id && replyId == other.replyId
				&& userId == other.userId;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("AthleteComment [id=").append(id).append(", userId=").append(userId).append(", comment=")
				.append(comment).append(", createdAt=").append(createdAt).append(", replyId=").append(replyId)
				.append(", athleteId=").append(athleteId).append("]");
		return builder.toString();
	}
	
	
	
}
