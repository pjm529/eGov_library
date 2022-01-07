package library.board.dao;

import java.util.List;

import library.board.domain.CalendarVO;

public interface CalendarDAO {

	// Board 메뉴 일정 출력
	public List<CalendarVO> calendarList();
}
