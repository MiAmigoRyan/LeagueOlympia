import { Router } from '@angular/router';
import { Component } from '@angular/core';
import { AuthService } from 'src/app/services/auth.service';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent {

  loginUser: User = new User();

    constructor(
      private auth: AuthService,
      private router: Router
    ){}

    login(user: User) {
      console.log('logging in user:');
      console.log(user);

      this.auth.login(user.username, user.password).subscribe( {
        next: (loggedInUser) => {
          this.router.navigateByUrl('/home');
          this.reloadRoute('/home');
        },
        error: (loginFailure) => {
          console.error('LoginComponent.login(): login failed');
          console.error(loginFailure);
          this.router.navigateByUrl('register');
        }
      });
    }

    reloadRoute(route: string) {
      this.router.navigateByUrl('/', {skipLocationChange: true}).then( () => {
        this.router.navigate([route]);
      })
    }

}
