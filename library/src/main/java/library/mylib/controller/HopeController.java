package library.mylib.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.common.page.Criteria;
import library.common.page.ViewPage;
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
	public ModelAndView hopeHistory(@ModelAttribute Criteria cri, Principal principal) {

		ModelAndView mav = new ModelAndView("mylib/sub2/hopeHistory.jsp");

		// 로그인 된 id 받아오기
		String loginId = principal.getName();

		// 나의 희망 도서 목록
		List<HopeVO> hopeList = hopeService.hopeList(cri, loginId);

		for (HopeVO hope : hopeList) {

			hope.setHopeRegDate(hope.getHopeRegDate().substring(0, 10));
		}

		mav.addObject("hopeList", hopeList);

		// 나의 희망 도서 신청 수
		int total = hopeService.hopeTotal(cri, loginId);
		mav.addObject("total", total);

		// 페이징
		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;
	}
}
