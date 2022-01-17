package library.mylib.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import library.mylib.domain.RoomVO;
import library.mylib.service.RoomService;

@Controller
@RequestMapping("/mylib")
public class RoomController {

	@Autowired
	private RoomService roomService;

	// 제 1 열람실
	@GetMapping("/readingRoom.do")
	public ModelAndView readingRoom(Principal principal) {

		ModelAndView mav = new ModelAndView("mylib/sub3/readingRoom.jsp");

		String loginId = principal.getName();
		mav.addObject("loginId", loginId);

		List<RoomVO> seatsList = roomService.readingRoom1List();
		mav.addObject("seatsList", seatsList);

		RoomVO mySeatInfo = roomService.mySeatInfo(loginId);

		if (mySeatInfo == null) {
			return mav;
		} else {
			Date now = new Date();
			mySeatInfo.setDiffTime(mySeatInfo.getCheckoutTime().getTime() - now.getTime());
			mav.addObject("mySeatInfo", mySeatInfo);
		}

		return mav;
	}

	// 제 2 열람실
	@GetMapping("/readingRoom2.do")
	public ModelAndView readingRoom2(Principal principal) {

		ModelAndView mav = new ModelAndView("mylib/sub3/readingRoom2.jsp");

		String loginId = principal.getName();
		mav.addObject("loginId", loginId);

		List<RoomVO> seatsList = roomService.readingRoom2List();
		mav.addObject("seatsList", seatsList);

		RoomVO mySeatInfo = roomService.mySeatInfo(loginId);

		if (mySeatInfo == null) {
			return mav;
		} else {
			Date now = new Date();
			mySeatInfo.setDiffTime(mySeatInfo.getCheckoutTime().getTime() - now.getTime());
			mav.addObject("mySeatInfo", mySeatInfo);
		}

		return mav;
	}

	// 열람실 좌석 상태 체크
	@ResponseBody
	@PostMapping("/seatCheck.do")
	public String seatCheck(@RequestParam int seatNo) {

		int result = roomService.seatCheck(seatNo);

		if (result == 1) {
			return "success";
		} else {
			return "fail";
		}
	}

	// 좌석 예약
	@PostMapping("/bookingSeat.do")
	public String bookingSeat(RoomVO room, Principal principal) {

		SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date now = new Date();
		String nowTime = fmt.format(now);

		// 현재 시간
		int hours = Integer.parseInt(nowTime.substring(11, 13));

		// 현재 시간이 9~17시 일경우 예약
		if (hours > 8 && hours < 18) {

			String loginId = principal.getName();
			room.setUserId(loginId);

			roomService.bookingSeat(room);
		}

		if (room.getSeatNo() < 55) {
			return "redirect:/mylib/readingRoom.do";
		} else if (room.getSeatNo() > 96) {
			return "redirect:/mylib/notebookRoom.do";
		} else {
			return "redirect:/mylib/readingRoom2.do";
		}

	}

	// 열람실 퇴실
	@PostMapping("/returnSeat.do")
	public String returnSeat(Principal principal) {

		String loginId = principal.getName();
		roomService.returnSeat(loginId);

		return "redirect:/mylib/reservationRoomPage.do";
	}

	// 좌석 연장
	@PostMapping("/extendSeat.do")
	public String extendSeat(Principal principal) {

		String loginId = principal.getName();
		roomService.extendSeat(loginId);

		return "redirect:/mylib/readingRoom.do";
	}

	// 좌석 이동
	@PostMapping("/moveSeat.do")
	public String moveSeat(RoomVO room, Principal principal) {

		String loginId = principal.getName();
		room.setUserId(loginId);
		roomService.returnSeat(loginId);
		roomService.bookingSeat(room);

		if (room.getSeatNo() < 55) {
			return "redirect:/mylib/readingRoom.do";
		} else if (room.getSeatNo() > 96) {
			return "redirect:/mylib/notebookRoom.do";
		} else {
			return "redirect:/mylib/readingRoom2.do";
		}
	}
}
