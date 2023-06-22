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

class AthleteTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Athlete athlete;

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
		athlete = em.find(Athlete.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	}

	@Test
	void test_Athlete() {
		assertNotNull(athlete);
//			assertEquals("admin", user.getUsername());
	}
}
