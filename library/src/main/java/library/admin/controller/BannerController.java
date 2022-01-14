package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class BannerController {

	
	@GetMapping("/bannerList.do")
	public ModelAndView bannerList() {
		
		ModelAndView mav = new ModelAndView("admin/sub5/bannerList.jsp");
		
		return mav;
	}
}
