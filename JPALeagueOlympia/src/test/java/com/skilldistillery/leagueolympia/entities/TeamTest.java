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

class TeamTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Team team;

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
		TeamId i = new TeamId(1,1);
		team = em.find(Team.class, i);
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test_Team() {
		assertNotNull(team);
	}
	
	@Test
	void test_Team_to_League_MTO() {
		assertNotNull(team);
		assertNotNull(team.getLeague());
	}
	@Test
	void test_Team_to_User_MTO() {
		assertNotNull(team);
		assertNotNull(team.getUser());
	}
	@Test
	void test_Team_to_AthleteEvent_MTM() {
		assertNotNull(team);
		assertTrue(team.getAthleteEvents().size()>0);
	}
	
}
