package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "sport_event_comment")
public class SportEventComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "comment_text")
	private String commentText;
	
	@Column(name = "date_posted")
	private LocalDateTime datePosted;
	
	@Column(name = "reply_to_id")
	private int replyToId;
	
	@Column(name = "sport_event_id")
	private int sportEventId;

	public SportEventComment() {
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

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
	}

	public LocalDateTime getDatePosted() {
		return datePosted;
	}

	public void setDatePosted(LocalDateTime datePosted) {
		this.datePosted = datePosted;
	}

	public int getReplyToId() {
		return replyToId;
	}

	public void setReplyToId(int replyToId) {
		this.replyToId = replyToId;
	}

	public int getSportEventId() {
		return sportEventId;
	}

	public void setSportEventId(int sportEventId) {
		this.sportEventId = sportEventId;
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
		SportEventComment other = (SportEventComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("SportEventComment [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append(", replyToId=");
		builder.append(replyToId);
		builder.append(", sportEventId=");
		builder.append(sportEventId);
		builder.append("]");
		return builder.toString();
	}
	
}
