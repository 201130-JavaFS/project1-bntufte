package com.revature.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.revature.model.LoginDTO;
import com.revature.model.ReimbDTO;
import com.revature.model.Reimbursement;
import com.revature.model.Type;
import com.revature.model.User;
import com.revature.service.LoginService;
import com.revature.service.ReimburseService;

public class ReimburseController {

	private ObjectMapper om = new ObjectMapper();
	private static ReimburseService rs = new ReimburseService();
	private LoginService ls = new LoginService();
	private static Logger log = LogManager.getRootLogger();
	
	public void empReimb(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession ses = req.getSession(false);
		LoginDTO lDto = (LoginDTO) ses.getAttribute("user");
		List<Reimbursement> list = rs.getReimbursements();
		List<Reimbursement> list2 = new ArrayList<Reimbursement>();
		for(Reimbursement r: list) {
			if (r.getAuthor().getUserName().equals(lDto.username)) {
				list2.add(r);
			}
		}
		String json = om.writeValueAsString(list2);
		res.getWriter().print(json);
		res.setStatus(200);
		log.info("User Reimbursements Collected");
	}

	public void manReimb(HttpServletRequest req, HttpServletResponse res) throws IOException {		
		List<Reimbursement> list = rs.getReimbursements();
		String json = om.writeValueAsString(list);
		res.getWriter().print(json);
		res.setStatus(200);
		log.info("Manager Reimbursements Collected");
	}

	public void submitReimb(HttpServletRequest req, HttpServletResponse res)  throws IOException {
		if(req.getMethod().equals("POST")) {
			BufferedReader reader = req.getReader();			
			StringBuilder sb = new StringBuilder();			
			String line = reader.readLine();			
			while(line!=null) {
				sb.append(line);
				line=reader.readLine();
			}			
			String body = new String(sb);			
			ReimbDTO rDto = om.readValue(body, ReimbDTO.class);
			
			HttpSession ses = req.getSession(false);
			LoginDTO lDto = (LoginDTO) ses.getAttribute("user");
			User u = ls.login(lDto.username, lDto.password);
			Date d = null;
			Blob b = null;
			User u2 = null;
			String t = rDto.type;
			Type t2 = null;
			Reimbursement r = new Reimbursement(rDto.amount, d, d, rDto.description, b, u, u2, null, t2);
			if(u != null) {
				rs.sendReimburse(r);
				res.setStatus(200);
				String json = om.writeValueAsString(u);
				res.getWriter().print(json);
				log.info("Reimburse Ticket Submission Success");
			}else {
				
				log.info("Reimburse Ticket Submission Failure");
			}
		}
	}

}
