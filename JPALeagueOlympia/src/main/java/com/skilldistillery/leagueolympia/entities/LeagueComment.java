package com.skilldistillery.leagueolympia.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class LeagueComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "user_id")
	private int userId;
	
	@Column(name = "comment_text")
	private String commentText;
	
	@Column(name = "date_posted")
	private LocalDateTime datePosted;
	
	@Column(name = "league_id")
	private int leagueId;
	
	@Column(name = "reply_to_id")
	private int replyToId;

	public LeagueComment() {
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

	public int getLeagueId() {
		return leagueId;
	}

	public void setLeagueId(int leagueId) {
		this.leagueId = leagueId;
	}

	public int getReplyToId() {
		return replyToId;
	}

	public void setReplyToId(int replyToId) {
		this.replyToId = replyToId;
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
		LeagueComment other = (LeagueComment) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LeagueComment [id=");
		builder.append(id);
		builder.append(", userId=");
		builder.append(userId);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append(", datePosted=");
		builder.append(datePosted);
		builder.append(", leagueId=");
		builder.append(leagueId);
		builder.append(", replyToId=");
		builder.append(replyToId);
		builder.append("]");
		return builder.toString();
	}
	
}
