package com.revature;

import java.io.IOException;
//import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
//import java.security.NoSuchAlgorithmException;
//import java.security.spec.InvalidKeySpecException;
import java.util.List;

import com.revature.model.Reimbursement;
import com.revature.model.User;
import com.revature.repo.ReimbursementDao;
import com.revature.repo.ReimbursementPostgres;
import com.revature.repo.UserDao;
import com.revature.repo.UserPostgres;
import com.revature.utility.EncryptionUtility;

public class TestDriver {
	private static ReimbursementDao rDao = new ReimbursementPostgres();
//	private static UserDao uDao = new UserPostgres();
//	try {
//	private static EncryptionUtility eu = new EncryptionUtility();
//	} catch (InvalidKeySpecException e) {
//		e.printStackTrace();
//	}

	public static void main(String[] args) {
//		try {
//			final EncryptionUtility eu = new EncryptionUtility();
//			List<User> uList = uDao.getUsers();
//		for(User u2: uList) {
//			String encryptPass = EncryptionUtility.encrypt(u2.getPassword(), eu.getKey());
//			uDao.updateUser(new User(u2.getUserId(), u2.getUserName(), encryptPass, u2.getFirstName(), u2.getLastName(), u2.getEmail(), u2.getRole()));
//		}
//		} catch (GeneralSecurityException | IOException e) {
//			e.printStackTrace();
//		}
		
		

//		User u = uDao.getUserById(1);
//		System.out.println(u + "\n");
//		
//		List<User> uList = uDao.getUsers();
//		for(User u2: uList)
//			System.out.println(u2);
		
		Reimbursement r = rDao.getReimbursementById(1);
		System.out.println(r + "\n");
//		
//		List<Reimbursement> rList = rDao.getReimbursements();
//		for(Reimbursement r2: rList)
//			System.out.println(r2);
	}
}
