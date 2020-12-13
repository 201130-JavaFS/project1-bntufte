package com.revature.repo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.revature.model.Role;
import com.revature.model.User;
import com.revature.utility.ConnectionUtility;

public class UserPostgres implements UserDao{

	@Override
	public List<User> getUsers() {
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "select u.ers_users_id, u.ers_username, u.ers_password, u.user_first_name, u.user_last_name, u.user_email,\r\n"
					+ "ur.user_role_id, ur.user_role \r\n"
					+ "from ers.users as u\r\n"
					+ "left join ers.user_roles as ur on u.user_role_id = ur.user_role_id;";
			List<User> users = new ArrayList<>();
			Statement statement = conn.createStatement();			
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("ers_users_id");
				String userName = rs.getString("ers_username");
				String pass = rs.getString("ers_password");
				String firstName = rs.getString("user_first_name");
				String lastName = rs.getString("user_last_name");
				String email = rs.getString("user_email");				
				Role role = new Role(rs.getInt("user_role_id"), rs.getString("user_role"));
				users.add(new User(id, userName, pass, firstName,
						lastName, email, role));
			}
			return users;			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

	@Override
	public User getUserById(int uId) {
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "select u.ers_users_id, u.ers_username, u.ers_password, u.user_first_name, u.user_last_name, u.user_email,\r\n"
					+ "ur.user_role_id, ur.user_role \r\n"
					+ "from ers.users as u\r\n"
					+ "left join ers.user_roles as ur on u.user_role_id = ur.user_role_id\r\n"
					+ "where ers_users_id = ?;";
			User user = null;
			PreparedStatement pstate = conn.prepareStatement(sql);
			pstate.setInt(1, uId);
			ResultSet rs = null;
			rs = pstate.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("ers_users_id");
				String userName = rs.getString("ers_username");
				String pass = rs.getString("ers_password");
				String firstName = rs.getString("user_first_name");
				String lastName = rs.getString("user_last_name");
				String email = rs.getString("user_email");				
				Role role = new Role(rs.getInt("user_role_id"), rs.getString("user_role"));
				user = new User(id, userName, pass, firstName,
						lastName, email, role);
			}
			return user;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

}
