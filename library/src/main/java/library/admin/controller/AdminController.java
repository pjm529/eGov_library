package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.admin.service.AdminService;
import library.member.domain.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@GetMapping("/memberList.do")
	public ModelAndView memberList() {

		ModelAndView mav = new ModelAndView("admin/sub1/memberList.jsp");
		
		List<MemberVO> memberList = adminService.memberList();
		
		for(MemberVO m : memberList) {
			m.setUserRegDate(m.getUserRegDate().substring(0, 10));
		}
		
		mav.addObject("memberList", memberList);
		
		return mav;
	}

}
