import { Olympiad } from './olympiad';
export class OlympiadCategory {
  id: number;
  olympiad: Olympiad | null;
  name: string;
  description: string;

  constructor(
    id: number = 0,
    olympiad: Olympiad | null = null,
    name: string = '',
    description: string = ''
  ) {
    this.id = id;
    this.olympiad = olympiad;
    this.name = name;
    this.description = description;
  }
}
