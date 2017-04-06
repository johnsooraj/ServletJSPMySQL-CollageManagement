package com.attendance.entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table
public class StudentData implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column(name = "name")
	private String name;

	@Column(name = "age")
	private Byte age;

	@Column(name = "date")
	private String date;

	@Column(name = "phone")
	private String phone;

	@Column(name = "email")
	private String email;

	@Column(name = "department")
	private String department;

	@Column(name = "street")
	private String street;

	@Column(name = "address")
	private String address;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private LoginCredentials credentials;

	public StudentData() {

	}

	public StudentData(Integer id, String name, Byte age, String date, String phone, String email, String department,
			String street, String address, LoginCredentials credentials) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.date = date;
		this.phone = phone;
		this.email = email;
		this.department = department;
		this.street = street;
		this.address = address;
		this.credentials = credentials;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Byte getAge() {
		return age;
	}

	public void setAge(Byte age) {
		this.age = age;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public LoginCredentials getCredentials() {
		return credentials;
	}

	public void setCredentials(LoginCredentials credentials) {
		this.credentials = credentials;
	}

	@Override
	public String toString() {
		return "StudentData [id=" + id + ", name=" + name + ", age=" + age + ", date=" + date + ", phone=" + phone
				+ ", email=" + email + ", department=" + department + ", street=" + street + ", address=" + address
				+ "]";
	}
}
