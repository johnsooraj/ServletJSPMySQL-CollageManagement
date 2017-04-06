package com.attendance.service.impl.admin;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import com.attendance.entity.Department;
import com.attendance.entity.StaffData;
import com.attendance.entity.StudentData;
import com.attendance.entity.Subjects;
import com.attendance.service.AttendanceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class LiveAjaxResponse implements AttendanceService {

	String jsonData = null;

	@SuppressWarnings("unchecked")
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("hit");
		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();

		if (request.getParameter("liveajaxdepartmentid").equals("liveajaxdepartmentid")) {

			Criteria query = session.createCriteria(Department.class);
			List<Department> departments = query.add(
					Restrictions.like("department_name", request.getParameter("departmentnameletter"), MatchMode.START))
					.list();
			System.out.println(departments);
			if (!departments.isEmpty()) {

				return "false";
			} else {
				return "true";
			}
		} else if (request.getParameter("liveajaxdepartmentid").equals("liveAjaxStudentDetailsByDepartment")) {
			String jsonData = null;
			String departmentName = request.getParameter("departname");
			List<StudentData> studentDatas = session.createCriteria(StudentData.class)
					.add(Restrictions.eq("department", departmentName)).list();

			System.out.println(studentDatas);
			ObjectMapper objectMapper = new ObjectMapper();
			try {
				jsonData = objectMapper.writeValueAsString(studentDatas);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return jsonData;
		} else if (request.getParameter("liveajaxdepartmentid").equals("liveAjaxStaffDetailsByDepartment")) {
			String departmentName = request.getParameter("departname");
			List<StaffData> studentDatas = session.createCriteria(StaffData.class)
					.add(Restrictions.eq("department", departmentName)).list();

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				jsonData = objectMapper.writeValueAsString(studentDatas);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return jsonData;
		} else if (request.getParameter("liveajaxdepartmentid").equals("getTotalNumbers")) {
			HashMap<String, Integer> totalNumbers = new HashMap<>();

			List<StudentData> studentDatas = (List<StudentData>) session.createCriteria(StudentData.class).list();
			List<StaffData> staffDatas = (List<StaffData>) session.createCriteria(StaffData.class).list();
			List<Department> departmentData = (List<Department>) session.createCriteria(Department.class).list();
			List<Subjects> subjectData = (List<Subjects>) session.createCriteria(Subjects.class).list();

			totalNumbers.put("studentNumber", studentDatas.size());
			totalNumbers.put("staffNumber", staffDatas.size());
			totalNumbers.put("departmentNumber", departmentData.size());
			totalNumbers.put("subjectNumber", subjectData.size());

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				jsonData = objectMapper.writeValueAsString(totalNumbers);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return jsonData;
		} else if (request.getParameter("liveajaxdepartmentid").equals("getSubjectsBySemester")) {

			// Time table creation
			List<Department> departments = (List<Department>) session.createCriteria(Department.class)
					.add(Restrictions.eq("department_name", request.getParameter("departmentName"))).list();

			Query query = session
					.createQuery("FROM Subjects sub where sub.depart_id =:deptId and sub.semester =:semId");
			query.setParameter("deptId", departments.get(0).getId());
			query.setParameter("semId", Integer.parseInt(request.getParameter("semsterNumber")));

			List<Subjects> subjectData = query.list();

			System.out.println(subjectData);

			ObjectMapper objectMapper = new ObjectMapper();
			try {
				jsonData = objectMapper.writeValueAsString(subjectData);
			} catch (JsonProcessingException e) {
				e.printStackTrace();
			}
			return jsonData;
		} else {
			return "empty";
		}

	}

}
