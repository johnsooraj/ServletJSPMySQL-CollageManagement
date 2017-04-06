package com.attendance.entity;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class AttendanceEntry {

	@Id
	@Column
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;

	@Column
	private String studentName;

	@Column
	private boolean attendanceStatus;

	@Column
	private LocalDateTime dateTime;

	public AttendanceEntry() {

	}

	public AttendanceEntry(Integer id, String studentName, boolean attendanceStatus, LocalDateTime dateTime) {
		super();
		this.id = id;
		this.studentName = studentName;
		this.attendanceStatus = attendanceStatus;
		this.dateTime = dateTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public boolean isAttendanceStatus() {
		return attendanceStatus;
	}

	public void setAttendanceStatus(boolean attendanceStatus) {
		this.attendanceStatus = attendanceStatus;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

	@Override
	public String toString() {
		return "AttendanceEntry [id=" + id + ", studentName=" + studentName + ", attendanceStatus=" + attendanceStatus
				+ ", dateTime=" + dateTime + "]";
	}

}
