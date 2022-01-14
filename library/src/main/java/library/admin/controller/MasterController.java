package library.admin.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

	// 관리자 등록 팝업
	@GetMapping("/adminPopUp.do")
	public ModelAndView adminPopUp(@ModelAttribute Criteria cri) {

		ModelAndView mav = new ModelAndView("admin/sub3/adminPopUp.jsp");

		if (cri.getKeyword() == null) {
			return mav;
		}

		// 회원 검색
		MemberVO member = masterService.searchMember(cri.getKeyword());

		if (member != null) {
			member.setUserRegDate(member.getUserRegDate().substring(0, 10));
		}

		mav.addObject("member", member);

		return mav;

	}

	// 관리자 권한가지고 있는지 검색
	@ResponseBody
	@PostMapping("/adminChk.do")
	public String adminChk(@RequestParam String userId) {

		int result = masterService.adminCheck(userId);

		if (result == 1) {
			return "fail";
		} else {
			return "success";
		}

	}

	// 관리자 권한 부여
	@PostMapping("/grant.do")
	public String grant(@RequestParam String userId) {

		masterService.grant(userId);

		return "redirect:/master/adminPopUp.do";
	}

	@PostMapping("/revoke")
	public String revoke(Criteria cri, @RequestParam String userId) {

		masterService.revoke(userId);

		int amount = cri.getAmount();
		int page = cri.getPage();
		String	 type = cri.getType();
		String keyword;

		try {
			keyword = URLEncoder.encode(cri.getKeyword(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			return "redirect:/master/adminList.do";
		}

		return "redirect:/master/adminList.do?amount=" + amount + "&page=" + page + "&type=" + type + "&keyword="
				+ keyword;
	}
}
