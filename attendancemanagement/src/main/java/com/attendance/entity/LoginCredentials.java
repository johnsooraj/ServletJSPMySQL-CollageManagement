package com.attendance.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class LoginCredentials implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String username;

	@Column
	private String password;

	@Column
	private String type;

	@Column
	private String personName;

	public LoginCredentials() {

	}

	public LoginCredentials(Integer id, String username, String password, String type, String personName) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.type = type;
		this.personName = personName;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPersonName() {
		return personName;
	}

	public void setPersonName(String personName) {
		this.personName = personName;
	}

	@Override
	public String toString() {
		return "LoginCredentials [id=" + id + ", username=" + username + ", password=" + password + ", type=" + type
				+ ", personName=" + personName + "]";
	}

}
