package com.hot6.project.interceptor;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class ServerConfigure implements WebMvcConfigurer {
	//로그인 상태에서만 이동 가능한 URL
	private static final List<String> URL_PATTERNS = Arrays.asList(
			"/board/boardWriteOk", "/board/imageUpload", "/board/imageSubmit", "/board/boardDelete",
			"/board/boardEditOk", "/board/replyWrite", "/board/replyDel", "/board/replyEditOk",
			"/study/calendar/calendarList", "/study/calendar/calendarLists", "/study/calendar/calendarWrite", 
			"/study/calendar/calendarDel","/study/calendar/calendarEdit", "/study/calendar/calendarDrag", 
			"/users/mypage/study", "/users/mypage/viewWrite", "/users/mypage/viewComment", "/users/userEdit", 
			"/users/userEditOk", "/users/userDel",
			"/qna/likeUp", "/qna/likeDown", "/qna/replySelect", "/qna/replySelectDel", "/qna/qnaWrite", "/qna/qnaEdit", 
			"/study/webSocket/screenShare", "/study/webSocket/audio", "/canvas", "/study/webSocket/chatPage",
			"/study/webSocket/studyBottom", "/study/webSocket/studyPageChat", "/study/webSocket/studyPageMatesList", 
			"/study/webSocket/studySidebar", "/compiler", "/study/webSocket/studyPage");
	
	//권한이 admin인 사용자만 이동 가능한 URL
	private static final List<String> URL_PATTERNS_ADMIN = Arrays.asList(
			"/admin/notice/noticeWrite", "/admin/notice/noticeEdit", "/admin/adminUsers",
			"/admin/sendBackUser");
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns(URL_PATTERNS);
		registry.addInterceptor(new AdminInterceptor()).addPathPatterns(URL_PATTERNS_ADMIN);
	}
}
