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

@Entity
@Table(name = "sport_event_comment")
public class SportEventComment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="sport_event_id")
	private SportEvent sportEvent;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	@Column(name = "comment_text")
	private String commentText;
	
	@Column(name = "date_posted")
	private LocalDateTime datePosted;
	
	@ManyToOne
	@JoinColumn(name = "reply_to_id")
	private SportEventComment reply;
	
	@OneToMany (mappedBy ="reply")
	private List<SportEventComment> replies;

	public SportEventComment() {
		super();
	}	
	
	public SportEvent getSportEvent() {
		return sportEvent;
	}

	public void setSportEvent(SportEvent sportEvent) {
		this.sportEvent = sportEvent;
	}

	public List<SportEventComment> getReplies() {
		return replies;
	}

	public void setReplies(List<SportEventComment> replies) {
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

	public SportEventComment getReply() {
		return reply;
	}

	public void setReply(SportEventComment reply) {
		this.reply = reply;
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
		builder.append(", user=");
		builder.append(user);
		builder.append(", commentText=");
		builder.append(commentText);
		builder.append(", reply=");
		builder.append(reply);

		builder.append("]");
		return builder.toString();
	}
	
}
