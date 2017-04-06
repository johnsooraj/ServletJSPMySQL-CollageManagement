package com.attendance.controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.hibernate.SessionFactory;

import com.attendance.hiberutility.HibernateUtil;

@WebListener
public class AttendanceListener implements ServletContextListener {

	public AttendanceListener() {
		System.out.println("INVOKING ATTENDANCE LISTENER");
	}

	public void contextInitialized(ServletContextEvent contextEvent) {
		System.out.println("INITIALIZING DATABASE CONNECTION");

		SessionFactory factory = HibernateUtil.getSessionFactory();
		if (factory != null) {
			System.out.println("SESSION FACTORY INITIALIZED AND READY TO SERVE");
			contextEvent.getServletContext().setAttribute("sessionfactory", factory);
		} else {
			System.out.println("SESSION FACTORY INITIALIZATION FAILED");
		}
	}

	public void contextDestroyed(ServletContextEvent contextEvent) {

	}

}
