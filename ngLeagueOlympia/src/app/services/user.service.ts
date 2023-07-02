import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';
import { AuthService } from './auth.service';
import { User } from '../models/user';
import { Observable, catchError, throwError } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private url = environment.baseUrl + 'api/users';

  constructor(
    private http: HttpClient,
    private auth: AuthService
  ) { }

  public update(user: User): Observable<User> {
    user.teams = [];
    user.leagues = [];
    user.boughtInLeagues = [];
    return this.http.put<User>(this.url + '/' + user.username, user, this.getHttpOptions()).pipe(
      catchError((err: any) => {
        return throwError(
          () => new Error('UserService.updateUser(): error updating user: ' + err)
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
