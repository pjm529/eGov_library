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

		// 멤버 목록 조회
		List<MemberVO> memberList = adminService.memberList();
		
		// 가입 시간 제거
		for(MemberVO m : memberList) {
			m.setUserRegDate(m.getUserRegDate().substring(0, 10));
		}
		
		mav.addObject("memberList", memberList);
		
		// 총 회원 수
		int total = adminService.memberTotal();
		mav.addObject("total", total);
		
		return mav;
	}

}
