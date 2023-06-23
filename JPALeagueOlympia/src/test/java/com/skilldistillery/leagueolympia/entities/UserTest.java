package com.skilldistillery.leagueolympia.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class UserTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private User user;
		
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
			user = em.find(User.class,1);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_User() {
			assertNotNull(user);
			assertEquals("admin", user.getUsername());
		}
		
		@Test
		void test_User_to_Team_OTM() {
			assertNotNull(user);
			assertTrue(user.getTeams().size()>0);
		}
		@Test
		void test_User_to_League_MTM() {
			assertNotNull(user);
			assertTrue(user.getBoughtInLeagues().size()>0);
		}
		@Test
		void test_User_to_AthleteComment_MTO() {
			assertNotNull(user);
			assertTrue(user.getAthleteComments().size()>0);
		}
		@Test
		void test_User_to_LeagueComment_OTM() {
			assertNotNull(user);
			assertTrue(user.getLeagueComments().size()>0);
		}
		@Test
		void test_User_to_SportEventComment_OTM() {
			assertNotNull(user);
			assertTrue(user.getSportEventComments().size()>0);
		}
		@Test
		void test_User_to_League_OTM() {
			assertNotNull(user);
			assertTrue(user.getLeagues().size()>0);
		}
		
		

	}
