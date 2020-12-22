package com.revature.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionUtility {

	private static Connection connection;
	
	public static Connection getConnection() throws SQLException {
		boolean isTest = Boolean.valueOf(System.getenv("DB_TEST"));
		if (isTest) {			
			return getH2Connection();			
		} else {
			try {
				Class.forName("org.postgresql.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			String url = System.getenv("JDBC_DB_HOST2");
			String username = System.getenv("JDBC_DB_USER");
			String password = System.getenv("JDBC_DB_PASS");

			if (connection == null || connection.isClosed()) {
				connection = DriverManager.getConnection(url, username, password);
			}

			return connection;
		}
	}

	public static Connection getH2Connection() {
		try {			
			if (connection == null || connection.isClosed()) {
				connection = DriverManager.getConnection("jdbc:h2:~/test");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return connection;
	}
	
//	public static void main(String[] args) {
//		
//		//Try with resources block. The try statement will stake a method that creates a resource, that will
//		//automatically be closed at the end of the try or catch block. It avoids the need for a finally block.
//		try(Connection conn = ConnectionUtility.getConnection()){
//			System.out.println("connection successful");
//		} catch(SQLException e) {
//			e.printStackTrace();
//		}
//	}
	
}
