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



}
