package com.revature.service;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.List;
import com.revature.model.User;
import com.revature.repo.UserDao;
import com.revature.repo.UserPostgres;
import com.revature.utility.EncryptionUtility;

public class LoginService {
	
	public User login(String username, String password) {
		UserDao uDao = new UserPostgres();
		List<User> users = uDao.getUsers();
		for (User u : users) {
			try {
				final EncryptionUtility eu = new EncryptionUtility();			
				String decryptPass = EncryptionUtility.decrypt(u.getPassword(), eu.getKey());
				if (username.equals(u.getUserName()) && password.equals(decryptPass)) {
						return u;
					}
			} catch (GeneralSecurityException | IOException e) {
				e.printStackTrace();
			}			
		}
		return null;
	}
}
