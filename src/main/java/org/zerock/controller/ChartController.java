package org.zerock.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class ChartController {

	private BoardService service;
	
	@GetMapping("/pages")
	@PreAuthorize("isAuthenticated()")
	public String moveToChart(Model model) {
		
		model.addAttribute("data1", service.decCount());
		
		return "/board/chart";
	}
	
	@GetMapping("/report")
	@PreAuthorize("isAuthenticated()")
	public String moveToReport() {
		return "/board/report";
	}
}
