package com.kbh.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kbh.project.service.MemberService;
import com.kbh.project.vo.Member;
import com.kbh.project.vo.Rq;

@Controller
public class AdmMemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private Rq rq;

	@RequestMapping("/adm/member/list")
	public String showList(Model model, @RequestParam(defaultValue = "0") String authLevel,
			@RequestParam(defaultValue = "loginId,name,nickname") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword, @RequestParam(defaultValue = "1") int page) {

		int membersCount = memberService.getMembersCount(authLevel, searchKeywordTypeCode, searchKeyword);

		int itemsInAPage = 10;
		int pagesCount = (int) Math.ceil((double) membersCount / itemsInAPage);

		List<Member> members = memberService.getForPrintMembers(authLevel, searchKeywordTypeCode, searchKeyword,
				itemsInAPage, page);

		model.addAttribute("authLevel", authLevel);
		model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
		model.addAttribute("searchKeyword", searchKeyword);

		model.addAttribute("membersCount", membersCount);
		model.addAttribute("pagesCount", pagesCount);

		return "adm/member/list";
	}


}