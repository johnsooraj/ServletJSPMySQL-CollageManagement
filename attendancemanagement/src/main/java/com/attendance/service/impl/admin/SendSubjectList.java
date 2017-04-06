package com.attendance.service.impl.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.service.AttendanceService;

public class SendSubjectList implements AttendanceService{

	@Override
	public String service(HttpServletRequest request, HttpServletResponse response) {
		
		return "pages-admin/invoice-print.jsp";
	}

}
