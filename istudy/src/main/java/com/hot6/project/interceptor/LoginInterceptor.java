package com.hot6.project.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

//로그인이 되어있는 상태에서만 이동 가능하도록 설정
//로그인이 되어있지 않으면 로그인 페이지로 이동
public class LoginInterceptor implements HandlerInterceptor {
	//컨트롤러가 호출되기 전에 실행 될 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		//false : 로그인 페이지로 보내기
		//true : 해당 컨트롤러(이동하려던 url)로 이동
		
		//request객체에서 session객체를 얻어오기
		HttpSession session = request.getSession();
		
		//로그인 상태 구하기
		String logStatus = (String)session.getAttribute("logStatus");
		
		if(logStatus!=null && logStatus.equals("Y")) {
			return true;
		}else {
			response.sendRedirect("/users/login");
		}
		
		return false;
	}
}
