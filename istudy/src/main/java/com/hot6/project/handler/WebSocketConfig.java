package com.hot6.project.handler;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;
import org.springframework.web.socket.server.standard.ServletServerContainerFactoryBean;

	@Configuration
	@EnableWebSocket
	public class WebSocketConfig implements WebSocketConfigurer {
		@Bean
		public ServletServerContainerFactoryBean createWebSocketContainer() {
		    ServletServerContainerFactoryBean container = new ServletServerContainerFactoryBean();
		    container.setMaxTextMessageBufferSize(500000);
		    container.setMaxBinaryMessageBufferSize(500000);
		    return container;
		}
		
		@Override
		public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
			// TODO Auto-generated method stub
			registry.addHandler(new SocketHandler(), "/chating").setAllowedOrigins("*");
			registry.addHandler(new ScreenShareSocketHandler(), "/socket").setAllowedOrigins("*");
			registry.addHandler(new WhiteBoardSocketHandler(), "/WBsocket").setAllowedOrigins("*");
		}
		
	}
