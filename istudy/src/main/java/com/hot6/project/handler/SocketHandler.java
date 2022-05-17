package com.hot6.project.handler;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class SocketHandler extends TextWebSocketHandler {
   
   List<WebSocketSession> sessions = new ArrayList<WebSocketSession>(); //웹소켓 세션을 담아둘 리스트
  
   
   @SuppressWarnings("unchecked")
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
       //소켓 연결시
       super.afterConnectionEstablished(session);
       sessions.add(session);
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
       //소켓 종료시
       sessions.remove(session);
       super.afterConnectionClosed(session, status);
   }
   
   @Override
   public void handleTextMessage(WebSocketSession session, TextMessage message) {
       //메시지 발송시 받게 됨 (send() 호출시)
       message.getPayload();
       for(WebSocketSession s : sessions) {
           try {
        	   if (s.getId() != session.getId())
        		   s.sendMessage(message);
           } catch (Exception e) {
               e.printStackTrace();
           }
       }
   }
}