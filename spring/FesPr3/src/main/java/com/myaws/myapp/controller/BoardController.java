package com.myaws.myapp.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.BoardService;

@Controller
@RequestMapping(value="/board/")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private BoardService boardService;
	
	@Autowired(required = false)
	private PageMaker pm;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "festival/festivalList.aws")
	public String festivalList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.boardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.boardSelectAll(scri);

		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);

		String path = "WEB-INF/board/festival/festivalList";
		return path;
	}

	@RequestMapping(value = "festival/festivalWrite.aws")
	public String festivalWrite() {
//		logger.info("boardWrite에 들어옴"); 

		String path = "WEB-INF/board/festival/festivalWrite";
		return path;
	}

	@RequestMapping(value = "festival/festivalContents.aws")
	public String festivalContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.boardViewCntUpdate(bidx);
		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/festival/festivalContents";
		return path;
	}
	
	@RequestMapping(value = "festival/festivalModify.aws")
	public String feativalModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/festival/festivalModify";
		return path;
	}
	@RequestMapping(value = "qna/qnaList.aws")
	public String qnaList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.boardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.boardSelectAll(scri);

		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);

		String path = "WEB-INF/board/qna/qnaList";
		return path;
	}

	@RequestMapping(value = "qna/qnaWrite.aws")
	public String qnaWrite() {
//		logger.info("boardWrite에 들어옴"); 

		String path = "WEB-INF/board/qna/qnaWrite";
		return path;
	}

	@RequestMapping(value = "qna/qnaContents.aws")
	public String qnaContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.boardViewCntUpdate(bidx);
		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/qna/qnaContents";
		return path;
	}
	
	@RequestMapping(value = "qna/qnaModify.aws")
	public String qnaModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/qna/qnaModify";
		return path;
	}
	@RequestMapping(value = "review/reviewList.aws")
	public String reviewList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.boardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.boardSelectAll(scri);

		model.addAttribute("blist", blist);
		model.addAttribute("pm", pm);

		String path = "WEB-INF/board/review/reviewList";
		return path;
	}

	@RequestMapping(value = "review/reviewWrite.aws")
	public String reviewWrite() {
//		logger.info("boardWrite에 들어옴"); 

		String path = "WEB-INF/board/review/reviewWrite";
		return path;
	}

	@RequestMapping(value = "review/reviewContents.aws")
	public String reviewContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.boardViewCntUpdate(bidx);
		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/review/reviewContents";
		return path;
	}
	
	@RequestMapping(value = "review/reviewModify.aws")
	public String reviewModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.boardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/review/reviewModify";
		return path;
	}
}