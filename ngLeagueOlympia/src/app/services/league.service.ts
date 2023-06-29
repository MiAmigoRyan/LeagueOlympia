import { User } from 'src/app/models/user';
import { AuthService } from './auth.service';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { League } from '../models/league';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class LeagueService {
  private url = environment.baseUrl + 'api/leagues';

  constructor(
    private http: HttpClient,
    private auth: AuthService
    ) { }

  getHttpOptions(){
    let options = {
      headers: {
        Authorization: 'Basic ' + this.auth.getCredentials(),
        'X-Requested-With': 'XMLHttpRequest'
      }
    }
    return options;
  }

  index(): Observable<League[]>{
    return this.http.get<League[]>(this.url).pipe(
      catchError((err: any) => {
        console.error("Error Fetching Leagues");
        return throwError(
          () => new Error('LeagueService.index(): error' + err)
        );
      })
    );
  }

  public create(newLeague: League): Observable<League> {
    return this.http.post<League>(this.url, newLeague, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error POSTing new League');
        return throwError(
          () => new Error('LeagueService.create(): error creating League: ' + err)
        );
      })
    );
  }

  public destroy(id: number): Observable<void> {
    return this.http.delete<void>(this.url + '/' + id, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error DELETEing League');
        return throwError(
          () => new Error('LeagueService.destroy(): error deleting League: ' + err)
        );
      })
    );
  }

  public update(league: League): Observable<League> {
    return this.http.put<League>(this.url + '/' + league.id, league, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('LeagueService.updateLeague(): error updating league: ' + err)
        );
      })
    );
  }

  public updateLeagueSportEvents(leagueId: number, sportEventId: number): Observable<League> {
    return this.http.post<League>(this.url + '/' + leagueId + '/sportEvent/' + sportEventId, null, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('TeamService.updateTeamRoster(): error updating team: ' + err)
        );
      })
    );
  }

  // public swapSportEvents(leagueId: number, newSportEventId: number, oldSportEventId: number): Observable<League> {
  //   return this.http.post<League>(this.url + '/' + leagueId + '/sportEvent/' + sportEventId + '/athletes/' + newAthleteId + '/athletes/' + oldAthleteId, null, this.getHttpOptions()).pipe(
  //     catchError((err: any) => {
  //       return throwError(
  //         () => new Error('TeamService.swapAthletes(): error updating team: ' + err)
  //       );
  //     })
  //   );
  // }

}
