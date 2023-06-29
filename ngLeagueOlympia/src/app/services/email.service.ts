import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { catchError, map } from 'rxjs/operators';
import { throwError } from 'rxjs'


@Injectable({
  providedIn: 'root'
})
export class EmailService {

  private url = "https://mailthis.to/MiAmigoRyan";

  constructor(private http: HttpClient){}

  SendEmail(input: any) {
    return this.http.post(this.url, input).pipe(
        map((response: any) => {
            if (response) {
                return response;
            }
        }),
        catchError((error: any) => {
            console.error(error);
            return throwError(error);
        })
    );
}
}
