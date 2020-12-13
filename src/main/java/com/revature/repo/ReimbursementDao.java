package com.revature.repo;

import java.util.List;

import com.revature.model.Reimbursement;

public interface ReimbursementDao {
	
	public boolean createReimbursement(Reimbursement r);
	public List<Reimbursement> getReimbursements();
	public Reimbursement getReimbursementById(int id);	
	public boolean updateReimbursement(Reimbursement r);
	public boolean deleteReimbursement(int id);
}
