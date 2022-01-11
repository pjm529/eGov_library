package library.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class QnaController {

	@GetMapping("/qnaBoardList.do")
	public ModelAndView qnaBoardList() {
		ModelAndView mav = new ModelAndView("board/sub3/qnaBoardList.jsp");
		
		return mav;
	}
}
