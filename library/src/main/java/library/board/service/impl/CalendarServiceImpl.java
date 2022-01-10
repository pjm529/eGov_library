package library.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import library.board.dao.CalendarDAO;
import library.board.domain.CalendarVO;
import library.board.service.CalendarService;
import library.common.domain.DateVO;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	private CalendarDAO calendarDAO;

	// Board 메뉴 일정 출력
	@Override
	public List<CalendarVO> calendarList() {
		return calendarDAO.calendarList();
	}

	// Admin 메뉴 일정 리스트 출력
	@Override
	public List<CalendarVO> calendarListYM(DateVO date) {
		return calendarDAO.calendarListYM(date);
	}

}
