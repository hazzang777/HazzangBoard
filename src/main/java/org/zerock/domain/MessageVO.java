package org.zerock.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MessageVO {
	
	private int mid;
	private String targetid; // 수신자
	private String sender; // 발신자
	private String message; // 메세지
	private String reads; // 읽은 상태
	private Date opendate;
	private Date senddate;
}
