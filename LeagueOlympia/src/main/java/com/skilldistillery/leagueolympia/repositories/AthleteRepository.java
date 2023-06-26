package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.Athlete;
import com.skilldistillery.leagueolympia.entities.User;

public interface AthleteRepository  extends JpaRepository <Athlete, Integer>{

}
