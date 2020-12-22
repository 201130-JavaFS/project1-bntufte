package com.revature.service;

import java.util.List;

import com.revature.model.Reimbursement;
import com.revature.repo.ReimbursementPostgres;

public class ReimburseService {

	ReimbursementPostgres rp = new ReimbursementPostgres();
	
	public List<Reimbursement> getReimbursements() {
		return rp.getReimbursements();
	}

	public void sendReimburse(Reimbursement r) {
		rp.createReimbursement(r);
	}

}
