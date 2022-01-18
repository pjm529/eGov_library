package library.board.dao;

import java.util.List;

import library.board.domain.CalendarVO;
import library.common.domain.DateVO;

public interface CalendarDAO {

	// Board 메뉴 일정 출력
	public List<CalendarVO> calendarList();

	// Admin 메뉴 일정 리스트 출력
	public List<CalendarVO> calendarListYM(DateVO date);

	// 일정 추가
	public void insertCalendar(CalendarVO cal);

	// 일정 삭제
	public void deleteCalendar(int calNo);

	// 휴관일 검색
	public List<CalendarVO> searchClosed(DateVO date);
}
