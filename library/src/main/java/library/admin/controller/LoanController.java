package library.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import library.common.page.Criteria;

@Controller
@RequestMapping("/admin")
public class LoanController {

	
	@GetMapping("/loanHistory.do")
	public String loanHistory(@ModelAttribute Criteria cri) {
		
		return "admin/sub2/loanHistory.jsp";
	}
}
