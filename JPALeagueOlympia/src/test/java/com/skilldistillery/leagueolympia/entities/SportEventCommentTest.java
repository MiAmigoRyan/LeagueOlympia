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

class SportEventCommentTest {
	   private  static EntityManagerFactory emf;
	   private EntityManager em;
	   private SportEventComment sportEventComment;
		
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
			sportEventComment = em.find(SportEventComment.class,2);
		}

		@AfterEach
		void tearDown() throws Exception {
		}
		
		@Test
		void test_SportEventComment() {
			assertNotNull(sportEventComment);
		}
		
		@Test
		void test_SportEventComment_User_MTO() {
			assertNotNull(sportEventComment);
			assertNotNull(sportEventComment.getUser());			
		}
		@Test
		void test_SportEventComment_SportEvent_MTO() {
			assertNotNull(sportEventComment);
			assertNotNull(sportEventComment.getSportEvent());			
		}
		@Test
		void test_SportEventComment_SportEventComment_MTO() {
			assertNotNull(sportEventComment);
			assertNull(sportEventComment.getReply());
			assertTrue(sportEventComment.getReplies().size()==0);
		}
		
	
}
