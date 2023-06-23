import { Athlete } from "./athlete";
import { Olympiad } from "./olympiad";

export class Country {
  id: number;
  athletes: Athlete[];
  olympiads: Olympiad[];
  name: string;
  flag: string;
  about: string;

  constructor(
    id: number = 0,
    athletes: Athlete[] = [],
    olympiads: Olympiad[] = [],
    name: string = '',
    flag: string = '',
    about: string = ''
    ) {
      this.id = id;
      this.athletes = athletes;
      this.olympiads = olympiads;
      this.name = name;
      this.flag = flag;
      this.about = about;
  }
}
