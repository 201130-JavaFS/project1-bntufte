package com.revature.repo;

import java.util.List;
import com.revature.model.User;

public interface UserDao {
	
	public List<User> getUsers();
	public User getUserById(int id);
	public boolean updateUser(User u);
}
