/*
 * package com.hot6.project;
 * 
 * import javax.servlet.http.HttpServletRequest; import
 * javax.servlet.http.HttpServletResponse; import
 * javax.servlet.http.HttpSession; import
 * org.springframework.web.servlet.HandlerInterceptor;
 * 
 * public class LoginInterceptor implements HandlerInterceptor{
 * 
 * @Override public boolean preHandle(HttpServletRequest request,
 * HttpServletResponse response, Object handler) throws Exception{
 * 
 * // false: 로그인으로 / true: 정상 작동 HttpSession session = request.getSession();
 * 
 * // 로그인 상태 구하기 String logStatus = (String) session.getAttribute("logStatus");
 * if(logStatus !=null && logStatus.equals("Y")){ return true; }else {
 * response.sendRedirect("/users/mypage/login"); return false; }
 * 
 * }
 * 
 * }
 */