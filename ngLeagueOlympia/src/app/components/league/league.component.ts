import { SportEventService } from 'src/app/services/sport-event.service';
import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { League } from 'src/app/models/league';
import { SportEvent } from 'src/app/models/sport-event';
import { AuthService } from 'src/app/services/auth.service';
import { LeagueService } from 'src/app/services/league.service';

@Component({
  selector: 'app-league',
  templateUrl: './league.component.html',
  styleUrls: ['./league.component.css'],
})
export class LeagueComponent implements OnInit {
  newLeague: League = new League();
  allSportEvents: SportEvent[] = [];

  constructor(
    private leagueService: LeagueService,
    private sportEventService: SportEventService,
    private router: Router,
    private route: ActivatedRoute,
    private auth: AuthService
  ) {}

  ngOnInit(): void {
    this.listEvents();
  }

  listEvents() {
    this.sportEventService.index().subscribe({
      next: (eventList) => {
        this.allSportEvents = eventList;
      },
      error: (err) => {
        console.error(err);
      },
    });
  }

  selectSportEvent(sportEventId: number | undefined) {
    console.log(sportEventId);
  }

  createALeague(newLeague: League) {
    console.log(newLeague.sportEvents);
    let username: string;
    if (this.newLeague) {
      this.leagueService.create(newLeague).subscribe({
        next: (createdLeague) => {
          this.newLeague = new League();
          // this.router.navigateByUrl('/leagues/' + username);
          this.listEvents();
        },
        error: (createError) => {
          console.error(
            'LeagueListComponent.createLeague(): error creating League'
          );
          console.error(createError);
        },
      });
    }
  }

  updateLeague(league: League): void {
    this.leagueService.update(league).subscribe({
      next: (updatedLeague) => {
        this.newLeague = updatedLeague;
      },
      error: (updateError) => {
        console.error('LeagueComponenet.updateLeague(): error on update');
        console.error(updateError);
      },
    });
  }

  addSportEvent(leagueId: number, newSportEventId: number) {
    console.log("LeagueID: " + leagueId);
    console.log("SportEventID: " + newSportEventId);

    if(typeof leagueId === 'number' && typeof newSportEventId === 'number'){
      if (this.newLeague){
        for (let existingSportEvent of this.newLeague.sportEvents){
          if (existingSportEvent.id === newSportEventId) {
            console.log("found existing sportEvent");
            // this.swapSportEvent(leagueId, newSportEventId, existingSportEvent.id);
            return;
          }
        }
        this.addNewSportEvent(leagueId, newSportEventId);
      }

    }
  }

  addNewSportEvent(leagueId: number, newSportEventId: number){
    this.leagueService.updateLeagueSportEvents(leagueId, newSportEventId).subscribe({
      next: (updatedTeam) => {
        this.listEvents();
      },
      error: (updateError) => {
        console.error('TeamComponenet.updateTeamRoster(): error on update');
        console.error(updateError);

      }
    });
  }

  // swapSportEvent(leagueId: number, newSportEventId: number, oldSportEventId: number){
  //   this.leagueService.swapSportEvents(leagueId, newSportEventId, oldSportEventId).subscribe({
  //     next: (updatedTeam) => {
  //       this.listEvents();
  //     },
  //     error: (updateError) => {
  //       console.error('TeamComponenet.updateTeamRoster(): error on update');
  //       console.error(updateError);

  //     }
  //   });
  // }


}
