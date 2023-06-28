import { Pipe, PipeTransform } from '@angular/core';
import { Team } from '../models/team';

@Pipe({
  name: 'rankTeams'
})
export class RankTeamsPipe implements PipeTransform {

  transform(teams: Team [], ...args: unknown[]): Team [] {
    for (let team of teams) {
      team.athleteResultSum = 0;
      for (let athleteEvent of team.athleteEvents) {
        team.athleteResultSum += athleteEvent.finishResult;
      }
    }
    let ranked: Team [] = [...teams];
    ranked.sort((teamOne, teamTwo) => {
      return teamOne.athleteResultSum - teamTwo.athleteResultSum;
    });
    return ranked;
  }

}
