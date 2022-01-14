package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.admin.domain.BannerVO;
import library.admin.service.BannerService;

@Controller
@RequestMapping("/admin")
public class BannerController {

	@Autowired
	private BannerService bannerService;

	// 배너목록
	@GetMapping("/bannerList.do")
	public ModelAndView bannerList() {

		ModelAndView mav = new ModelAndView("admin/sub5/bannerList.jsp");

		List<BannerVO> bannerList = bannerService.bannerList();

		for (BannerVO b : bannerList) {

			b.setRegDate(b.getRegDate().substring(0, 10));
		}

		mav.addObject("bannerList", bannerList);

		return mav;
	}

	// 배너 추가 페이지
	@GetMapping("/bannerPopUp.do")
	public String bannerPopUp() {
		return "admin/sub5/bannerPopUp.jsp";
	}
}
