package com.revature.model;

public class ReimbDTO {
	public double amount;
	public String description;
	public String type;
	
	public ReimbDTO() {
		super();
	}

	public ReimbDTO(double amount, String description, String type) {
		super();
		this.amount = amount;
		this.description = description;
		this.type = type;
	}	
}
