package com.revature.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.revature.controller.LoginController;
import com.revature.controller.ReimburseController;

public class MasterServlet extends HttpServlet {

	private static final long serialVersionUID = 2854068448754481397L;
	private LoginController lc = new LoginController();
	private ReimburseController rc = new ReimburseController();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("application/json");
		res.setStatus(404);
		final String URI = req.getRequestURI().replace("/project-1/", "");
		switch (URI) {
		case "ticketSub":
			if (req.getSession(false) != null) {
				rc.submitReimb(req, res);
			} else
				res.setStatus(403);
			break;
		case "manReimburses":
			if (req.getSession(false) != null) {
				rc.manReimb(req, res);
			} else
				res.setStatus(403);
			break;
		case "empReimburses":
			if (req.getSession(false) != null)
				rc.empReimb(req, res);
			else
				res.setStatus(403);
			break;
		case "login":
			lc.login(req, res);
			break;
		case "logout":
			lc.logout(req, res);
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

	@Override
	protected void doDelete(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
}
