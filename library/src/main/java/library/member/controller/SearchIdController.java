package library.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class SearchIdController {

	// 아이디 찾기 페이지 진입
	@GetMapping("/searchId.do")
	public String searchIdPage() {

		System.out.println("아이디 찾기 페이지 진입");

		return "member/sub3/searchId.jsp";

	}

}
