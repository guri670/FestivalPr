package com.myaws.myapp.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.SearchCriteria;

@Controller
public class HomeController {
	
	
	
	@RequestMapping(value = "/index.aws")
	public String index(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");		

		model.addAttribute("value", "teststts");
		

		String path = "index";
		return path;
	}

}
