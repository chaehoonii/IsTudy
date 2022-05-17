package com.hot6.project;

import java.util.Arrays;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@Configuration
public class ServerConfigurer implements WebMvcConfigurer {

	/*
	 * private static final List<String> URL_PATERRNS =
	 * Arrays.asList("/admin/notice/adminNoticeEdit",
	 * "/admin/notice/adminNoticeWrite", "/notice/noticeList");
	 */

	/*
	 * public void addInterceptors(InterceptorRegistry registry) {
	 * registry.addInterceptor(new
	 * LoginInterceptor()).addPathPatterns(URL_PATERRNS); }
	 */

	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/ckUpload/**").addResourceLocations("/ckUpload/notice/");
	}

	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
		commonsMultipartResolver.setDefaultEncoding("UTF-8");
		return commonsMultipartResolver;
	}

}
