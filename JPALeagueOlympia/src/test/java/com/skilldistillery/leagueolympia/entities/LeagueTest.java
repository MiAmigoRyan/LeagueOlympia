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

class LeagueTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private League league;

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
		league = em.find(League.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test_League() {
		assertNotNull(league);
	}
	@Test
	void test_League_to_Team_OTM() {
		assertNotNull(league);
		assertTrue(league.getTeams().size()>0);
	}
	@Test
	void test_League_to_User_MTM() {
		assertNotNull(league);
		assertTrue(league.getUsersBoughtIn().size()>0);
	}
	@Test
	void test_League_to_SportEvent_MTM() {
		assertNotNull(league);
		assertTrue(league.getSportEvents().size()>0);
	}
	@Test
	void test_League_to_LeagueComment_OTM() {
		assertNotNull(league);
		assertTrue(league.getComments().size()>0);
	}
	@Test
	void test_League_to_User_Comissioner_MTO() {
		assertNotNull(league);
		assertNotNull(league.getComissioner());
	}
}
