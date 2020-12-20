package com.revature.repo;

import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.revature.model.Reimbursement;
import com.revature.model.Role;
import com.revature.model.Status;
import com.revature.model.Type;
import com.revature.model.User;
import com.revature.utility.ConnectionUtility;

public class ReimbursementPostgres implements ReimbursementDao{

	@Override
	public boolean createReimbursement(Reimbursement r) {		
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "insert into ers.reimbursement "
					+ "(reimb_amount, reimb_submitted, reimb_resolved, reimb_description, "
					+ "reimb_receipt, reimb_author, reimb_resolver, reimb_status_id, reimb_type_id) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pstate = conn.prepareStatement(sql);			
			pstate.setDouble(1, r.getAmount());
			pstate.setDate(2, r.getSubmitted());
			pstate.setDate(3, r.getResolved());
			pstate.setString(4, r.getDescription());
			pstate.setBlob(5, r.getReceipt());
			pstate.setInt(6, r.getAuthor().getUserId());
			pstate.setInt(7, r.getResolver().getUserId());
			pstate.setInt(8, r.getStatus().getStatusId());
			pstate.setInt(9, r.getType().getTypeId());
			
			if(pstate.executeUpdate() == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	@Override
	public List<Reimbursement> getReimbursements() {
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "select er.reimb_id, er.reimb_amount, er.reimb_submitted, er.reimb_resolved, er.reimb_description, er.reimb_receipt,\r\n"
					+ "au.ers_users_id as author_id, au.ers_username as author_un, au.ers_password as author_pw, au.user_first_name as author_fn, au.user_last_name as author_ln, au.user_email as author_em, au.user_role_id as author_ri, ar.user_role as author_rn,\r\n"
					+ "ru.ers_users_id as resolver_id, ru.ers_username as resolver_un, ru.ers_password as resolver_pw, ru.user_first_name as resolver_fn, ru.user_last_name as resolver_ln, ru.user_email as resolver_em, ru.user_role_id as resolver_ri, rr.user_role as resolver_rn,\r\n"
					+ "rs.reimb_status_id, rs.reimb_status, \r\n"
					+ "rt.reimb_type_id, rt.reimb_type\r\n"
					+ "from ers.reimbursement as er\r\n"
					+ "left join ers.users as au on er.reimb_author = au.ers_users_id\r\n"
					+ "left join ers.users as ru on er.reimb_resolver = ru.ers_users_id\r\n"
					+ "left join ers.reimbursement_status as rs on er.reimb_status_id = rs.reimb_status_id\r\n"
					+ "left join ers.reimbursement_type as rt on er.reimb_type_id = rt.reimb_type_id\r\n"
					+ "left join ers.user_roles as ar on au.user_role_id = ar.user_role_id\r\n"
					+ "left join ers.user_roles as rr on ru.user_role_id = rr.user_role_id;";
			List<Reimbursement> reimbursements = new ArrayList<>();
			Statement statement = conn.createStatement();			
			ResultSet rs = statement.executeQuery(sql);
			while (rs.next()) {
				int id = rs.getInt("reimb_id");
				double amount = rs.getDouble("reimb_amount");
				Date submitted = rs.getDate("reimb_submitted");
				Date resolved = rs.getDate("reimb_resolved");
				String description = rs.getString("reimb_description");
				Blob receipt = rs.getBlob("reimb_receipt");				
				User author = new User(rs.getInt("author_id"), rs.getString("author_un"), rs.getString("author_pw"),
						rs.getString("author_fn"), rs.getString("author_ln"), rs.getString("author_em"),
						new Role(rs.getInt("author_ri"), rs.getString("author_rn")));
				User resolver = new User(rs.getInt("resolver_id"), rs.getString("resolver_un"), rs.getString("resolver_pw"),
						rs.getString("resolver_fn"), rs.getString("resolver_ln"), rs.getString("resolver_em"),
						new Role(rs.getInt("resolver_ri"), rs.getString("resolver_rn")));
				Status status = new Status(rs.getInt("reimb_status_id"), rs.getString("reimb_status"));
				Type type = new Type(rs.getInt("reimb_type_id"), rs.getString("reimb_type"));
				reimbursements.add(new Reimbursement(id, amount, submitted, resolved,
					description, receipt, author, resolver, status, type));
			}
			return reimbursements;			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

	@Override
	public Reimbursement getReimbursementById(int rId) {
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "select er.reimb_id, er.reimb_amount, er.reimb_submitted, er.reimb_resolved, er.reimb_description, er.reimb_receipt,\r\n"
					+ "au.ers_users_id as author_id, au.ers_username as author_un, au.ers_password as author_pw, au.user_first_name as author_fn, au.user_last_name as author_ln, au.user_email as author_em, au.user_role_id as author_ri, ar.user_role as author_rn,\r\n"
					+ "ru.ers_users_id as resolver_id, ru.ers_username as resolver_un, ru.ers_password as resolver_pw, ru.user_first_name as resolver_fn, ru.user_last_name as resolver_ln, ru.user_email as resolver_em, ru.user_role_id as resolver_ri, rr.user_role as resolver_rn,\r\n"
					+ "rs.reimb_status_id, rs.reimb_status, \r\n"
					+ "rt.reimb_type_id, rt.reimb_type\r\n"
					+ "from ers.reimbursement as er\r\n"
					+ "left join ers.users as au on er.reimb_author = au.ers_users_id\r\n"
					+ "left join ers.users as ru on er.reimb_resolver = ru.ers_users_id\r\n"
					+ "left join ers.reimbursement_status as rs on er.reimb_status_id = rs.reimb_status_id\r\n"
					+ "left join ers.reimbursement_type as rt on er.reimb_type_id = rt.reimb_type_id\r\n"
					+ "left join ers.user_roles as ar on au.user_role_id = ar.user_role_id\r\n"
					+ "left join ers.user_roles as rr on ru.user_role_id = rr.user_role_id\r\n"
					+ "where reimb_id = ?;";
			Reimbursement reimb = null;
			PreparedStatement pstate = conn.prepareStatement(sql);
			pstate.setInt(1, rId);
			ResultSet rs = null;
			rs = pstate.executeQuery();
			while (rs.next()) {
				int id = rs.getInt("reimb_id");
				double amount = rs.getDouble("reimb_amount");
				Date submitted = rs.getDate("reimb_submitted");
				Date resolved = rs.getDate("reimb_resolved");
				String description = rs.getString("reimb_description");
				Blob receipt = rs.getBlob("reimb_receipt");				
				User author = new User(rs.getInt("author_id"), rs.getString("author_un"), rs.getString("author_pw"),
						rs.getString("author_fn"), rs.getString("author_ln"), rs.getString("author_em"),
						new Role(rs.getInt("author_ri"), rs.getString("author_rn")));
				User resolver = new User(rs.getInt("resolver_id"), rs.getString("resolver_un"), rs.getString("resolver_pw"),
						rs.getString("resolver_fn"), rs.getString("resolver_ln"), rs.getString("resolver_em"),
						new Role(rs.getInt("resolver_ri"), rs.getString("resolver_rn")));
				Status status = new Status(rs.getInt("reimb_status_id"), rs.getString("reimb_status"));
				Type type = new Type(rs.getInt("reimb_type_id"), rs.getString("reimb_type"));
				reimb = new Reimbursement(id, amount,submitted, resolved, description,
						receipt, author, resolver, status, type);
			}
			return reimb;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return null;
	}

	@Override
	public boolean updateReimbursement(Reimbursement r) {		
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "update ers.reimbursement set reimb_amount = ?, reimb_submitted = ?, reimb_resolved = ? , "
					+ "reimb_description = ?, reimb_receipt = ?, reimb_author = ?, reimb_resolver = ?, "
					+ "reimb_status_id= ?, reimb_type_id = ? where reimb_id = ?";
			PreparedStatement pstate = conn.prepareStatement(sql);
			pstate.setDouble(1, r.getAmount());
			pstate.setDate(2, r.getSubmitted());
			pstate.setDate(3, r.getResolved());
			pstate.setString(4, r.getDescription());
			pstate.setBlob(5, r.getReceipt());
			pstate.setInt(6, r.getAuthor().getUserId());
			pstate.setInt(7, r.getResolver().getUserId());
			pstate.setInt(8, r.getStatus().getStatusId());
			pstate.setInt(9, r.getType().getTypeId());
			pstate.setInt(10, r.getId());			
			if(pstate.executeUpdate() == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return false;
	}

	@Override
	public boolean deleteReimbursement(int rId) {
		try (Connection conn = ConnectionUtility.getConnection()) {
			String sql = "delete from ers.reimbursement where reimb_id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);			
			ps.setInt(1, rId);			
			if(ps.executeUpdate() == 1)
				return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
