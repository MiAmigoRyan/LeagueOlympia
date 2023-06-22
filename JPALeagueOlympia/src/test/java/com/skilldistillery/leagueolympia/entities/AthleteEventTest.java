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

class AthleteEventTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private AthleteEvent athleteEvent;
		
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
			athleteEvent = em.find(AthleteEvent.class,1);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_LeagueComment() {
			assertNotNull(athleteEvent);
//			assertEquals("admin", user.getUsername());
		}

}
