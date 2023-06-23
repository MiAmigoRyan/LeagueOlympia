import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable, catchError, throwError } from 'rxjs';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { SportEvent } from '../models/sport-event';

@Injectable({
  providedIn: 'root'
})
export class SportEventService {
  private url = environment.baseUrl + 'api/events';

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

  index(): Observable<SportEvent[]>{
    return this.http.get<SportEvent[]>(this.url).pipe(
      catchError((err: any) => {
        console.error("Error Fetching Leagues");
        return throwError(
          () => new Error('SportEventService.index(): error' + err)
        );
      })
    );
  }
}
