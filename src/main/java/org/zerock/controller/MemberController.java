package org.zerock.controller;


import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class MemberController {
	
	
	private MemberService service;

	@GetMapping("/join")
	public String join() {
		
		return "/board/join";
	}
	
	@PostMapping("/join")
	public String joinMember(MemberVO vo) {
		log.info("찍히는 멤버: " + vo);
		
		service.insert(vo);
		
		return "redirect:/customLogin";
	}
	
	@GetMapping("/info")
	@PreAuthorize("isAuthenticated()")
	public String memberInfo() {
		
		log.info("유저페이지로 이동중...");
		
		return "/board/userInfo";
	}
	
	@ResponseBody
	@RequestMapping(value="/check", produces=MediaType.TEXT_PLAIN_VALUE)
	public String check(@RequestBody String paramData){
		// 클라이언트가 보낸 id값
		String id = paramData.trim();
		log.info("넘겨받은값" + id);
		
		int data = service.idCheck(id);
		
		if(data == 1) {
			return "-1";
		} else {
			return "0";
		}
	}
	
	@GetMapping("/delete")
	@PreAuthorize("isAuthenticated()")
	public String remove(HttpSession session, String id) {
		log.info("탈퇴하는 아이디 : " + id);
		service.delete(id);
		session.invalidate();
		return "redirect:/customLogin";
	}
}
