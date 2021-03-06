package com.revature.service;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.SQLException;

import org.h2.tools.RunScript;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.jupiter.api.Test;

import com.revature.model.Role;
import com.revature.model.User;
import com.revature.utility.ConnectionUtility;

public class LoginServiceTest {
	
	private LoginService ls = new LoginService();
	
	@BeforeClass
	public static void setUp() {
		try (Connection c = ConnectionUtility.getH2Connection()){
			RunScript.execute(c, new FileReader("ers_build.sql"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void loginTest() {
		assertEquals(new User(1, "bntufte", "OX3GWvzzdGdnRXz9nUbk0w==:rh3n2J6dcdKo12NMOlcwKA==", "Brandon", "Tufte", "btufte@economist.com", new Role(1, "FINANCE M")), ls.login("bntufte", "password"));
	}
	
	@AfterClass
	public static void tearDown() {
		try (Connection c = ConnectionUtility.getH2Connection()){
			RunScript.execute(c, new FileReader("ers_break_down.sql"));
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
}
