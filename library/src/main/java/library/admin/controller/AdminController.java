package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@GetMapping("/memberList.do")
	public ModelAndView memberList() {

		ModelAndView mav = new ModelAndView("admin/sub1/memberList.jsp");
		return mav;
	}

}
