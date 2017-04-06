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
public class Subjects implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private Integer depart_id;

	@Column
	private String subject_name;

	@Column
	private Integer semester;

	public Subjects() {

	}

	public Subjects(Integer id, Integer depart_id, String subject_name, Integer semester) {
		super();
		this.id = id;
		this.depart_id = depart_id;
		this.subject_name = subject_name;
		this.semester = semester;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDepart_id() {
		return depart_id;
	}

	public void setDepart_id(Integer depart_id) {
		this.depart_id = depart_id;
	}

	public String getSubject_name() {
		return subject_name;
	}

	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public Integer getSemester() {
		return semester;
	}

	public void setSemester(Integer semester) {
		this.semester = semester;
	}

	@Override
	public String toString() {
		return "Subjects [id=" + id + ", depart_id=" + depart_id + ", subject_name=" + subject_name + ", semester="
				+ semester + "]";
	}

}
