package com.attendance.service.impl.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;

import com.attendance.entity.Department;
import com.attendance.entity.StaffData;
import com.attendance.entity.StudentData;
import com.attendance.service.AttendanceService;

public class PageRedirection implements AttendanceService {

	@SuppressWarnings("unchecked")
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();

		if (request.getParameter("pageredirection").equals("adminhome")) {
			return "pages-admin/adminhome.jsp";
		} else if (request.getParameter("pageredirection").equals("studentview")) {
			return "pages-admin/view-student.jsp";
		} else if (request.getParameter("pageredirection").equals("staffview")) {
			return "pages-admin/view-staff.jsp";
		} else if (request.getParameter("pageredirection").equals("departmentview")) {
			List<Department> departments = session.createCriteria(Department.class).list();
			request.getSession().setAttribute("viewdepartment", departments);
			return "pages-admin/view-dept.jsp";
		} else if (request.getParameter("pageredirection").equals("addstudent")) {
			return "pages-admin/add-student.jsp";
		} else if (request.getParameter("pageredirection").equals("addstaff")) {
			return "pages-admin/add-staff.jsp";
		} else if (request.getParameter("pageredirection").equals("adddepartment")) {
			return "pages-admin/add-dept.jsp";
		} else if (request.getParameter("pageredirection").equals("viewtimetable")) {
			return "pages-admin/view-timetable.jsp";
		} else if (request.getParameter("pageredirection").equals("generatetimetable")) {
			return "pages-admin/generatetimetable.jsp";
		} else if (request.getParameter("pageredirection").equals("adminregister")) {
			return "pages-admin/admin-registration.jsp";
		} else if (request.getParameter("pageredirection").equals("addsubjects")) {
			return "pages-admin/add-subjects.jsp";
		} else if (request.getParameter("pageredirection").equals("staffHome")) {
			return "pages-staff/staff-home.jsp";
		} else if (request.getParameter("pageredirection").equals("staffStudentView")) {
			return "pages-staff/staff-view-student.jsp";
		} else if (request.getParameter("pageredirection").equals("studentAttendance")) {

			List<StaffData> datas = (List<StaffData>) request.getSession().getAttribute("userData");
			if (datas != null | datas.isEmpty() | datas.get(0).getDepartment() != null) {
				List<StudentData> datas2 = session.createCriteria(StudentData.class)
						.add(Restrictions.eq("department", datas.get(0).getDepartment())).list();
				if (datas2 != null | datas2.isEmpty()) {
					request.getSession().setAttribute("sutudentDataByDepartment", datas2);
					System.out.println("STUDENT DATA BY DEPARTMENT " + datas2);
					return "pages-staff/staff-studnet-attendance.jsp";
				} else {
					return "pages-staff/staff-home.jsp";
				}
			} else {
				return "pages-staff/staff-home.jsp";
			}
		} else {
			return "";
		}
	}

}
