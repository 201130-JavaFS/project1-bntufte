package com.revature.service;

//import org.apache.logging.log4j.LogManager;
//import org.apache.logging.log4j.Logger;

public class LoginService {
//	private static Logger log = LogManager.getRootLogger();
	public boolean login(String username, String password) {
		if(username.equals("agent") && password.equals("cellist")) {
//			log.info("Logged in");
			return true;			
		}
//		log.info("Not LoggedIn");
		return false;
	}
}
