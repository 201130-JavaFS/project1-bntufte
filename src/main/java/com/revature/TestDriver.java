//package com.revature;
//
//import java.util.List;
//
//import com.revature.model.Reimbursement;
//import com.revature.repo.ReimbursementDao;
//import com.revature.repo.ReimbursementPostgres;
//
//public class TestDriver {
//	private static ReimbursementDao rDao = new ReimbursementPostgres();
//	private static UserDao uDao = new UserPostgres();
//	
//	public static void main(String[] args) {
//		User u = uDao.getUserById(1);
//		System.out.println(u + "\n");
//		
//		List<User> uList = uDao.getUsers();
//		for(User u2: uList)
//			System.out.println(u2);
//		Reimbursement r = rDao.getReimbursementById(1);
//		System.out.println(r + "\n");
//		
//		List<Reimbursement> rList = rDao.getReimbursements();
//		for(Reimbursement r2: rList)
//			System.out.println(r2);
//	}
//}
