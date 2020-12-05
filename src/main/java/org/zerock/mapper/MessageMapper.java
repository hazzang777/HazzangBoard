package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MessageVO;

public interface MessageMapper {
	
	// 메시지 생성
	public void create(MessageVO vo);
	
	// 안읽은 메시지
	public int getMsgCnt(String targetid);
	
	// 받은 메시지
	public List<MessageVO> myReceiveMsg(String targetid);
	
	// 보낸 메시지
	public List<MessageVO> mySendMsg(String sender);
	
	// 메시지 하나 눌렀을때 상세내용
	public MessageVO get(@Param("mid") int mid,@Param("id") String id);
	
	// 상세내용 누를 때 읽은 상태로 바꾸기
	public int updateReads(@Param("mid") int mid,@Param("id") String id);
}
