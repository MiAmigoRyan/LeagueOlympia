import { AthleteEvent } from "./athlete-event";
import { League } from "./league";
import { Olympiad } from "./olympiad";
import { Sport } from "./sport";
import { SportEventComment } from "./sport-event-comment";

export class SportEvent {
  id: number;
  venue: string;
  comments: SportEventComment[];
  olympiad: Olympiad | null;
  leagues: League[];
  athleteEvents: AthleteEvent[];
  locationLatitude: string;
  locationLongitude: string;
  sport: Sport | null;
  completed: boolean;
  eventCompletionDate: string | null;

  constructor(
    id: number = 0,
    venue: string = '',
    comments: SportEventComment[] = [],
    olympiad: Olympiad | null = null,
    leagues: League[] = [],
    athleteEvents: AthleteEvent[] = [],
    locationLatitude: string = '',
    locationLongitude: string = '',
    sport: Sport | null = null,
    completed: boolean = false,
    eventCompletionDate: string = ''
  ){
    this.id = id;
    this.venue = venue;
    this.comments = comments;
    this.olympiad = olympiad;
    this.leagues = leagues;
    this.athleteEvents = athleteEvents;
    this.locationLatitude = locationLatitude;
    this.locationLongitude = locationLongitude;
    this.sport = sport;
    this.completed = completed;
    this.eventCompletionDate = eventCompletionDate;
  }
}
