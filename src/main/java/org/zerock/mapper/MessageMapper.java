package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.Criteria;
import org.zerock.domain.MessageVO;

public interface MessageMapper {
	
	// 메시지 생성
	public void create(MessageVO vo);
	
	// 안읽은 메시지
	public int getMsgCnt(@Param("targetid") String targetid);
	
	// 받은 메시지
	public List<MessageVO> myReceiveMsg(String targetid);
	
	// 보낸 메시지
	public List<MessageVO> mySendMsg(String sender);
	
	// 메시지 하나 눌렀을때 상세내용
	public MessageVO get(@Param("mid") int mid,@Param("id") String id);
	
	// 상세내용 누를 때 읽은 상태로 바꾸기
	public int updateReads(@Param("mid") int mid,@Param("id") String id);
	
	// 메시지 삭제 기능
	public int delete(int mid);
	
	// 받은 메시지 페이징 처리
	public List<MessageVO> myReceiveMsgPaging(Criteria cri, String targetid);
	
	// 받은 메시지 페이징 처리
	public List<MessageVO> mySendMsgPaging(Criteria cri, String sender);
}
