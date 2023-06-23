import { Team } from './team';
import { Athlete } from './athlete';
import { SportEvent } from './sport-event';
export class AthleteEvent {
  athleteEventId: number;
  teams: Team[];
  sportEvent: SportEvent | null;
  athlete: Athlete | null;
  finishResult: number;
  remarks: string;
  enabled: boolean;

  constructor(
    athleteEventId: number = 0,
    teams: Team[] = [],
    sportEvent: SportEvent | null = null,
    athlete: Athlete | null = null,
    finishResult: number = 0,
    remarks: string = '',
    enabled: boolean = false
  ) {
    this.athleteEventId = athleteEventId;
    this.teams = teams;
    this.sportEvent = sportEvent;
    this.athlete = athlete;
    this.finishResult = finishResult;
    this.remarks = remarks;
    this.enabled = enabled;
  }
}
