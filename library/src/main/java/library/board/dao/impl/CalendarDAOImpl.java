package library.board.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractMapper;
import library.board.dao.CalendarDAO;
import library.board.domain.CalendarVO;

@Repository
public class CalendarDAOImpl extends EgovAbstractMapper implements CalendarDAO {

	// Board메뉴 일정 출력
	@Override
	public List<CalendarVO> calendarList() {
		return selectList("Calendar.calendarList");
	}

}
