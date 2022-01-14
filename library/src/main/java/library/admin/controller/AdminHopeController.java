package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.AdminHopeService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.mylib.domain.HopeVO;

@Controller
@RequestMapping("/admin")
public class AdminHopeController {

	@Autowired
	private AdminHopeService hopeService;

	@GetMapping("/hopeHistory.do")
	public ModelAndView hopeHistory(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub2/hopeHistory.jsp");

		// 희망 도서 내역
		List<HopeVO> hopeList = hopeService.hopeList(cri);

		for (HopeVO hope : hopeList) {

			hope.setHopeRegDate(hope.getHopeRegDate().substring(0, 10));
		}

		mav.addObject("hopeList", hopeList);

		// 희망 도서 신청 수
		int total = hopeService.hopeTotal(cri);
		mav.addObject("total", total);

		// 페이징
		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);

		return mav;
	}

	// 희망 도서 정보
	@PostMapping("/hopeInfo.do")
	public ModelAndView hope_info(Criteria cri, @RequestParam String hopeNo) {

		ModelAndView mav = new ModelAndView("admin/sub2/hopeInfo.jsp");

		return mav;
	}

}
