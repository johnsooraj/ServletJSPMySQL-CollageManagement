package com.attendance.service.impl.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.attendance.entity.Department;
import com.attendance.service.AttendanceService;

public class DepartmentRegister implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		
		Department department = new Department();
		department.setDepartment_name(request.getParameter("departmentname"));
		session.save(department);
		transaction.commit();
		System.out.println("NEW DEPARTMENT SAVED");

		session.close();

		return "pages-admin/add-dept.jsp";
	}

}
