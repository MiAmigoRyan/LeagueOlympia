import { SportEvent } from "./sport-event";
import { User } from "./user";

export class SportEventComment {
  id: number;
  sportEvent: SportEvent | null;
  user: User | null;
  commentText: string;
  datePosted: string | null;
  replies: SportEventComment[];
  reply: SportEventComment | null;

  constructor(
    id: number = 0,
    sportEvent: SportEvent | null = null,
    user: User | null = null,
    commentText: string = '',
    datePosted: string = '',
    replies: SportEventComment[] = [],
    reply: SportEventComment | null = null
  ) {
    this.id = id;
    this.sportEvent = sportEvent;
    this.user = user;
    this.commentText = commentText;
    this.datePosted = datePosted;
    this.replies = replies;
    this.reply = reply;
  }
}
