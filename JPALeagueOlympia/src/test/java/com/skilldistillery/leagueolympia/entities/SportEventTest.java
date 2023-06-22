package com.skilldistillery.leagueolympia.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class SportEventTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private SportEvent sportEvent;
		
		@BeforeAll
		static void setUpBeforeClass() throws Exception {
			emf = Persistence.createEntityManagerFactory("JPALeagueOlympia");
		}

		@AfterAll
		static void tearDownAfterClass() throws Exception {
			emf.close();
		}

		@BeforeEach
		void setUp() throws Exception {
			em = emf.createEntityManager();
			sportEvent = em.find(SportEvent.class,1);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_SportEvent() {
			assertNotNull(sportEvent);
		}
		@Test
		void test_SportEvent_AthelteEvent_OTM() {
			assertNotNull(sportEvent);
			assertNotNull(sportEvent.getAthleteEvents());
			assertTrue(sportEvent.getAthleteEvents().size()>0);
		}
		@Test
		void test_SportEvent_League_MTM() {
			assertNotNull(sportEvent);
			assertNotNull(sportEvent.getLeagues());
			assertTrue(sportEvent.getLeagues().size()>0);
		}	
}
