import { UserService } from './../../services/user.service';
import { Component, Input, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { User } from 'src/app/models/user';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {
  editUser: User | null = null;
  selected: User | null = null;

  constructor(
    private userService: UserService,
    private route: ActivatedRoute,
    private router: Router,
    private auth: AuthService
  ) { }

  ngOnInit(): void {
    this.auth.getLoggedInUser().subscribe({
      next: (user) => {
        this.editUser = user;
        // asdfasdfasdf
      },
      error: (err) => {
        console.error('UserComponenet: error on init');
        console.error(err);
      }
    });
  }

  updateUser(): void {
    this.userService.update(this.editUser!).subscribe({
      next: (updatedUser) => {
        console.log(updatedUser);
        console.log(this.editUser);
        this.editUser = updatedUser;
      },
      error: (updateError) => {
        console.error('TodoListComponenet.updateTodo(): error on update');
        console.error(updateError);
      }
    });
  }

}
