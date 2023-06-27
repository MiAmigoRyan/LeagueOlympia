import { Component, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { League } from 'src/app/models/league';
import { AuthService } from 'src/app/services/auth.service';
import { LeagueService } from 'src/app/services/league.service';

@Component({
  selector: 'app-league',
  templateUrl: './league.component.html',
  styleUrls: ['./league.component.css']
})
export class LeagueComponent implements OnInit{
  newLeague: League = new League();

  constructor(
    private leagueService: LeagueService,
    private router: Router,
    private route: ActivatedRoute,
    private auth: AuthService
  ){ }

  ngOnInit(): void {

  }

  createALeague(newLeague: League){
      let username: string;
      if(this.newLeague) {
      this.leagueService.create(newLeague).subscribe({
        next: (createdLeague) => {
          this.newLeague = new League();
          this.router.navigateByUrl('/leagues/' + username);
        },
        error: (createError) => {
          console.error('LeagueListComponent.createLeague(): error creating League');
          console.error(createError);
        }
      });
    }
  }

}
