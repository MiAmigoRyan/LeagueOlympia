import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { LeagueListComponent } from './components/league-list/league-list.component';
import { SportEventListComponent } from './components/sport-event-list/sport-event-list.component';

@NgModule({
  declarations: [
    AppComponent,
    LeagueListComponent,
    SportEventListComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
