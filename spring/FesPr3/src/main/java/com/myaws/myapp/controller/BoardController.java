package com.myaws.myapp.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.BoardVo;
import com.myaws.myapp.domain.PageMaker;
import com.myaws.myapp.domain.SearchCriteria;
import com.myaws.myapp.service.BoardService;
import com.myaws.myapp.util.MediaUtils;
import com.myaws.myapp.util.UploadFileUtiles;
import com.myaws.myapp.util.UserIp;

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
	
	@Autowired(required = false) // null도 포함
	private UserIp userIp;

	
	@RequestMapping(value = "festival/festivalList.aws")
	public String festivalList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.festivalBoardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.festivalBoardSelectAll(scri);

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

	@RequestMapping(value = "festival/festivalWriteAction.aws")
	public String festivalBoardWriteAction(BoardVo bv, @RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("reviewWriteAction에 들어옴"); 
		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}
		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName);
		bv.setMidx(midx_int);
		bv.setIp(ip); 
		// 게시판 정보 꼭 넣어야함

		String path = "";
		int value = boardService.festivalBoardInsert(bv);
		System.out.print("value값은? : " + value);
		if (value == 1) {
			path = "redirect:/board/festival/festivalList.aws";
		} else {
			rttr.addFlashAttribute("msg", "입력이잘못되었습니다");
			path = "redirect:/board/festival/festivalWrite.aws";
		}

		return path;

	}
	
	@RequestMapping(value = "festival/festivalContents.aws")
	public String festivalContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.festivalBoardViewCntUpdate(bidx);
		BoardVo bv = boardService.festivalBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/festival/festivalContents";
		return path;
	}
	
	@RequestMapping(value = "festival/festivalModify.aws")
	public String feativalModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.festivalBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/festival/festivalModify";
		return path;
	}
	
	@RequestMapping(value = "festival/festivalModifyAction.aws")
	// 컨트롤러 완성하고 서비스를 불러온다.
	public String festivalModifyAction(BoardVo bv, // bv객체 안에 값들이 담겨져있다.
			@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		int value = 0;

		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}

		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName); // filename 칼럼값으로 넣는다.
		bv.setMidx(midx_int);
		bv.setIp(ip);
		// 파일 업로드를 하고 update를 하기 위한 service를 만든다.

		value = boardService.festivalBoardUpdate(bv);

		String path = "";

		if (value == 0) {
			rttr.addFlashAttribute("msg", "작성자가 아니거나 비밀번호가 다릅니다.");
			path = "redirect:/board/festival/festivalModify.aws?bidx=" + bv.getBidx();
		} else {
			path = "redirect:/board/festival/festivalContents.aws?bidx=" + bv.getBidx();
		}

		return path;
	}
	
	@RequestMapping(value = "festival/festivalDelete.aws")
	public String festivalBoardDelete(@RequestParam("bidx") int bidx, Model model) {

		model.addAttribute("bidx", bidx);
		String path = "WEB-INF/board/festival/festivalDelete";

		return path;
	}
	
	@RequestMapping(value = "festival/festivalDeleteAction.aws", method = RequestMethod.POST)
	public String festivalBoardDeleteAction(@RequestParam("bidx") int bidx, @RequestParam("password") String password,
			HttpSession session) { // json형식으로 넘겨야한다 모를때 타입을 ? 를 넣어도된다.

		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		int value = boardService.festivalBoardDelete(bidx, midx, password);

		String path = "redirect:/board/festival/festivalList.aws";
		if (value == 0) {
			path = "redirect:/board/festival/festivalDelete.aws?bidx=" + bidx;
		}
		return path;
	}


	
	@RequestMapping(value = "qna/qnaList.aws")
	public String qnaList(SearchCriteria scri, Model model) {
		// logger.info("boardList에 들어옴");

		int cnt = boardService.qnaBoardTotalCount(scri);
		pm.setScri(scri);
		pm.setTotalCnt(cnt);

		ArrayList<BoardVo> blist = boardService.qnaBoardSelectAll(scri);

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

	@RequestMapping(value = "qna/qnaWriteAction.aws")
	public String qnaBoardWriteAction(BoardVo bv, @RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("reviewWriteAction에 들어옴"); 
		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}
		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName);
		bv.setMidx(midx_int);
		bv.setIp(ip); 
		// 게시판 정보 꼭 넣어야함

		String path = "";
		int value = boardService.qnaBoardInsert(bv);
		System.out.print("value값은? : " + value);
		if (value == 1) {
			path = "redirect:/board/qna/qnaList.aws";
		} else {
			rttr.addFlashAttribute("msg", "입력이잘못되었습니다");
			path = "redirect:/board/qna/qnaWrite.aws";
		}

		return path;

	}
	
	@RequestMapping(value = "qna/qnaContents.aws")
	public String qnaContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.qnaBoardViewCntUpdate(bidx);
		BoardVo bv = boardService.qnaBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/qna/qnaContents";
		return path;
	}
	
	@RequestMapping(value = "qna/qnaModify.aws")
	public String qnaModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.qnaBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/qna/qnaModify";
		return path;
	}
	
	@RequestMapping(value = "qna/qnaModifyAction.aws")
	public String qnaModifyAction(BoardVo bv, // bv객체 안에 값들이 담겨져있다.
			@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		int value = 0;

		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}

		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName); // filename 칼럼값으로 넣는다.
		bv.setMidx(midx_int);
		bv.setIp(ip);
		// 파일 업로드를 하고 update를 하기 위한 service를 만든다.

		value = boardService.qnaBoardUpdate(bv);

		String path = "";

		if (value == 0) {
			rttr.addFlashAttribute("msg", "작성자가 아니거나 비밀번호가 다릅니다.");
			path = "redirect:/board/qna/qnaModify.aws?bidx=" + bv.getBidx();
		} else {
			path = "redirect:/board/qna/qnaContents.aws?bidx=" + bv.getBidx();
		}

		return path;
	}
	
	@RequestMapping(value = "qna/qnaDelete.aws")
	public String qnaBoardDelete(@RequestParam("bidx") int bidx, Model model) {

		model.addAttribute("bidx", bidx);
		String path = "WEB-INF/board/qna/qnaDelete";

		return path;
	}
	
	@RequestMapping(value = "qna/qnaDeleteAction.aws", method = RequestMethod.POST)
	public String qnaBoardDeleteAction(@RequestParam("bidx") int bidx, @RequestParam("password") String password,
			HttpSession session) { // json형식으로 넘겨야한다 모를때 타입을 ? 를 넣어도된다.

		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		int value = boardService.festivalBoardDelete(bidx, midx, password);

		String path = "redirect:/board/qna/qnaList.aws";
		if (value == 0) {
			path = "redirect:/board/qna/qnaDelete.aws?bidx=" + bidx;
		}
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

	@RequestMapping(value = "review/reviewWrite.aws")
	public String reviewWrite() {
		logger.info("boardWrite에 들어옴"); 

		String path = "WEB-INF/board/review/reviewWrite";
		return path;
	}
	
	@RequestMapping(value = "review/reviewWriteAction.aws")
	public String boardWriteAction(BoardVo bv, @RequestParam("attachfile") MultipartFile attachfile,
			HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		logger.info("reviewWriteAction에 들어옴"); 
		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}
		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName);
		bv.setMidx(midx_int);
		bv.setIp(ip); 
		// 게시판 정보 꼭 넣어야함

		String path = "";
		int value = boardService.reviewBoardInsert(bv);
		System.out.print("value값은? : " + value);
		if (value == 1) {
			path = "redirect:/board/review/reviewList.aws";
		} else {
			rttr.addFlashAttribute("msg", "입력이잘못되었습니다");
			path = "redirect:/board/review/reviewWrite.aws";
		}

		return path;

	}

	@RequestMapping(value = "review/reviewContents.aws")
	public String reviewContents(@RequestParam("bidx") int bidx, Model model) {

		boardService.reviewBoardViewCntUpdate(bidx);
		BoardVo bv = boardService.reviewBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/review/reviewContents";
		return path;
	}
	
	@RequestMapping(value = "review/reviewModify.aws")
	public String reviewModify(@RequestParam("bidx") int bidx, Model model) {

		BoardVo bv = boardService.reviewBoardSelectOne(bidx);
		model.addAttribute("bv", bv);

		String path = "WEB-INF/board/review/reviewModify";
		return path;
	}
	
	@RequestMapping(value = "review/reviewModifyAction.aws")
	public String reviewModifyAction(BoardVo bv, // bv객체 안에 값들이 담겨져있다.
			@RequestParam("attachfile") MultipartFile attachfile, HttpServletRequest request, RedirectAttributes rttr)
			throws Exception {

		int value = 0;

		MultipartFile file = attachfile;
		String uploadedFileName = "";

		if (!file.getOriginalFilename().equals("")) {
			uploadedFileName = UploadFileUtiles.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes());
		}

		String midx = request.getSession().getAttribute("midx").toString();
		int midx_int = Integer.parseInt(midx);

		String ip = userIp.getUserIp(request);

		bv.setUploadedFilename(uploadedFileName); // filename 칼럼값으로 넣는다.
		bv.setMidx(midx_int);
		bv.setIp(ip);
		// 파일 업로드를 하고 update를 하기 위한 service를 만든다.

		value = boardService.reviewBoardUpdate(bv);

		String path = "";

		if (value == 0) {
			rttr.addFlashAttribute("msg", "작성자가 아니거나 비밀번호가 다릅니다.");
			path = "redirect:/board/review/reviewModify.aws?bidx=" + bv.getBidx();
		} else {
			path = "redirect:/board/review/reviewContents.aws?bidx=" + bv.getBidx();
		}

		return path;
	}
	
	@RequestMapping(value = "review/reviewDelete.aws")
	public String reviewBoardDelete(@RequestParam("bidx") int bidx, Model model) {

		model.addAttribute("bidx", bidx);
		String path = "WEB-INF/board/festival/festivalDelete";

		return path;
	}
	
	@RequestMapping(value = "review/reviewDeleteAction.aws", method = RequestMethod.POST)
	public String reviewDeleteAction(@RequestParam("bidx") int bidx, @RequestParam("password") String password,
			HttpSession session) { // json형식으로 넘겨야한다 모를때 타입을 ? 를 넣어도된다.

		int midx = Integer.parseInt(session.getAttribute("midx").toString());
		int value = boardService.festivalBoardDelete(bidx, midx, password);

		String path = "redirect:/board/review/reviewList.aws";
		if (value == 0) {
			path = "redirect:/board/review/reviewDelete.aws?bidx=" + bidx;
		}
		return path;
	}
	
	@RequestMapping(value = "displayFile.aws", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(@RequestParam("fileName") String fileName,
			@RequestParam(value = "down", defaultValue = "0") int down) {

		ResponseEntity<byte[]> entity = null;
		InputStream in = null;

		try {
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);

			HttpHeaders headers = new HttpHeaders();

			in = new FileInputStream(uploadPath + fileName);

			if (mType != null) {
				if (down == 1) {
					fileName = fileName.substring(fileName.indexOf("_") + 1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition",
							"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
				} else {
					headers.setContentType(mType);
				}
			} else {
				fileName = fileName.substring(fileName.indexOf("_") + 1);
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition",
						"attachment; filename=\"" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			try {
				in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return entity;
	}
}