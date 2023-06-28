import { SportEvent } from 'src/app/models/sport-event';
import { AthleteEvent } from './../models/athlete-event';
import { Athlete } from 'src/app/models/athlete';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Team } from '../models/team';
import { AuthService } from './auth.service';

@Injectable({
  providedIn: 'root'
})
export class AthleteService {
  private url = environment.baseUrl + 'api/athletes';
  athletes: Athlete[] = [];

  constructor(
    private http: HttpClient,
    private auth: AuthService
  ) { }

  public index(): Observable<Athlete[]> {
    console.log(this.athletes);
    return this.http.get<Athlete[]>(this.url).pipe(
      catchError((err: any) => {
        console.error('Error GETing athlete list');
        return throwError(
          () =>
            new Error('AthleteService.index(): error retrieving athlete list: ' + err)
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

  public show(sportEventId: number): Observable<SportEvent> {
    return this.http.get<SportEvent>(this.url + '/' + sportEventId, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error('Error GETing athletes related to an event');
        return throwError(
          () =>
            new Error(
              'AthleteService.index(): error retrieving athletes related to an event: ' + err
            )
        );
      })
    );
  }



}
