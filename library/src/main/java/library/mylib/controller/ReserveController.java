package library.mylib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mylib")
public class ReserveController {

	@GetMapping("/reservationRoomPage.do")
	public ModelAndView reservationRoom() {

		ModelAndView mav = new ModelAndView("mylib/sub3/reservationRoomPage.jsp");
		
		return mav;
	}
}
