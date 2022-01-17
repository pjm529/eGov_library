package library.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import library.mylib.domain.RoomVO;
import library.mylib.service.RoomService;

@Controller
@RequestMapping("/admin")
public class AdminRoomController {
	
	@Autowired
	private RoomService roomService;

	@GetMapping("/seatList.do")
	public ModelAndView seatList() {
		
		ModelAndView mav = new ModelAndView("admin/sub6/seatList.jsp");
		
		List<RoomVO> seatList = roomService.seatList();
		mav.addObject("seatList", seatList);
		
		return mav;
	}
}
