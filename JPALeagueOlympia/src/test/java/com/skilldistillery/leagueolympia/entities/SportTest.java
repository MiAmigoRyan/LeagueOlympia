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

class SportTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private Sport sport;
		
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
			sport = em.find(Sport.class,1);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_Sport() {
			assertNotNull(sport);
		}
		@Test
		void test_Sport_to_SportEvent() {
			assertNotNull(sport);
			assertTrue(sport.getSportevents().size()>0);
		}
}
