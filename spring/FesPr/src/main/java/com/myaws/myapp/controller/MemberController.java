package com.myaws.myapp.controller;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myaws.myapp.domain.MemberVo;
import com.myaws.myapp.service.MemberService;


@Controller
@RequestMapping(value = "/member/")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired(required = false)
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@RequestMapping(value = "signup.aws", method = RequestMethod.GET)
	public String Signup() {
		logger.info("회원가입들어옴");
		logger.info("bCryptPasswordEncoder==>" + bCryptPasswordEncoder);

		return "WEB-INF/member/signup";
	}

	@RequestMapping(value = "signupAction.aws", method = RequestMethod.POST)
	public String signupAction(MemberVo mv) {
		logger.info("signupAction들어옴");
		logger.info("bCryptPasswordEncoder==>" + bCryptPasswordEncoder);

		String memberpassword_enc = bCryptPasswordEncoder.encode(mv.getMemberPassword());
		mv.setMemberPassword(memberpassword_enc);

		int value = memberService.memberInsert(mv);
		logger.info("value:" + value);

		String path = "";
		if (value == 1) {
			path = "redirect:/";
		} else if (value == 0) {
			path = "redirect:/member/signup.aws";
		}
		return path;
	}

	@RequestMapping(value = "login.aws", method = RequestMethod.GET)
	public String memberLogin() {
		// System.out.println("로그인에 들어왔니");
		return "WEB-INF/member/login";
	}

	@RequestMapping(value = "loginAction.aws", method = RequestMethod.POST)
	public String LoginAction(

			@RequestParam("memberId") String memberId, @RequestParam("memberPassword") String memberPassword,
			RedirectAttributes rttr, HttpSession session) {
//			System.out.println("아이디" + memberid);
//			System.out.println("비번" + memberpwd);

		MemberVo mv = memberService.memberLoginCheck(memberId);
		// 저장된 비밀번호를 가져온다

		String path = "";
		if (mv != null) { // 객체값이 있으면
			String reservedPassword = mv.getMemberPassword();
			if (bCryptPasswordEncoder.matches(memberPassword, reservedPassword)) {
				// System.out.println("비밀번호 일치");
				rttr.addAttribute("midx", mv.getMidx());
				rttr.addAttribute("memberId", mv.getMemberId());
				rttr.addAttribute("memberName", mv.getMemberNickName());

				logger.info("saveUrl" + session.getAttribute("saveUrl"));

				if (session.getAttribute("saveUrl") != null) {
					path = "redirect:" + session.getAttribute("saveUrl").toString();
				} else
					path = "redirect:/";

			} else {
//					 rttr.addAttribute("midx","");
//					 rttr.addAttribute("memberId", "");
//					 rttr.addAttribute("memberName", "");	
				rttr.addFlashAttribute("msg", "아이디/비밀번호를 확인해주세요");
				path = "redirect:/member/login.aws";
			}
		} else {
//				 rttr.addAttribute("midx","");
//				 rttr.addAttribute("memberId", "");
//				 rttr.addAttribute("memberName", "");	
			rttr.addFlashAttribute("msg", "해당하는 아이디가 없습니다.");
			path = "redirect:/member/login.aws";
		}
		// 회원정보를 세션에 담는다
		return path;
	}

	@ResponseBody
	@RequestMapping(value = "memberIdCheck.aws", method = RequestMethod.POST)
	public JSONObject IdCheck(@RequestParam("memberId") String memberId) {

		int cnt = memberService.memberIdCheck(memberId);

		JSONObject obj = new JSONObject();
		obj.put("cnt", cnt);

		return obj;
	}

	@RequestMapping(value = "Logout.aws", method = RequestMethod.GET)
	public String Logout(HttpSession session) {

		session.removeAttribute("midx");
		session.removeAttribute("memberName");
		session.removeAttribute("memberId");
		session.invalidate(); // 세션값 초기화

		return "redirect:/";
	}

}
