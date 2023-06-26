package com.skilldistillery.leagueolympia.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.skilldistillery.leagueolympia.entities.AthleteEvent;


public interface AthleteEventRepository  extends JpaRepository <AthleteEvent, Integer>{

}
