import { AthleteEventService } from 'src/app/services/athlete-event.service';
import { TeamService } from 'src/app/services/team.service';
import { ActivatedRoute, Route, Router } from '@angular/router';
import { LeagueService } from '../../services/league.service';
import { Component, OnInit } from '@angular/core';
import { League } from 'src/app/models/league';
import { Team } from 'src/app/models/team';
import { SportEvent } from 'src/app/models/sport-event';
import { User } from 'src/app/models/user';
import { AthleteEvent } from 'src/app/models/athlete-event';


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
  newLeague: League = new League();
  athleteEvents: AthleteEvent[] = [];
  score: number = 0;

  constructor(
    private leagueService: LeagueService,
    private teamService: TeamService,
    private athleteEventService: AthleteEventService,
    private router: Router,
    private route: ActivatedRoute
  ) { }

  ngOnInit(): void {
    this.reload();
  }

  calculateTotalScore(team: Team): number {
    let result: number = 0;
    for (let index = 0; index < team.athleteEvents.length; index++) {
      result += team.athleteEvents[index].finishResult;
    }
    return result;
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
        this.reload();
      },
      error: (createError) => {
        console.error('LeagueListComponent.createTeam(): error creating team');
        console.error(createError);
      }
    });
  }

  startLeague(){
    this.router.navigateByUrl('/createLeague');
  }

  deleteLeague(id: number): void {
    this.leagueService.destroy(id).subscribe({
      next: () => {
        this.reload();
      },
      error: (errorDelete) => {
        console.error('LeagueListComponent.deleteLeague(): error deleting');
        console.error(errorDelete);
      }
    });
  }

  getLeagueTeam(user: User, leagueId: number): Team | undefined {
    let foundTeam = user.teams.find(t => {return t.id.leagueId == leagueId})
    return foundTeam;
  }



  log(team: Team ){
    console.log(team.user);
  }

  win(teams: Team[]): Team | undefined {
    let lowScore: number = 100000;
    let winner: Team | undefined;

    teams.forEach(team => {
      let score = this.calculateTotalScore(team);
      if (score <= lowScore) { lowScore = score; winner = team }
      console.log('Score' + score);
      console.log('lowScore' +lowScore);
    });
    console.log('Winner' + winner);
    return winner;
  }


}
