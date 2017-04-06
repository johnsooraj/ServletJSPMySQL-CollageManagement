package com.attendance.service.impl.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.attendance.entity.LoginCredentials;
import com.attendance.entity.StaffData;
import com.attendance.service.AttendanceService;

public class StaffRegistration implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		StaffData data = new StaffData();

		data.setName(request.getParameter("name"));
		data.setAge(Byte.parseByte(request.getParameter("age")));
		data.setDate(request.getParameter("dateofbirth"));
		data.setEmail(request.getParameter("email"));
		data.setPhone(request.getParameter("phone"));
		data.setDesignation(request.getParameter("designation"));
		data.setStreet(request.getParameter("street"));
		data.setAddress(request.getParameter("address"));
		data.setDepartment(request.getParameter("departmentlist"));

		LoginCredentials credentials = new LoginCredentials();
		credentials.setUsername(request.getParameter("username"));
		credentials.setPassword(request.getParameter("password"));
		credentials.setPersonName(request.getParameter("name"));
		credentials.setType("staff");

		data.setCredentials(credentials);

		session.save(data);

		transaction.commit();

		return "pages-admin/add-staff.jsp";
	}

}
