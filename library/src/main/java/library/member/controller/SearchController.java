package library.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import library.member.domain.MemberVO;
import library.member.service.SearchService;

@Controller
@RequestMapping("/member")
public class SearchController {

	@Autowired
	private SearchService searchService;

	// 아이디 찾기 페이지 진입
	@GetMapping("/searchId.do")
	public String searchIdPage() {

		System.out.println("아이디 찾기 페이지 진입");

		return "member/sub3/searchId.jsp";

	}

	// 아이디 찾기 정보확인
	@ResponseBody
	@PostMapping("/searchIdCheck.do")
	public String searchIdCheck(@ModelAttribute MemberVO member) throws Exception {

		System.out.println("searchIdCheck() 진입");

		String id = searchService.searchId(member);

		if (id == null) {

			return "fail";

		} else {

			return "success";

		}
	}

	// 아이디 찾기 성공
	@PostMapping("/searchId.do")
	public String searchIdPOST(@ModelAttribute MemberVO member, Model model) throws Exception {

		System.out.println("searchId() 진입");

		String result = searchService.searchId(member);

		model.addAttribute("searchId", result);

		System.out.println(result);
		return "redirect:/member/searchIdResult.do";

	}

	// 아이디 찾기 결과
	@GetMapping("/searchIdResult.do")
	public String searchIdResult(@RequestParam String searchId, Model model) {

		model.addAttribute("searchId", searchId);

		return "member/sub3/searchIdResult.jsp";

	}

	// 비밀번호 찾기 페이지 진입
	@GetMapping("/searchPw.do")
	public String searchPwGET() {

		System.out.println("비밀번호 찾기 페이지 진입");

		return "member/sub4/searchPw.jsp";

	}

}
