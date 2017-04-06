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
public class StaffData implements Serializable {

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

	@Column(name = "designation")
	private String designation;

	@Column(name = "street")
	private String street;

	@Column(name = "address")
	private String address;

	@Column(name = "department")
	private String department;

	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	private LoginCredentials credentials;

	public StaffData() {

	}

	public StaffData(Integer id, String name, Byte age, String date, String phone, String email, String designation,
			String street, String address, String department, LoginCredentials credentials) {
		super();
		this.id = id;
		this.name = name;
		this.age = age;
		this.date = date;
		this.phone = phone;
		this.email = email;
		this.designation = designation;
		this.street = street;
		this.address = address;
		this.department = department;
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

	public String getDesignation() {
		return designation;
	}

	public void setDesignation(String designation) {
		this.designation = designation;
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

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public LoginCredentials getCredentials() {
		return credentials;
	}

	public void setCredentials(LoginCredentials credentials) {
		this.credentials = credentials;
	}

	@Override
	public String toString() {
		return "StaffData [id=" + id + ", name=" + name + ", age=" + age + ", date=" + date + ", phone=" + phone
				+ ", email=" + email + ", designation=" + designation + ", street=" + street + ", address=" + address
				+ ", department=" + department + "]";
	}

}
