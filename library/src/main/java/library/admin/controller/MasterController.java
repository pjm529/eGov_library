package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.MasterService;
import library.common.page.Criteria;
import library.common.page.ViewPage;
import library.member.domain.MemberVO;

@Controller
@RequestMapping("/master")
public class MasterController {
	
	@Autowired
	private MasterService masterService;

	// 관리자 목록 출력
	@GetMapping("/adminList.do")
	public ModelAndView adminList(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub3/adminList.jsp");
		
		List<MemberVO> adminList = masterService.adminList(cri);
		
		for (MemberVO m : adminList) {
			m.setUserRegDate(m.getUserRegDate().substring(0, 10));
		}
		
		mav.addObject("adminList", adminList);
		
		int total = masterService.adminTotal(cri);
		mav.addObject("total", total);
		
		ViewPage vp = new ViewPage(cri, total);
		mav.addObject("page", vp);
		
		return mav;
	}
}
