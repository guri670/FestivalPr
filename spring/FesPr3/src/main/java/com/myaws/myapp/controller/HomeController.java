package com.myaws.myapp.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.BoardService;
import com.myaws.myapp.service.HomeService;

@Controller
@RequestMapping(value="")
public class HomeController {
	
	@Autowired
	private BoardService boardservice;
	
	@Autowired(required = false)
	private PageMaker pm;

	
	
	@RequestMapping(value = "/index.aws")
	public String index(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");		

		model.addAttribute("value", "teststts");
		

		String path = "index";
		return path;
	}

	@RequestMapping(value = "review/reviewList.aws")
	public String reviewList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.reviewBoardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.reviewBoardSelectAll(scri);

		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);

		String path = "WEB-INF/board/review/reviewList";
		return path;
	}
	
}
