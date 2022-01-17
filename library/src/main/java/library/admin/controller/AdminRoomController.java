package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import library.mylib.domain.RoomVO;
import library.mylib.service.RoomService;

@Controller
@RequestMapping("/admin")
public class AdminRoomController {

	@Autowired
	private RoomService roomService;

	// 열람실 이용 정보
	@GetMapping("/seatList.do")
	public ModelAndView seatList() {

		ModelAndView mav = new ModelAndView("admin/sub6/seatList.jsp");

		// 열람실 이용 중인 좌석 정보
		List<RoomVO> seatList = roomService.seatList();
		mav.addObject("seatList", seatList);

		return mav;
	}

	// 퇴실
	@PostMapping("/seatReturn.do")
	public String seat_return(@RequestParam String userId) {

		roomService.returnSeat(userId);

		return "redirect:/admin/seatList.do";
	}
}
