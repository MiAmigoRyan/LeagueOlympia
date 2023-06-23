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

class OlympiadTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private Olympiad olympiad;
		
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
			olympiad = em.find(Olympiad.class,1);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_Olympiad() {
			assertNotNull(olympiad);
		}
		@Test
		void test_Olympiad_to_OlympiadCategory() {
			assertNotNull(olympiad);
			assertNotNull(olympiad.getOlympiadCategory());
		}
		
		@Test
		void test_Olympiad_to_County() {
			assertNotNull(olympiad);
			assertNotNull(olympiad.getCountry());
		}
		@Test
		void test_Olympiad_to_SportEvent() {
			assertNotNull(olympiad);
			assertNotNull(olympiad.getSportevents());
		}
		

}
