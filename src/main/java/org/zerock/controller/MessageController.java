package org.zerock.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.MessageVO;
import org.zerock.service.MessageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/messages/*")
public class MessageController {
	@Setter(onMethod_=@Autowired)
	MessageService service;
	
	@RequestMapping(value="/",consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> addMessage(@RequestBody MessageVO vo){
		ResponseEntity<String> entity = null;
		log.info("넘어온 메시지 : " + vo);
		try {
			service.addMessage(vo);
			entity = new ResponseEntity<String>("success",HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/msgList")
	public ModelAndView list(String targetid, Model model) {
		
		log.info("타겟아이디: " + targetid);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/msgList");
		mav.addObject("rlist", service.getReceiveMsg(targetid));
		mav.addObject("slist", service.getSendMsg(targetid));
		
		return mav;
	}
	
	@GetMapping("/get")
	public ModelAndView get(int mid, String id) {
		log.info("넘어노는 번호" + mid);
		log.info("넘어노는 아이디" + id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/msgGet");
		service.updateR(mid, id);
		mav.addObject("get", service.get(mid, id));
		
		return mav;
	}
	
	@GetMapping("/remove")
	public  ModelAndView remove(int mid, String id) {
		log.info("삭제하는 글번호 : " + mid);
		service.remove(mid);
		log.info("타겟아이디: " + id);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/msgList");
		mav.addObject("rlist", service.getReceiveMsg(id));
		mav.addObject("slist", service.getSendMsg(id));
		return mav;
	}
	
	
}
