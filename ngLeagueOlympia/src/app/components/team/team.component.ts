import { AthleteEvent } from './../../models/athlete-event';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

import { Team } from 'src/app/models/team';
import { User } from 'src/app/models/user';
import { AthleteEventService } from 'src/app/services/athlete-event.service';
import { AuthService } from 'src/app/services/auth.service';
import { LeagueService } from 'src/app/services/league.service';
import { TeamService } from 'src/app/services/team.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-team',
  templateUrl: './team.component.html',
  styleUrls: ['./team.component.css']
})
export class TeamComponent implements OnInit{
  selectedUser: User | null = null;
  selectedTeam: Team | null = null;
  teams: Team[] = [];
  athleteEvents: AthleteEvent[] = [];

  constructor(
    private userService: UserService,
    private teamService: TeamService,
    private leagueService: LeagueService,
    private athleteEventService: AthleteEventService,
    private route: ActivatedRoute,
    private router: Router,
    private auth: AuthService
  ){}

  ngOnInit(): void {
    this.auth.getLoggedInUser().subscribe({
      next: (user) => {
        this.selectedUser = user;
        this.reload();
      },
      error: (err) => {
        console.error('UserComponenet: error on init');
        console.error(err);
      }
    });
  }

  reload():void {
    // this.todos = this.todoService.index();
    this.teamService.index().subscribe({
      next: (teamList) => {
        this.teams = teamList;
        this.selectedTeam = null;
      },
      error: (someError) => {
        console.error('TodoListComponent.reload(): error getting todo list');
        console.error(someError);
      }
    });
  }

  updateTeam(team: Team, goToDetails: boolean = true): void {
      // console.log(selectedUser.username);
      this.teamService.update(team).subscribe({
        next: (updatedTeam) => {
          if (goToDetails){
            this.selectedTeam = updatedTeam;
          }
          else {
            this.selectedTeam = null;
          }
          this.reload();
        },
        error: (updateError) => {
          console.error('TeamComponenet.updateTeam(): error on update');
          console.error(updateError);

        }
      });
  }

}
