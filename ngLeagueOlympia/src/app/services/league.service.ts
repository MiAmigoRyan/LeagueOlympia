import { AuthService } from './auth.service';
import { DatePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { League } from '../models/league';

@Injectable({
  providedIn: 'root'
})
export class LeagueService {

  constructor(
    private http: HttpClient,
    private datePipe: DatePipe,
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
    return this.http.get<League>[](this.url, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        console.error("Error Fetching Leagues");
        return throwError(
          () => new Error('LeageService.index(): error' + err)
        );
      })
    );
  }
}
