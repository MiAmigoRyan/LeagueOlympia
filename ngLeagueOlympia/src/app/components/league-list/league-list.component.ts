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
  }

  displayAllLeagues() {
    this.selected = null;
  }

}
