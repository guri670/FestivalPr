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

@Controller
@RequestMapping(value="")
public class HomeController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired(required = false)
	private PageMaker pm;

	
	//index페이지에서 5개의 후기게시글 뿌리기 
	@RequestMapping(value = "/index.aws")
	public String index(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");		

		int cnt = boardService.reviewBoardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);
		
		ArrayList<BoardVo> blist = boardService.reviewBoardSelectFive(scri);
		
		model.addAttribute("blist", blist);
		model.addAttribute("value", "teststts");
		

		String path = "index";
		return path;
	}

}
