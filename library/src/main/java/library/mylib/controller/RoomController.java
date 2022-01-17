package library.mylib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mylib")
public class RoomController {

	@GetMapping("/readingRoom.do")
	public ModelAndView readingRoom() {

		ModelAndView mav = new ModelAndView("mylib/sub3/readingRoom.jsp");
		
		return mav;
	}
}
