package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminHopeController {

	@GetMapping("/hopeHistory.do")
	public ModelAndView hopeHistory() {

		ModelAndView mav = new ModelAndView("admin/sub2/hopeHistory.jsp");
		return mav;
	}
}
