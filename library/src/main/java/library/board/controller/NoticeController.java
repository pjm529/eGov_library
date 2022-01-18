package library.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class NoticeController {

	@GetMapping("/noticeList.do")
	public ModelAndView noticeList() {
		
		ModelAndView mav = new ModelAndView("board/sub1/noticeList.jsp");
		
		return mav;
	}

}
