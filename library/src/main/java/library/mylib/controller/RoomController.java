package library.mylib.controller;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
