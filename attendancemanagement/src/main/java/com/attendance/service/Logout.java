package com.attendance.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Logout implements AttendanceService {

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		return "index.jsp";
	}

}
