import { TestBed } from '@angular/core/testing';

import { AthleteEventService } from './athlete-event.service';

describe('AthleteEventService', () => {
  let service: AthleteEventService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(AthleteEventService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
