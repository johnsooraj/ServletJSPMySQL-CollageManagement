package com.attendance.service.impl.staff;

import java.time.LocalDateTime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.attendance.entity.AttendanceEntry;
import com.attendance.service.AttendanceService;

public class StudentAttendance implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		String[] names = request.getParameterValues("listValue");
		
		for (int i = 0; i < names.length; i++) {
			AttendanceEntry attendanceEntry = new AttendanceEntry();
			attendanceEntry.setStudentName(names[i]);
			attendanceEntry.setDateTime(LocalDateTime.now());
			attendanceEntry.setAttendanceStatus(true);
			session.save(attendanceEntry);
		}
		
		transaction.commit();
		return "attendance added";
	}

}
