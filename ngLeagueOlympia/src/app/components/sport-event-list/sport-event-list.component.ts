import { Component } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { SportEvent } from 'src/app/models/sport-event';
import { SportEventService } from 'src/app/services/sport-event.service';

@Component({
  selector: 'app-sport-event-list',
  templateUrl: './sport-event-list.component.html',
  styleUrls: ['./sport-event-list.component.css']
})
export class SportEventListComponent {
  title: string = 'ngSportEvent';
  sportEvents: SportEvent[] = [];
  selected: SportEvent | null = null;

  constructor(
    private sportEventService: SportEventService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.reload();
  }

  reload():void {
  this.sportEventService.index().subscribe({
    next: (sportEventList) => {
      this.sportEvents = sportEventList;
    },
    error: (err) => {
      console.error(err);
    }
  });
  }

  displaySportEvent(sportEvent: SportEvent) {
    this.selected = sportEvent;
  }

  displayAllSportEvents() {
    this.selected = null;
  }
}
