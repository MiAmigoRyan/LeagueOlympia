package com.skilldistillery.leagueolympia.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skilldistillery.leagueolympia.entities.User;
import com.skilldistillery.leagueolympia.repositories.UserRepository;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserRepository userRepo;

	@Override
	public User update(String username, User user) {
		User managedUser = userRepo.findByUsername(username);
		if (managedUser.getUsername().equals(username)) {
			managedUser.setAboutMe(user.getAboutMe());
			managedUser.setPhoto(user.getPhoto());

			return userRepo.saveAndFlush(managedUser);

		} else {
			return null;
		}

	}
}
