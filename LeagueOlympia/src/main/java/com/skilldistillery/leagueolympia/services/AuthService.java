package com.skilldistillery.leagueolympia.services;

import com.skilldistillery.leagueolympia.entities.User;

public interface AuthService {

	public User register(User user);
	public User getUserByUsername(String username);
}
