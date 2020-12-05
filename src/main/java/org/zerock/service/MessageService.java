package org.zerock.service;

import java.util.List;

import org.zerock.domain.MessageVO;

public interface MessageService {
	// 메시지 추가
	public void addMessage(MessageVO vo);
	
	// 메시지 수
	public int getMessageCount(String targetid);
	
	// 받은 메시지 가져오기
	public List<MessageVO> getReceiveMsg(String targetid);
	
	
	// 보낸 메시지 가져오기
	public List<MessageVO> getSendMsg(String sender);
	
	// 상세내용
	public MessageVO get(int mid, String id);
	
	// 상태바꾸기
	public int updateR(int mid, String id);
	
	// 메시지 삭제
	public int remove(int mid);
}
