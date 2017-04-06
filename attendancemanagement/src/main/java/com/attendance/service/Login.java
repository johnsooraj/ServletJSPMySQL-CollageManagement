package com.attendance.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.attendance.entity.LoginCredentials;
import com.attendance.entity.StaffData;

public class Login implements AttendanceService {

	@SuppressWarnings("unchecked")
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		if (request.getParameter("username").equals("") | request.getParameter("password").equals("")) {
			return "index.jsp";
			// return "pages-admin/adminhome.jsp";
		}

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();

		List<LoginCredentials> credentials = session.createCriteria(LoginCredentials.class)
				.add(Restrictions.eq("username", request.getParameter("username")))
				.add(Restrictions.eq("password", request.getParameter("password"))).list();

		System.out.println(credentials);

		if (credentials.isEmpty()) {
			return "index.jsp";
		}

		if (credentials.get(0).getType().equals("staff")) {
			List<StaffData> datasStaff = session.createCriteria(StaffData.class)
					.add(Restrictions.eq("name", credentials.get(0).getPersonName())).list();

			System.out.println(datasStaff);

			if (datasStaff != null) {
				request.getSession().setAttribute("userData", datasStaff);
			} else {
				return "index.jsp";
			}
			return "pages-staff/staff-home.jsp";
		} else if (credentials.get(0).getType().equals("admin")) {
			return "pages-admin/adminhome.jsp";
		} else {
			return "index.jsp";
		}

	}

}
