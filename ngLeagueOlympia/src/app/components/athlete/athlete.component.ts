import { DatePipe } from '@angular/common';
import { AthleteEvent } from './../../models/athlete-event';
import { AthleteEventService } from 'src/app/services/athlete-event.service';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Athlete } from 'src/app/models/athlete';
import { AthleteService } from 'src/app/services/athlete.service';

@Component({
  selector: 'app-athlete',
  templateUrl: './athlete.component.html',
  styleUrls: ['./athlete.component.css']
})
export class AthleteComponent implements OnInit {
  athletes: Athlete[] = [];
  athleteEvents: AthleteEvent[] = [];
  selected: Athlete | null = null;

  constructor(
    private athleteService: AthleteService,
    private athleteEventService: AthleteEventService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.reload();
  }

  reload():void {
  this.athleteService.index().subscribe({
    next: (athleteList) => {
      this.athletes = athleteList;
    },
    error: (err) => {
      console.error(err);
    }
  });
  }

  displayAthlete(athlete: Athlete) {
    this.selected = athlete;
  }

  displayAllLeagues() {
    this.selected = null;
  }
}
