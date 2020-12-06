package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	public void insert(MemberVO vo);
	
	public int idCheck(String id);
	
	public int delete(String id);
	
	
}
