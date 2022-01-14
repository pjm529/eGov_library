package library.mylib.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.mylib.domain.HopeVO;
import library.mylib.service.HopeService;

@Controller
@RequestMapping("/mylib")
public class HopeController {
	
	@Autowired
	private HopeService hopeService;

	// 희망도서 신청 페이지
	@GetMapping("/hope.do")
	public String hopePage() {
		return "mylib/sub2/hope.jsp";
	}

	// 희망도서 신청 
	@PostMapping("/hopeBook.do")
	public String hopeInsert(@ModelAttribute HopeVO hope, Principal principal) {

		// 로그인 된 id 받아오기
		hope.setUserId(principal.getName());

		// 희망 도서 신청
		hopeService.insertHope(hope);

		return "redirect:/mylib/hope.do";
	}

	// 희망도서 신청내역
	@GetMapping("hopeHistory.do")
	public ModelAndView hopeHistory() {
		ModelAndView mav = new ModelAndView("mylib/sub2/hopeHistory.jsp");
		
		return mav;
	}
}
