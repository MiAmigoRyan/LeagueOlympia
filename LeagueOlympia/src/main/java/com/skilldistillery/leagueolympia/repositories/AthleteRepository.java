package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.Athlete;


public interface AthleteRepository  extends JpaRepository <Athlete, Integer>{

}
