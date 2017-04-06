package com.attendance.service.impl.admin;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.service.AttendanceService;

public class PrintTimeTable implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("PrintTimeTable()");

		String[] subject = request.getParameterValues("subjectList");
		List<String> list = Arrays.asList(subject);
		
		request.getSession().setAttribute("subjectNames", list);
		System.out.println("list object are - "+list);
		return "hello";
	}

}
