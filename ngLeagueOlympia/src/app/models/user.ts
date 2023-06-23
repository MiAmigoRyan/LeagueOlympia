import { AthleteComment } from './athlete-comment';
import { League } from "./league";
import { LeagueComment } from "./league-comment";
import { SportEventComment } from "./sport-event-comment";
import { Team } from './team';

export class User {

  id: number;
  username: string;
  password: string;
  enabled: boolean;
  role: string;
  leagues: League[];
  sportEventComments: SportEventComment[];
  leagueComments: LeagueComment[];
  teams: Team[];
  athleteComments: AthleteComment[];
  boughtInLeagues: League[];
  aboutMe: string;
  firstName: string;
  lastName: string;
  createdDate: string | null;
  updatedDate: string | null;

constructor(
  id: number = 0,
  username: string = '',
  password: string = '',
  enabled: boolean = false,
  role: string = '',
  leagues: League[] = [],
  sportEventComments: SportEventComment[] = [],
  leagueComments: LeagueComment[] = [],
  teams: Team[] = [],
  athleteComments: AthleteComment[] = [],
  boughtInLeagues: League[] = [],
  aboutMe: string = '',
  firstName: string = '',
  lastName: string = '',
  createdDate: string = '',
  updatedDate: string = ''
) {
  this.id = id;
  this.username = username;
  this.password = password;
  this.enabled = enabled;
  this.role = role;
  this.leagues = leagues;
  this.sportEventComments = sportEventComments;
  this.leagueComments = leagueComments;
  this.teams = teams;
  this.athleteComments = athleteComments;
  this.boughtInLeagues = boughtInLeagues;
  this.aboutMe = aboutMe;
  this.firstName = firstName;
  this.lastName = lastName;
  this.createdDate = createdDate;
  this.updatedDate = updatedDate;
}
}
