package org.zerock.handler;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.zerock.mapper.MessageMapper;

import lombok.extern.log4j.Log4j;

@Component
@Repository
@Log4j
public class MyHandler extends TextWebSocketHandler {

		@Autowired
		SqlSession sqlsession;

		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			
		}

		@Override
		protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
			MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
			log.info(message.getPayload());
			CharSequence cs = String.valueOf(mapper.getMsgCnt(message.getPayload()));
			session.sendMessage(new TextMessage(cs));
		}

		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			
		}
	
		
	
}
