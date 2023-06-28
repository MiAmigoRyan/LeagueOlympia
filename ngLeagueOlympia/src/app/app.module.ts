import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { LeagueListComponent } from './components/league-list/league-list.component';
import { SportEventListComponent } from './components/sport-event-list/sport-event-list.component';
import { RegisterComponent } from './components/register/register.component';
import { NavigationComponent } from './components/navigation/navigation.component';
import { LoginComponent } from './components/login/login.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { LeagueService } from './services/league.service';
import { AuthService } from './services/auth.service';
import { SportEventService } from './services/sport-event.service';
import { LogoutComponent } from './components/logout/logout.component';
import { NotFoundComponent } from './components/not-found/not-found.component';
import { HomeComponent } from './components/home/home.component';
import { AboutComponent } from './components/about/about.component';
import { ContactComponent } from './components/contact/contact.component';
import { UserComponent } from './components/user/user.component';
import { TeamComponent } from './components/team/team.component';
import { AthleteComponent } from './components/athlete/athlete.component';
import { LeagueComponent } from './components/league/league.component';
import { RankTeamsPipe } from './pipes/rank-teams.pipe';
// import { OlympiadPipe } from './pipes/olympiad.pipe';

@NgModule({
  declarations: [
    AppComponent,
    LeagueListComponent,
    SportEventListComponent,
    RegisterComponent,
    NavigationComponent,
    LoginComponent,
    LogoutComponent,
    NotFoundComponent,
    HomeComponent,
    AboutComponent,
    ContactComponent,
    UserComponent,
    TeamComponent,
    AthleteComponent,
    LeagueComponent,
    RankTeamsPipe,
    // OlympiadPipe,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule
  ],
  providers: [LeagueService, AuthService, SportEventService, RankTeamsPipe],
  bootstrap: [AppComponent]
})
export class AppModule { }
