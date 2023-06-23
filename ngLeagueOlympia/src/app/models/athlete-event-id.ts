import { AthleteEvent } from './athlete-event';
export class AthleteEventId {
  athleteId: number;
  sportEventId: number;

  constructor(
    athleteId: number = 0,
    sportEventId: number = 0
  ){
    this.athleteId = athleteId;
    this.sportEventId = sportEventId
  }
}
