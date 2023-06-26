import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { Team } from 'src/app/models/team';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { LeagueService } from 'src/app/services/league.service';
import { TeamService } from 'src/app/services/team.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-team',
  templateUrl: './team.component.html',
  styleUrls: ['./team.component.css']
})
export class TeamComponent {
  selectedUser: User | null = null;
  selectedTeam: Team | null = null;
  teams: Team[] = [];

  constructor(
    private userService: UserService,
    private teamService: TeamService,
    private leagueService: LeagueService,
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
      },
      error: (someError) => {
        console.error('TodoListComponent.reload(): error getting todo list');
        console.error(someError);
      }
    });
  }

  // showTeam() {
  //   this.selectedTeam =
  // }

  makeTeam(newTeam: Team) {

  }




}
