import { League } from './league';
import { User } from './user';
export class LeagueComment {
  id: number;
  league: League | null;
  reply: LeagueComment | null;
  replies: LeagueComment[];
  user: User | null;
  commentText: string;
  datePosted: string | null;

  constructor(
    id: number = 0,
    league: League | null = null,
    reply: LeagueComment | null = null,
    replies: LeagueComment[] = [],
    user: User | null = null,
    commentText: string = '',
    datePosted: string = ''
  ){
    this.id = id;
    this.league = league;
    this.reply = reply;
    this.replies = replies;
    this.user = user;
    this.commentText = commentText;
    this.datePosted = datePosted;
  }
}
