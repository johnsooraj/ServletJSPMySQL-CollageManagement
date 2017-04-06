package com.attendance.service.impl.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

import com.attendance.entity.Department;
import com.attendance.service.AttendanceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ViewAddSubject implements AttendanceService {

	String jsonData;

	@SuppressWarnings("unchecked")
	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		SessionFactory factory = (SessionFactory) request.getServletContext().getAttribute("sessionfactory");
		Session session = factory.openSession();
		List<Department> departmentsList = session.createCriteria(Department.class)
				.setProjection(Projections.distinct(Projections.property("department_name"))).list();
		
		System.out.println(departmentsList);
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			jsonData = objectMapper.writeValueAsString(departmentsList);
		} catch (JsonProcessingException e) {
		}
		return jsonData;
	}

}
