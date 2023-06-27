import { TeamService } from 'src/app/services/team.service';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { LeagueService } from '../../services/league.service';
import { Component, OnInit } from '@angular/core';
import { League } from 'src/app/models/league';
import { Team } from 'src/app/models/team';
import { SportEvent } from 'src/app/models/sport-event';


@Component({
  selector: 'app-league-list',
  templateUrl: './league-list.component.html',
  styleUrls: ['./league-list.component.css']
})
export class LeagueListComponent implements OnInit {
  title: string = 'ngLeague';
  leagues: League[] = [];
  selected: League | null = null;
  newTeam: Team = new Team();
  teams: Team[] = [];

  constructor(
    private leagueService: LeagueService,
    private teamService: TeamService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.reload();
  }

  reload():void {
  this.leagueService.index().subscribe({
    next: (leagueList) => {
      this.leagues = leagueList;
    },
    error: (err) => {
      console.error(err);
    }
  });
  }

  displayLeague(league: League) {
    this.selected = league;
    console.log(league.sportEvents);
    // this.showSports(this.sportEvents = league.sportEvents);
  }

  showSports(sport: SportEvent) {
    return sport.leagues;
  }

  displayAllLeagues() {
    this.selected = null;
  }

  createTeam(leagueId: number) {
    this.teamService.create(leagueId).subscribe({
      next: (createdTeam) => {
        this.newTeam = new Team();
        this.router.navigateByUrl('/teams/' + createdTeam.league!.id);
      },
      error: (createError) => {
        console.error('LeagueListComponent.createTeam(): error creating team');
        console.error(createError);
      }
    });

  }

}
