package com.attendance.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.attendance.service.AttendanceService;
import com.attendance.service.Login;
import com.attendance.service.Logout;
import com.attendance.service.impl.admin.AdminRegister;
import com.attendance.service.impl.admin.DepartmentRegister;
import com.attendance.service.impl.admin.LiveAjaxResponse;
import com.attendance.service.impl.admin.PageRedirection;
import com.attendance.service.impl.admin.PrintTimeTable;
import com.attendance.service.impl.admin.SendSubjectList;
import com.attendance.service.impl.admin.StaffRegistration;
import com.attendance.service.impl.admin.StudentRegister;
import com.attendance.service.impl.admin.SubjectsRegister;
import com.attendance.service.impl.admin.ViewAddSubject;
import com.attendance.service.impl.staff.StudentAttendance;

public class AttendanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Map<String, Object> tasks = new HashMap<>();

	public AttendanceController() {
		super();
		tasks.put("login", new Login());
		tasks.put("logout", new Logout());
		tasks.put("pageredirection", new PageRedirection());
		tasks.put("registerdepartment", new DepartmentRegister());
		tasks.put("registersubjects", new SubjectsRegister());
		tasks.put("ajaxviewdepartmentname", new ViewAddSubject());
		tasks.put("liveajaxresponse", new LiveAjaxResponse());
		tasks.put("staffregistration", new StaffRegistration());
		tasks.put("studentregistration", new StudentRegister());
		tasks.put("staffAjaxResponse", new StudentRegister());
		tasks.put("adminRegister", new AdminRegister());
		tasks.put("studentAttendanceList", new StudentAttendance());
		tasks.put("printTimeTable", new PrintTimeTable());
		tasks.put("sendSubjectList", new SendSubjectList());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("HIDDEN VALUE "+request.getParameter("hidden"));
		AttendanceService action = (AttendanceService) tasks.get(request.getParameter("hidden"));
		response.getWriter().write((action.service(request, response)));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AttendanceService action = (AttendanceService) tasks.get(request.getParameter("hidden"));
		request.getRequestDispatcher(action.service(request, response)).forward(request, response);
	}

}
