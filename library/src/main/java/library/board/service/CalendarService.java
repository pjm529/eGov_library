package library.board.service;

import java.util.List;

import library.board.domain.CalendarVO;

public interface CalendarService {
	
	// Board 메뉴 일정 출력
	public List<CalendarVO> calendarList();
}
