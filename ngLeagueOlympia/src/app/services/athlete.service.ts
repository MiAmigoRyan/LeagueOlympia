import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { Team } from '../models/team';
import { AuthService } from './auth.service';
import { Athlete } from '../models/athlete';

@Injectable({
  providedIn: 'root'
})
export class AthleteService {
  private url = environment.baseUrl + 'api/athletes';


  constructor(
    private http: HttpClient,
    private auth: AuthService
  ) { }

  public index(): Observable<Athlete[]> {
    return this.http.get<Athlete[]>(this.url, this.getHttpOptions()).pipe(
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


}
