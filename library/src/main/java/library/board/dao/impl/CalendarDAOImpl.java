package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.CalendarDAO;
import library.board.domain.CalendarVO;
import library.common.domain.DateVO;

@Repository
public class CalendarDAOImpl extends EgovAbstractMapper implements CalendarDAO {

	// Board메뉴 일정 출력
	@Override
	public List<CalendarVO> calendarList() {
		return selectList("Calendar.calendarList");
	}

	// Admin 메뉴 일정 리스트 출력
	@Override
	public List<CalendarVO> calendarListYM(DateVO date) {
		return selectList("Calendar.calendarListYM", date);
	}

	// 일정 추가
	@Override
	public void insertCalendar(CalendarVO cal) {
		insert("Calendar.insertCalendar", cal);
	}

}
