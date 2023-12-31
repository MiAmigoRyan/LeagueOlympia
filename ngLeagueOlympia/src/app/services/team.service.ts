import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Team } from '../models/team';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class TeamService {
  private url = environment.baseUrl + 'api/teams';
  newTeam: Team = new Team();

  constructor(
    private http: HttpClient,
    private auth: AuthService
  ) { }

  public index(): Observable<Team[]> {
    return this.http.get<Team[]>(this.url, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error GETing team list');
        return throwError(
          () =>
            new Error('TeamService.index(): error retrieving team list: ' + err)
        );
      })
    );
  }

  public update(team: Team): Observable<Team> {
    console.log(team);
    return this.http.put<Team>(this.url + '/' + team?.league?.id, team, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('TeamService.updateTeam(): error updating team: ' + err)
        );
      })
    );
  }

  public updateTeamRoster(leagueId: number, sportEventId: number, athleteId: number): Observable<Team> {
    return this.http.post<Team>(this.url + '/' + leagueId + '/sportEvents/' + sportEventId + '/athletes/' + athleteId, null, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('TeamService.updateTeamRoster(): error updating team: ' + err)
        );
      })
    );
  }

  public swapAthletes(leagueId: number, sportEventId: number, newAthleteId: number, oldAthleteId: number): Observable<Team> {
    return this.http.post<Team>(this.url + '/' + leagueId + '/sportEvents/' + sportEventId + '/athletes/' + newAthleteId
    + '/athletes/' + oldAthleteId, null, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('TeamService.swapAthletes(): error updating team: ' + err)
        );
      })
    );
  }


  getHttpOptions() {
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest',
      },
    };
    return options;
  }

  public create(leagueId: number): Observable<Team> {
    return this.http.post<Team>(this.url + '/' + leagueId, {}, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error POSTing new team');
        return throwError(
          () => new Error('TeamService.create(): error creating team: ' + err)
        );
      })
    );
  }

  public show(teamId: number): Observable<Team> {
    return this.http.get<Team>(this.url + '/' + teamId, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error GETing single team');
        return throwError(
          () =>
            new Error(
              'TeamService.index(): error retrieving single team: ' + err
            )
        );
      })
    );
  }


}
