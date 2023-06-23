import { ActivatedRoute, Route, Router } from '@angular/router';
import { LeagueService } from '../../services/league.service';
import { Component, OnInit } from '@angular/core';
import { League } from 'src/app/models/league';

@Component({
  selector: 'app-league-list',
  templateUrl: './league-list.component.html',
  styleUrls: ['./league-list.component.css']
})
export class LeagueListComponent implements OnInit {
  title: string = 'ngLeague';
  leagues: League[] = [];
  selected: League | null = null;

  constructor(
    private leagueService: LeagueService,
    private route: Router,
    private router: ActivatedRoute
  ) { }

  ngOnInit(): void {
    let idString = this.route.snapshot.paramMap.get('id');
    if (!this.selected && idString) {
      console.log(idString);
      let id: number = Number.parseInt(idString);
      if(isNaN(id)){
        this.router.navigateByUrl('invalidId');
      }
      else{
        this.leagueService.showLeague(id).subscribe({
          next: (league) => {
            this.displayLeague(league);
          },
          error: (error)=>{
            console.error("error in showLeague path" + error);
            this.router.navigateByUrl('invalidId');
          }
        });
      }
    }
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
  }

  displayAllLeagues() {
    this.selected = null;
  }

}
