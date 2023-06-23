import { TestBed } from '@angular/core/testing';

import { SportEventService } from './sport-event.service';

describe('SportEventService', () => {
  let service: SportEventService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SportEventService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
