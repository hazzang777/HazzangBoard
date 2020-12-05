package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.MessageVO;
import org.zerock.mapper.MessageMapper;

import lombok.Setter;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Setter(onMethod_=@Autowired) 
	private MessageMapper messageMapper;

	@Override
	public void addMessage(MessageVO vo) {
		
		// 메시지 테이블에 저장
		messageMapper.create(vo);
	}

	// 안읽은 메시지 수 가져오기	
	@Override
	public int getMessageCount(String targetid) {
		
		return messageMapper.getMsgCnt(targetid);
		
	}

	@Override
	public List<MessageVO> getReceiveMsg(String targetid) {
		
		return messageMapper.myReceiveMsg(targetid);
	}

	@Override
	public List<MessageVO> getSendMsg(String sender) {
		
		return messageMapper.mySendMsg(sender);
	}

	@Override
	public MessageVO get(int mid, String id) {
		return messageMapper.get(mid, id);
	}

	@Override
	public int updateR(int mid, String id) {
		
		return messageMapper.updateReads(mid, id);
	}

	@Override
	public int remove(int mid) {
		
		return messageMapper.delete(mid);
	}
	
	
	
	
	
	
	
	
}
