package com.skilldistillery.leagueolympia.entities;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class AthleteCommentTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private AthleteComment athleteComment;

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
		athleteComment = em.find(AthleteComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test_AthleteComment() {
		assertNotNull(athleteComment);
	}
	@Test
	void test_AthleteComment_User_MTO() {
		assertNotNull(athleteComment);
		assertNotNull(athleteComment.getUser());
	}
		
}

