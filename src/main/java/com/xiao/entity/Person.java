package com.xiao.entity;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;

public class Person {
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@NotEmpty(message="{userId}")
	private String name;
	@Pattern(regexp="[0-9a-zA-Z]{1,5}", message="{userPassword}")
	private String password;
	
	
}
