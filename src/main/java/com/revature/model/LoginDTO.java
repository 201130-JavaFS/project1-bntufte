package com.revature.model;

public class LoginDTO {
	public String username;
	public String password;	
	
	public LoginDTO() {
		super();
	}

	public LoginDTO(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}	
}
