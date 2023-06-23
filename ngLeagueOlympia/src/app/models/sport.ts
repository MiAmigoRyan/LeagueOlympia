import { SportEvent } from "./sport-event";

export class Sport {
  id: number;
  name: string;
  description: string;
  sportEvents: SportEvent[];
  pictureUrl: string;

  constructor(
    id: number = 0,
    name: string = '',
    description: string = '',
    sportEvents: SportEvent[] = [],
    pictureUrl: string = ''
  ) {
    this.id = id;
    this.name = name;
    this.description = description;
    this.sportEvents = sportEvents;
    this.pictureUrl = pictureUrl;
  }
}
