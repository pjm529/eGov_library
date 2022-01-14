package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/master")
public class MasterController {

	// 관리자 목록 출력
	@GetMapping("/adminList.do")
	public ModelAndView adminList() {

		ModelAndView mav = new ModelAndView("admin/sub3/adminList.jsp");
		
		return mav;
	}
}
