import { OlympiadCategory } from './olympiad-category';
import { Country } from './country';
import { SportEvent } from "./sport-event";

export class Olympiad {
  id: number;
  title: string;
  year: number;
  sportEvents: SportEvent[];
  country: Country | null;
  openingDate: string | null;
  closingDate: string | null;
  logo: string;
  hostCity: string;
  olympiadCategory: OlympiadCategory | null;
  websiteUrl: string;

  constructor (
    id: number = 0,
    title: string = '',
    year: number = 0,
    sportEvents: SportEvent[] = [],
    country: Country | null = null,
    openingDate: string = '',
    closingDate: string = '',
    logo: string = '',
    hostCity: string = '',
    olympiadCategory: OlympiadCategory | null = null,
    websiteUrl: string = ''
  ) {
    this.id = id;
    this.title = title;
    this.year = year;
    this.sportEvents = sportEvents;
    this.country = country;
    this.openingDate = openingDate;
    this.closingDate = closingDate;
    this.logo = logo;
    this.hostCity = hostCity;
    this.olympiadCategory = olympiadCategory;
    this.websiteUrl = websiteUrl;
  }
}
