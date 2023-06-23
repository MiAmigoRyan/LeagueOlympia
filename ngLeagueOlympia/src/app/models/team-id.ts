export class TeamId {
  userId: number;
  leagueId: number;

  constructor(
    userId: number = 0,
    leagueId: number = 0
  ) {
    this.userId = userId;
    this.leagueId = leagueId;
  }
}
