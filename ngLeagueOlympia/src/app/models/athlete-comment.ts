import { User } from './user';
import { Athlete } from './athlete';
export class AthleteComment {
  id: number;
  reply: AthleteComment | null;
  replies: AthleteComment[];
  athlete: Athlete | null;
  user: User | null;
  comment: string;
  createdAt: string | null;

  constructor(
    id: number = 0,
    reply: AthleteComment | null = null,
    replies: AthleteComment[] = [],
    athlete: Athlete | null = null,
    user: User |  null = null,
    comment: string = '',
    createdAt: string = ''
  ){
    this.id = id;
    this.reply = reply;
    this.replies = replies;
    this.athlete = athlete;
    this.user = user;
    this.comment = comment;
    this.createdAt = createdAt;
  }
}
