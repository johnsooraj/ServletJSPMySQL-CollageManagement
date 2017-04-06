package com.attendance.service.impl.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.attendance.entity.LoginCredentials;
import com.attendance.service.AttendanceService;

public class AdminRegister implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginCredentials credentials = new LoginCredentials();
		credentials.setUsername(username);
		credentials.setPassword(password);
		credentials.setPersonName("admin");
		credentials.setType("admin");
		session.save(credentials);
		transaction.commit();
		return "pages-admin/adminhome.jsp";
	}

}
