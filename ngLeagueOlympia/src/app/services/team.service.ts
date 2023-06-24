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
    return this.http.put<Team>(this.url + '/' + team.id, team, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('TeamService.updateTeam(): error updating team: ' + err)
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
}
