package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.handler.ChatHandler;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/chat/*")
@AllArgsConstructor
public class ChatController {
	
	private ChatHandler chatHandler;

	@GetMapping("/page")
	@PreAuthorize("isAuthenticated()")
	public String moveToChat(Model model) {
		
		log.info("채팅 페이지로 이동");
		model.addAttribute("count", chatHandler.getListCount());
		log.info("현재 접속한 세션수: " + chatHandler.getListCount());
		return "/board/chat" ;
	}
	
	
}
