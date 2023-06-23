import { LeagueComment } from './league-comment';
import { SportEvent } from './sport-event';
import { Team } from './team';
import { User } from './user';
export class League {
  id: number;
  comissioner: User | null;
  comments: LeagueComment[];
  sportEvents: SportEvent[];
  usersBoughtIn: User[];
  teams: Team[];
  leagueName: string;
  photoUrl: string;
  betEnabled: boolean;
  buyIn: number;
  sideWager: string;
  createdAt: string | null;
  updatedAt: string | null;
  enabled: boolean;

  constructor(
    id: number = 0,
    comissioner: User | null = null,
    comments: LeagueComment[] = [],
    sportEvents: SportEvent[] = [],
    usersBoughtIn: User[] = [],
    teams: Team[] = [],
    leagueName: string = '',
    photoUrl: string = '',
    betEnabled: boolean = false,
    buyIn: number = 0,
    sideWager: string = '',
    createdAt: string = '',
    updatedAt: string = '',
    enabled: boolean = false,
  ){
    this.id = id;
    this.comissioner = comissioner;
    this.comments = comments;
    this.sportEvents = sportEvents;
    this.usersBoughtIn = usersBoughtIn;
    this.teams = teams;
    this.leagueName = leagueName;
    this.photoUrl = photoUrl;
    this.betEnabled = betEnabled;
    this.buyIn = buyIn;
    this.sideWager = sideWager;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
    this.enabled = enabled;
  }
}
