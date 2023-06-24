import { Component } from '@angular/core';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';
import { UserService } from 'src/app/services/user.service';

@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.css']
})
export class NavigationComponent {
  isCollapsed: boolean = false;

  constructor (
    private auth: AuthService,
  ){}

  loggedIn(): boolean {
    if (this.auth.checkLogin()) {
      return true;
    } else {
      return false;
    }
  }

}
