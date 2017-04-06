package com.attendance.service.impl.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.attendance.entity.Department;
import com.attendance.entity.Subjects;
import com.attendance.service.AttendanceService;

public class SubjectsRegister implements AttendanceService {

	private boolean status;

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();

		Query query = session.createQuery("FROM Department");
		@SuppressWarnings("unchecked")
		List<Department> departmentsList = query.list();

		for (Department department : departmentsList) {
			if (department.getDepartment_name() != null)
				if (department.getDepartment_name().equals(request.getParameter("departmentlist"))) {
					int a = 0;
					do {
						String subjectList = "subject" + a;
						if (request.getParameter(subjectList) != null) {
							System.out.println(subjectList);
							String subject = request.getParameter(subjectList);
							Subjects subjects = new Subjects();
							subjects.setDepart_id(department.getId());
							subjects.setSubject_name(subject);
							subjects.setSemester(Integer.parseInt(request.getParameter("semersterlist")));
							session.save(subjects);
							status = true;
						} else {
							status = false;
						}
						a++;
					} while (status);
				}
		}
		transaction.commit();
		session.close();
		return "pages-admin/add-subjects.jsp";
	}

}
