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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "league_comment")
public class LeagueComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="league_id")
	private League league;
	
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name = "reply_to_id")
	private LeagueComment reply;
	
	@JsonIgnore
	@OneToMany(mappedBy= "reply")
	private List<LeagueComment> replies;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name = "comment_text")
	private String commentText;
	
	@Column(name = "date_posted")
	private LocalDateTime datePosted;

	public LeagueComment() {
		super();
	}
	
	public League getLeague() {
		return league;
	}

	public void setLeague(League league) {
		this.league = league;
	}

	public LeagueComment getReply() {
		return reply;
	}

	public void setReply(LeagueComment reply) {
		this.reply = reply;
	}

	public List<LeagueComment> getReplies() {
		return replies;
	}

	public void setReplies(List<LeagueComment> replies) {
		this.replies = replies;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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
		builder.append(", user=");
		builder.append(user);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append(", datePosted=");
		builder.append(datePosted);
		builder.append("]");
		return builder.toString();
	}
	
}
