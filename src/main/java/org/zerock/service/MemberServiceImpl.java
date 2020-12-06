package org.zerock.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.BoardAttachMapper;
import org.zerock.mapper.BoardMapper;
import org.zerock.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_=@Autowired)
	private MemberMapper memberMapper;
	
	@Setter(onMethod_ = @Autowired )
	 private PasswordEncoder pwencoder;
	 
	
	@Override
	public void insert(MemberVO vo) {
		
		log.info("회원가입중..." + vo);
		
		String uupw = pwencoder.encode(vo.getUserpw());
		vo.setUserpw(uupw);
		
		memberMapper.insert(vo);
	}


	@Override
	public int idCheck(String id) {
		
		return memberMapper.idCheck(id);
	}

	
	@Override
	public int delete(String id) {
		 
		return memberMapper.delete(id);
		 
	}
	
	
	
	
}
