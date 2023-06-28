import { AthleteEvent } from './athlete-event';
import { Country } from './country';
import { AthleteComment } from './athlete-comment';
export class Athlete {
  id: number;
  athleteComments: AthleteComment[];
  country: Country;
  athleteEvents: AthleteEvent[];
  fname: string;
  lname: string;
  photoURL: string;
  dateOfBirth: Date | null;
  socialMediaURL: string;


  constructor(
    id: number = 0,
    athleteComments: AthleteComment[] = [],
    country: Country,
    athleteEvents: AthleteEvent[] = [],
    fname: string = '',
    lname: string = '',
    photoURL: string = '',
    dateOfBirth: Date | null = null,
    socialMediaURL = ''
  ) {
    this.id = id;
    this.athleteComments = athleteComments;
    this.country = country;
    this.athleteEvents = athleteEvents;
    this.fname = fname;
    this.lname = lname;
    this.photoURL = photoURL;
    this.dateOfBirth = dateOfBirth;
    this.socialMediaURL = socialMediaURL;
  }
}
