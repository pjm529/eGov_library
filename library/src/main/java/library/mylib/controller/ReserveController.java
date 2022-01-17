package library.mylib.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.mylib.service.ReserveService;

@Controller
@RequestMapping("/mylib")
public class ReserveController {

	@Autowired
	private ReserveService reserveService;

	@GetMapping("/reservationRoomPage.do")
	public ModelAndView reservationRoom() {

		ModelAndView mav = new ModelAndView("mylib/sub3/reservationRoomPage.jsp");

		// 잔여좌석
		int rd1UsingSeat = reserveService.usingSeat("room1");
		mav.addObject("rd1UsingSeat", rd1UsingSeat);

		// 사용 중 좌석
		int rd1UsedSeat = reserveService.usedSeat("room1");
		mav.addObject("rd1UsedSeat", rd1UsedSeat);

		// 잔여좌석
		int rd2UsingSeat = reserveService.usingSeat("room2");
		mav.addObject("rd2UsingSeat", rd2UsingSeat);

		// 사용 중 좌석
		int rd2UsedSeat = reserveService.usedSeat("room2");
		mav.addObject("rd2UsedSeat", rd2UsedSeat);

		// 잔여좌석
		int nbUsingSeat = reserveService.usingSeat("nbRoom");
		mav.addObject("nbUsingSeat", nbUsingSeat);

		// 사용 중 좌석
		int nbUsedSeat = reserveService.usedSeat("nbRoom");
		mav.addObject("nbUsedSeat", nbUsedSeat);

		return mav;
	}
}
