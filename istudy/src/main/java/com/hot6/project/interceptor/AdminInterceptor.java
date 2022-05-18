package com.hot6.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

//권한이 admin이 아니라면 페이지 이동을 하지 않음
public class AdminInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		HttpSession session = request.getSession();

		String logPermission = (String)session.getAttribute("logPermission");
		
		if(logPermission!=null && logPermission.equals("admin")) {
			return true;
		}
		response.sendRedirect("javascript:history.back()");
		return false;
	}
}
