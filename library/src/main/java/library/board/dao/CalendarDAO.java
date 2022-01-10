package library.board.dao;

import java.util.List;

import library.board.domain.CalendarVO;
import library.common.domain.DateVO;

public interface CalendarDAO {

	// Board 메뉴 일정 출력
	public List<CalendarVO> calendarList();
	
	// Admin 메뉴 일정 리스트 출력
	public List<CalendarVO> calendarListYM(DateVO date);
}
