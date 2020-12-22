package com.revature.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.model.LoginDTO;
import com.revature.model.User;
import com.revature.service.LoginService;

public class LoginController {

	private ObjectMapper om = new ObjectMapper();
	private LoginService ls = new LoginService();
	private static Logger log = LogManager.getRootLogger();

	public void login(HttpServletRequest req, HttpServletResponse res) throws IOException {
		if(req.getMethod().equals("POST")) {
			BufferedReader reader = req.getReader();			
			StringBuilder sb = new StringBuilder();			
			String line = reader.readLine();			
			while(line!=null) {
				sb.append(line);
				line=reader.readLine();
			}			
			String body = new String(sb);			
			LoginDTO lDto = om.readValue(body, LoginDTO.class);	
			User u = ls.login(lDto.username, lDto.password);
			if(u != null) {
				HttpSession ses = req.getSession();
				ses.setAttribute("user", lDto);
				ses.setAttribute("loggedin", true);
				res.setStatus(200);
				String json = om.writeValueAsString(u);
				res.getWriter().print(json);
				log.info("Logged in");
			}else {
				HttpSession ses = req.getSession(false);
				if (ses != null)
					ses.invalidate();				
				res.setStatus(401);
				log.info("Logged In Failure");
			}
		}
	}
	
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession ses = req.getSession(false);
		if (ses != null) {
			ses.invalidate();
			res.setStatus(200);
			log.info("Logged Out");
		}		
	}
}
